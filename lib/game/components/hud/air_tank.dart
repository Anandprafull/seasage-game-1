import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:plasticdive/game/dive_game.dart';

class AirTank extends SpriteComponent with HasGameReference<DiveGame> {
  double initialTimeInSeconds;
  double remainingTimeInSeconds = 0;

  double get percentageRemaining => remainingTimeInSeconds / initialTimeInSeconds;

  late TextComponent remainingText;

  AirTank(
      {required ValueNotifier<double> remainingTimeNotifier,
      required this.initialTimeInSeconds,
      required double gameWidth,
      required double gameHeight})
      : super(
          size: Vector2(150, 50),
          position: (gameWidth <= gameHeight)
              ?
              // On the side of the screen
              Vector2(40, gameHeight / 4 - 30)
              // On top of the screen
              : Vector2(gameWidth / 2 + 30, 20),
          anchor: (gameWidth <= gameHeight) ? Anchor.center : Anchor.topLeft,
          angle: (gameWidth <= gameHeight) ? 33 : 0,
        ) {
    remainingTimeInSeconds = initialTimeInSeconds;

    // Add callback to update remainingTimeInSeconds
    remainingTimeNotifier.addListener(() {
      remainingTimeInSeconds = remainingTimeNotifier.value;
    });
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await game.loadSprite('ui/air-tank.png');

    add(remainingText = TextComponent(
      text: "${(percentageRemaining * 100).toStringAsFixed(0)}%",
      position: Vector2(75, 15),
      textRenderer: TextPaint(style: const TextStyle(fontFamily: 'PixeloidSans', fontSize: 15, color: Colors.white)),
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    remainingText.text = "${(percentageRemaining * 100).toStringAsFixed(0)}%";
  }

  @override
  void render(Canvas canvas) {
    // Dark background
    canvas.drawRect(
      Rect.fromLTWH(40, 10, size.x - 40, 30),
      Paint()..color = Colors.grey.withOpacity(0.5),
    );

    // Remaining time bar
    canvas.drawRect(
      Rect.fromLTWH(40, 10, (size.x - 40) * percentageRemaining, 30),
      Paint()..color = percentageRemaining < 0.20 ? Colors.redAccent : (percentageRemaining < 0.40 ? Colors.orangeAccent : Colors.lightBlueAccent),
    );

    // Keep this under to have the bottle (sprite) on top
    super.render(canvas);
  }
}
