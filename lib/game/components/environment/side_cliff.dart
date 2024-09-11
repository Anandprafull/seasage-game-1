import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/painting.dart';
import 'package:plasticdive/game/dive_game.dart';

class Cliff extends ParallaxComponent<DiveGame> {
  final bool isLeft;

  Cliff({
    required Vector2 position,
    required this.isLeft,
    required double worldDeepness,
  }) : super(
          position: position,
          size: Vector2(1000, worldDeepness),
          anchor: isLeft ? Anchor.topRight : Anchor.topLeft, // Draw it under the line
        );

  @override
  FutureOr<void> onLoad() async {
    parallax = await game.loadParallax(
      [
        ParallaxImageData(isLeft ? 'parallax/left-side-cliff.png' : 'parallax/right-side-cliff.png'),
      ],
      size: size,
      alignment: isLeft ? Alignment.topRight : Alignment.topLeft,
      baseVelocity: Vector2.zero(), // If the player doesn't move, the background doesn't move
      velocityMultiplierDelta: Vector2(1.1, 1.1), // Speed between parallax layers
      repeat: ImageRepeat.repeatY, // Repeat the background image for X and Y
    );
  }
}
