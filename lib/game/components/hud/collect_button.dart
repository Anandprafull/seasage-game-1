import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';

class CollectButton extends SpriteButtonComponent {
  static const double buttonWidth = 150;
  static const double buttonHeight = 75;

  final TextComponent timeText = TextComponent(
    text: 'Collect',
    textRenderer: TextPaint(style: const TextStyle(fontFamily: 'PixeloidSans', fontSize: 17, color: Colors.white)),
    position: Vector2(buttonWidth / 2, buttonHeight / 2 - 7),
    anchor: Anchor.center,
  );

  CollectButton({required double gameWidth, required double gameHeight})
      : super(
          size: Vector2(buttonWidth, buttonHeight),
          position: Vector2(gameWidth - 20, gameHeight - 20),
          anchor: Anchor.bottomRight,
        );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    add(timeText);

    disable(); // Disable button by default
  }

  FutureOr<void> disable() async {
    onPressed = null;
    button = await Sprite.load('ui/button-disabled.png');
    buttonDown = await Sprite.load('ui/button-disabled.png');
    timeText.text = "Collect";
  }

  FutureOr<void> enable({required double collectionTimeInSeconds, required void Function()? onPressed}) async {
    this.onPressed = onPressed;
    button = await Sprite.load('ui/button-up.png');
    buttonDown = await Sprite.load('ui/button-down.png');
    timeText.text = "Collect ${collectionTimeInSeconds.toStringAsFixed(2)}s";
  }
}
