import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:plasticdive/game/dive_game.dart';

class Nanometer extends PositionComponent with HasGameReference<DiveGame> {
  late TextComponent<TextRenderer> diveDepthTextComponent;
  final double maxDepth;
  double currentDepth = 0;

  Nanometer({required ValueNotifier<double> diveDepthNotifier, required this.maxDepth, required double gameWidth, required double gameHeight})
      : super(
          size: Vector2(50, 50),
          position: (gameWidth <= gameHeight)
              ?
              // On the side of the screen
              Vector2(gameWidth - 20, gameHeight / 4 - 30)
              // On top of the screen
              : Vector2(gameWidth / 2 - 30, 20),
          anchor: Anchor.topRight,
        ) {
    diveDepthNotifier.addListener(() {
      currentDepth = diveDepthNotifier.value;
    });
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // sprite = await game.loadSprite('ui/nanometer.png');

    add(diveDepthTextComponent = TextComponent(
      text: "0.00m",
      position: Vector2(7, 7),
      textRenderer: TextPaint(style: const TextStyle(fontFamily: 'PixeloidSans', fontSize: 12, color: Colors.black)),
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    diveDepthTextComponent.text = "${currentDepth.toStringAsFixed(2)}m";
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Draw a black circle to cover the nanometer
    canvas.drawCircle(const Offset(25, 25), 30, Paint()..color = Colors.black);

    // Draw a white circle to cover the nanometer
    canvas.drawCircle(const Offset(25, 25), 25, Paint()..color = Colors.white);

    // Draw the needle of the nanometer with a red line and the angle
    final angle = (currentDepth / maxDepth * 100) * pi;
    final radians = angle * pi;
    final x = 25 + 20 * cos(radians);
    final y = 25 + 20 * sin(radians);
    canvas.drawLine(
        const Offset(25, 25),
        Offset(x, y),
        Paint()
          ..strokeWidth = 3
          ..color = Colors.red);

    // Draw the center of the nanometer
    canvas.drawCircle(const Offset(25, 25), 4, Paint()..color = Colors.black);
  }
}
