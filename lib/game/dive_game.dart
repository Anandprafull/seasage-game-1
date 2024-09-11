import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/components/components.dart';
import 'package:plasticdive/game/dive_world.dart';

class DiveGame extends FlameGame<DiveWorld> with HasKeyboardHandlerComponents {
  final double gameHeight;
  final double gameWidth;

  // Debug
  @override
  bool get debugMode => false;

  bool isPaused = false;

  // Value Notifiers
  final score = ValueNotifier(0);
  final diveDepth = ValueNotifier(0.0);
  bool hasDived = false;
  ValueNotifier<double> remainingTime;

  Map<String, int> collectedGarbage = {};

  // Timer
  final countdownTimer = Timer(0.1, autoStart: true, repeat: true);

  final ValueNotifier<double> remainingCollectTime = ValueNotifier(0.0);
  final remainingCollectTimeTimer = Timer(0.5, autoStart: false, repeat: true);

  Function(bool hasWon, int score, Map<String, int>? collectedGarbage) onGameOver;
  int airTankLevel;
  int swimmingSpeedLevel;
  int collectingSpeedLevel;
  int diveDepthLevel;
  int previousHighScore;
  bool isSoundEnabled;
  late Joystick joystick;
  late CollectButton collectButton;
  late Background background;

  late RectangleComponent darkenEffect;

  DiveGame({
    required this.gameHeight,
    required this.gameWidth,
    required this.onGameOver,
    required this.airTankLevel,
    required this.swimmingSpeedLevel,
    required this.collectingSpeedLevel,
    required this.diveDepthLevel,
    required this.previousHighScore,
    required this.isSoundEnabled,
  })  : remainingTime = ValueNotifier(Constants.airTankCapacityInSeconds[airTankLevel]),
        super(
          world: DiveWorld(
            worldDeepness: Constants.worldDeepness[diveDepthLevel],
            diveDepthLevel: diveDepthLevel,
            swimmingSpeedLevel: swimmingSpeedLevel,
          ),
          camera: CameraComponent.withFixedResolution(width: gameWidth, height: gameHeight),
        );

  @override
  FutureOr<void> onLoad() async {
    // Music
    if (isSoundEnabled) {
      FlameAudio.bgm.initialize();
      await FlameAudio.bgm.play('music/AtDepth-LishGrooves.mp3', volume: 0.5);
    }

    // Camera + viewport
    await camera.backdrop.add(background = Background(size: Vector2(Constants.worldWidthWithOffset, Constants.worldDeepness[diveDepthLevel])));

    if (debugMode) {
      await camera.viewport.add(FpsTextComponent(position: Vector2(gameWidth - 20, 20), anchor: Anchor.topRight));
    }

    final highScoreImage = await images.load('ui/high-score.png');
    await camera.viewport.add(Score(scoreNotifier: score, previousHighScore: previousHighScore, highScoreStampImage: highScoreImage));
    await camera.viewport.add(AirTank(
        remainingTimeNotifier: remainingTime,
        initialTimeInSeconds: Constants.airTankCapacityInSeconds[airTankLevel],
        gameWidth: gameWidth,
        gameHeight: gameHeight));
    await camera.viewport
        .add(Nanometer(diveDepthNotifier: diveDepth, maxDepth: Constants.worldDeepness.last, gameWidth: gameWidth, gameHeight: gameHeight));

    final backgroundImage = await images.load('ui/joystick-background.png');
    final knobImage = await images.load('ui/joystick-knob.png');
    await camera.viewport.add(joystick = Joystick(backgroundImage: backgroundImage, knobImage: knobImage, gameHeight: gameHeight));
    await camera.viewport.add(collectButton = CollectButton(gameHeight: gameHeight, gameWidth: gameWidth));

    await camera.viewport.add(PauseButton(gameWidth: gameWidth));

    // Darken the world as we go deeper
    await camera.viewport.add(darkenEffect = RectangleComponent(
      size: Vector2(gameWidth, gameHeight),
      paint: Paint()..color = const Color(0x00000000),
      priority: -100,
    ));

    // Add callback to update score text
    countdownTimer.onTick = () {
      remainingTime.value -= countdownTimer.limit;

      // Add a message to the player at the center of the screen when the air tank is almost empty
      if (remainingTime.value <= 10 && remainingTime.value > 9.5) {
        camera.viewport.add(
          ScrollTextBoxComponent(
            size: Vector2(gameWidth * 0.8, 100),
            text: 'Air tank almost empty! Go to surface before it\'s too late!',
            position: Vector2(gameWidth / 2, gameHeight - 100),
            anchor: Anchor.center,
            textRenderer: TextPaint(style: TextStyle(fontFamily: 'PixeloidSans', fontSize: 16, color: Colors.white.withOpacity(0.3))),
          ),
        );

        if (isSoundEnabled) {
          FlameAudio.play('sfx/air-tank-almost-empty.mp3', volume: 0.5);
        }
      }

      if (remainingTime.value <= 0) {
        // Time is over -> player lost
        endTheGame(false, score.value);
      }
    };

    remainingCollectTimeTimer.onTick = () {
      remainingCollectTime.value -= remainingCollectTimeTimer.limit;
      if (remainingCollectTime.value <= 0) {
        remainingCollectTimeTimer.stop();
        remainingCollectTimeTimer.reset();
      }
    };

    diveDepth.addListener(() {
      if (!hasDived && diveDepth.value > 0.2) {
        hasDived = true;
      }

      if (hasDived && diveDepth.value <= 0.1) {
        endTheGame(true, score.value);
      }

      // Update the darken effect
      darkenEffect.paint = Paint()..color = Color.fromRGBO(0, 0, 0, diveDepth.value * 0.025);
    });

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isPaused) return;
    countdownTimer.update(dt);
    remainingCollectTimeTimer.update(dt);
  }

  void enableCollectButton(Garbage garbage) {
    // Add keyboard press event
    collectButton.enable(
      collectionTimeInSeconds: garbage.collectionTimeWithSpeedFactor,
      onPressed: () => world.diver.collectGarbage(garbage),
    );
  }

  void disableCollectButton(Garbage garbage) {
    collectButton.disable();
  }

  void pauseGame() {
    isPaused = true;
    // countdownTimer.pause();
    // remainingCollectTimeTimer.pause();
    FlameAudio.bgm.pause();
    overlays.add('PauseMenu');
  }

  void endTheGame(bool hasWon, int score) {
    pauseEngine();

    countdownTimer.stop();
    remainingCollectTimeTimer.stop();

    if (isSoundEnabled) {
      FlameAudio.bgm.stop();
      FlameAudio.play(hasWon ? 'sfx/game-win.mp3' : 'sfx/game-over.mp3', volume: 0.4);
    }

    onGameOver(hasWon, score, collectedGarbage);
  }

  startCollecting(Garbage garbage) {
    remainingCollectTime.value = garbage.collectionTimeWithSpeedFactor;
    remainingCollectTimeTimer.reset();
    remainingCollectTimeTimer.start();
  }

  void resumeGame() {
    FlameAudio.bgm.resume();
    overlays.clear();
    isPaused = false;
    // remainingCollectTimeTimer.resume();
    // countdownTimer.resume();
    // overlays.remove('PauseMenu');
    resumeEngine();
  }

  void exitGame() {
    endTheGame(false, score.value);
  }

  void addCollectedGarbage(Garbage garbage) {
    if (collectedGarbage.containsKey(garbage.name)) {
      collectedGarbage[garbage.name] = collectedGarbage[garbage.name]! + 1;
    } else {
      collectedGarbage[garbage.name] = 1;
    }
  }
}
