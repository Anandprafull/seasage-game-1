import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/components/components.dart';
import 'package:plasticdive/game/dive_game.dart';

class DiveWorld extends World with HasGameReference<DiveGame>, HasCollisionDetection {
  late Diver diver;

  // late DiverTrail diverTrail;

  final _random = Random();

  final double worldDeepness;

  final int swimmingSpeedLevel;
  final int diveDepthLevel;

  Vector2 get size => (parent as FlameGame).size;

  DiveWorld({required this.worldDeepness, required this.diveDepthLevel, required this.swimmingSpeedLevel});

  @override
  Future<void> onLoad() async {
    final Vector2 surfaceLevel = Vector2(0, 0);
    final Vector2 floorLevel = Vector2(0, worldDeepness);
    final Vector2 leftCliffPosition = Vector2(-Constants.worldWidth / 2, 0);
    final Vector2 rightCliffPosition = Vector2(Constants.worldWidth / 2, 0);

    add(diver = Diver(
      swimmingSpeedLevel: swimmingSpeedLevel,
      worldDeepness: worldDeepness,
      joystick: game.joystick,
      onGarbageCollisionStart: (garbage) => game.enableCollectButton(garbage),
      onGarbageCollisionEnd: (garbage) => game.disableCollectButton(garbage),
      remainingCollectTime: game.remainingCollectTime,
      onStartCollecting: (garbage) => game.startCollecting(garbage),
    ));
    // add(diverTrail = DiverTrail(diver: diver));

    add(
      SpawnComponent.periodRange(
        factory: (_) => Garbage.random(
          maxWorldDeepness: worldDeepness,
          random: _random,
        ),
        minPeriod: 0.5,
        maxPeriod: Constants.animalMaxSpawnTime[diveDepthLevel],
        area: Rectangle.fromPoints(
          Vector2(-Constants.worldWidth / 2, surfaceLevel.y + 10),
          Vector2(Constants.worldWidth / 2, worldDeepness),
        ),
        random: _random,
      ),
    );

    add(
      SpawnComponent.periodRange(
        factory: (_) => Animal.random(
          diveDepthLevel: diveDepthLevel,
          maxWorldDeepness: worldDeepness,
          random: _random,
        ),
        minPeriod: 1,
        maxPeriod: Constants.animalMaxSpawnTime[diveDepthLevel],
        selfPositioning: true,
        random: _random,
      ),
    );

    add(Surface(position: surfaceLevel)); 
    add(Floor(position: floorLevel)); 
    add(Cliff(position: leftCliffPosition, isLeft: true, worldDeepness: worldDeepness));
    add(Cliff(position: rightCliffPosition, isLeft: false, worldDeepness: worldDeepness));

    game.camera.follow(diver);
  }
}
