import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/components/components.dart';
import 'package:plasticdive/game/dive_game.dart';

class Diver extends SpriteAnimationComponent with HasGameReference<DiveGame>, CollisionCallbacks, KeyboardHandler {
  final spriteSize = Vector2(101.1, 40.0);
  static int numberSpriteFrames = 10;

  Vector2 velocity = Vector2.zero();
  double maxSpeed;

  // Used for sprite orientation
  bool isGoingRight = true;

  // Used for keys handling
  bool isMovingRight = false;
  bool isMovingLeft = false;
  bool isMovingUp = false;
  bool isMovingDown = false;

  bool isCollecting = false;

  final JoystickComponent joystick;

  Function(Garbage garbage) onGarbageCollisionStart;

  Function(Garbage garbage) onGarbageCollisionEnd;

  Function(Garbage garbage) onStartCollecting;

  final double worldDeepness;

  late CollectLoader collectLoader;

  double get divingDepth => (position.y / 250);
  TextComponent remainingCollectTimeInSeconds = TextComponent(text: '0');
  TextComponent collectedPoints = TextComponent(text: '0');

  Diver({
    required this.worldDeepness,
    required swimmingSpeedLevel,
    required this.joystick,
    required this.onGarbageCollisionStart,
    required this.onGarbageCollisionEnd,
    required ValueNotifier<double> remainingCollectTime,
    required this.onStartCollecting,
  })  : maxSpeed = Constants.maxDiverSpeed[swimmingSpeedLevel],
        super(
          position: Vector2.zero(),
          size: Vector2(101.1, 40.0),
          anchor: Anchor.center,
        ) {
    remainingCollectTime.addListener(() {
      isCollecting = remainingCollectTime.value > 0;
      remainingCollectTimeInSeconds.text = remainingCollectTime.value.toString();
    });
  }

  @override
  FutureOr<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'players/diver.png',
      SpriteAnimationData.sequenced(
        textureSize: spriteSize,
        amount: numberSpriteFrames,
        stepTime: 0.2,
      ),
    );

    add(collectLoader = CollectLoader());
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Update the remaining time
    if (remainingCollectTimeInSeconds.text != '0') {
      remainingCollectTimeInSeconds.update(dt);
    }

    if (isCollecting) {
      velocity = Vector2.zero();
      // No movement while collecting
      return;
    }

    // 1st compute the velocity
    if (!keyboardDelta.isZero()) {
      velocity = keyboardDelta * maxSpeed * dt;
    }
    else if (!joystick.delta.isZero()) {
      velocity = joystick.relativeDelta * maxSpeed * dt;
      // angle = joystick.relativeDelta.screenAngle();
    } else {
      velocity = Vector2.zero();
    }

    // 2. Modify velocity to not pass the bounds
    if (position.x + velocity.x > Constants.worldWidth / 2) {
      velocity.x = 0;
    }
    if (position.x + velocity.x < -Constants.worldWidth / 2) {
      velocity.x = 0;
    }
    if (position.y + velocity.y > worldDeepness) {
      velocity.y = 0;
    }
    if (position.y + velocity.y < 0) {
      velocity.y = 0;
    }

    // 4 Update the side + orientation of the sprite
    if (velocity.x < 0 && isGoingRight) {
      isGoingRight = false;
      flipHorizontallyAroundCenter();
    } else if (velocity.x > 0 && !isGoingRight) {
      isGoingRight = true;
      flipHorizontallyAroundCenter();
    }
    if (velocity.y < 0) {
      angle = 0.3 * (isGoingRight ? -1 : 1);
    } else if (velocity.y > 0) {
      angle = 0.3 * (isGoingRight ? 1 : -1);
    } else {
      angle = 0;
    }

    // 4. Update the position
    position.add(velocity);

    // 5. Update dive depth in the HUD
    game.diveDepth.value = divingDepth;
  }

  // Keyboard handling
  Vector2 keyboardDelta = Vector2.zero();
  static final _keysWatched = {
    LogicalKeyboardKey.arrowUp,
    LogicalKeyboardKey.arrowDown,
    LogicalKeyboardKey.arrowLeft,
    LogicalKeyboardKey.arrowRight,
    LogicalKeyboardKey.space,
  };

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);

    if (game.isPaused) return true;

    if (!_keysWatched.contains(event.logicalKey)) return true;

    if (event is KeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        keyboardDelta.y = 0;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        keyboardDelta.x = 0;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        keyboardDelta.y = 0;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        keyboardDelta.x = 0;
      }
    }

    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space) {
        // Press the button to collect the garbage if any
        game.collectButton.onPressed?.call();
      }

      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        keyboardDelta.y = -1;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        keyboardDelta.x = -1;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        keyboardDelta.y = 1;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        keyboardDelta.x = 1;
      }
    }

    return true;
  }

// Actions
  void collectGarbage(Garbage garbage) {
    if (garbage.isRemoved || garbage.isRemoving || isCollecting) return;

    var collectingTime = garbage.collectionTimeWithSpeedFactor;
    isCollecting = true;
    garbage.startCollecting();
    collectLoader.start(collectingTime: collectingTime, isFlipped: !isGoingRight);
    onStartCollecting(garbage);

    // Move that when the garbage is collected after the timeout
    int collectingTimeSeconds = collectingTime.toInt();
    double collectingTimeMilliseconds = (collectingTime - collectingTime.floor()) * 1000;
    Future.delayed(Duration(seconds: collectingTimeSeconds, milliseconds: collectingTimeMilliseconds.toInt()), () {
      garbage.removeFromParent();

      //  add a text with the points
      game.world.add(collectedPoints = TextComponent(
        text: "+${garbage.points.toString()} points",
        textRenderer: TextPaint(
            style: const TextStyle(
          fontFamily: 'PixeloidSans',
          fontSize: 17,
          color: Colors.white,
          shadows: [Shadow(blurRadius: 7, color: Colors.black, offset: Offset(0, 0))],
        )),
      ));
      collectedPoints.anchor = Anchor.center;
      collectedPoints.position = position.clone()..y -= 50;
      Future.delayed(const Duration(seconds: 2), () {
        collectedPoints.removeFromParent();
      });
      collectedPoints.add(SequenceEffect(
        [
          MoveByEffect(
            Vector2(0, -10),
            EffectController(duration: 0.5),
          ),
          MoveByEffect(
            Vector2(0, -10),
            EffectController(duration: 1),
          ),
          ScaleEffect.by(
            Vector2.zero(),
            EffectController(duration: 0.5),
          )
        ],
      ));

      isCollecting = false;
      if (game.isSoundEnabled) {
        FlameAudio.play('sfx/collected.mp3', volume: 0.4);
      }
      game.score.value += garbage.points;
      game.addCollectedGarbage(garbage);
    });
  }

// Collision callbacks
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Garbage) {
      onGarbageCollisionStart(other);
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (other is Garbage) {
      onGarbageCollisionEnd(other);
    }
  }
}
