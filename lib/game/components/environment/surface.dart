import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/dive_game.dart';

class Surface extends ParallaxComponent<DiveGame> {
  Surface({required Vector2 position})
      : super(
          position: position,
          size: Vector2(Constants.worldWidthWithOffset, 500),
          anchor: Anchor.bottomCenter, // Draw it above the line
        );

  @override
  FutureOr<void> onLoad() async {
    parallax = await game.loadParallax(
      [
        ParallaxImageData('parallax/surface/1.jpg'),
        ParallaxImageData('parallax/surface/2.png'),
        ParallaxImageData('parallax/surface/3.png'),
        ParallaxImageData('parallax/surface/4.png'),
        ParallaxImageData('parallax/surface/5.png'),
      ],
      baseVelocity: Vector2.zero(), // If the player doesn't move, the background doesn't move
      velocityMultiplierDelta: Vector2(1.1, 1), // Speed between parallax layers
      repeat: ImageRepeat.repeatX, // Repeat the background image for X and Y
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Only move the surface on X axis when the player moves
    parallax?.baseVelocity.x = game.world.diver.velocity.x * Constants.surfaceVelocityMultiplier;
  }
}
