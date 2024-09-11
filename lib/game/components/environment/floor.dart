import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/painting.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/dive_game.dart';

class Floor extends ParallaxComponent<DiveGame> {
  Floor({
    required Vector2 position,
  }) : super(
          position: position,
          size: Vector2(Constants.worldWidthWithOffset, 500),
          anchor: Anchor.topCenter, // Draw it under the line
        );

  @override
  FutureOr<void> onLoad() async {
    parallax = await game.loadParallax(
      [
        ParallaxImageData('parallax/floor.png'),
      ],
      baseVelocity: Vector2.zero(), // If the player doesn't move, the background doesn't move
      velocityMultiplierDelta: Vector2(1.1, 1.1), // Speed between parallax layers
      repeat: ImageRepeat.repeat, // Repeat the background image for X and Y
    );
  }

// @override
// void render(Canvas canvas) {
//   super.render(canvas);
//   canvas.drawRect(size.toRect(), Paint()..color = const Color(0xFF00FF00));
// }
}
