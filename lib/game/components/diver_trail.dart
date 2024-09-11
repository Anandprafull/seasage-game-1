import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:plasticdive/game/components/components.dart';

class DiverTrail extends Component with HasPaint {
  final Diver diver;
  final trail = <Offset>[];
  final _trailLength = 50;

  DiverTrail({required this.diver});

  @override
  Future<void> onLoad() async {
    paint
      ..color = Colors.white
      ..strokeWidth = 1.0;
  }

  @override
  void update(double dt) {
    if (diver.velocity.length > 0) {
      // Remove the oldest point if the trail is too long
      if (trail.length > _trailLength) {
        trail.removeAt(0);
      }

      // Add the diver's position to the trail
      trail.add(diver.position.toOffset());
    } else if (trail.isNotEmpty) {
      // Remove the oldest point when the diver is not moving
      trail.removeAt(0);
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawPoints(PointMode.polygon, trail, paint);
  }
}
