import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/components/components.dart';
import 'package:plasticdive/game/components/garbages/bottle.dart';
import 'package:plasticdive/game/components/garbages/cigarette.dart';
import 'package:plasticdive/game/components/garbages/coffee_cup.dart';
import 'package:plasticdive/game/components/garbages/cotton_rod.dart';
import 'package:plasticdive/game/components/garbages/cutlery.dart';
import 'package:plasticdive/game/components/garbages/food_packaging.dart';
import 'package:plasticdive/game/components/garbages/household_cleaner_bottle.dart';
import 'package:plasticdive/game/components/garbages/lid.dart';
import 'package:plasticdive/game/components/garbages/mask.dart';
import 'package:plasticdive/game/components/garbages/microplastic_cloud.dart';
import 'package:plasticdive/game/components/garbages/plastic_bag.dart';
import 'package:plasticdive/game/components/garbages/shampoo_bottle.dart';
import 'package:plasticdive/game/components/garbages/soda_can.dart';
import 'package:plasticdive/game/components/garbages/stirrer.dart';
import 'package:plasticdive/game/components/garbages/straw.dart';
import 'package:plasticdive/game/components/garbages/tooth_brush.dart';
import 'package:plasticdive/game/components/garbages/yogurt_cup.dart';
import 'package:plasticdive/game/dive_game.dart';

enum GarbageType {
  bottle,
  sodaCan,
  householdCleanerBottle,
  shampooBottle,
  plasticBag,
  straw,
  microplasticCloud,
  cottonRod,
  lid,
  stirrer,
  cutlery,
  coffeeCup,
  toothbrush,
  yogurtCup,
  foodPackaging,
  cigarette,
  mask,
}

abstract class Garbage extends SpriteComponent with HasGameReference<DiveGame>, CollisionCallbacks {
  abstract final String name;
  abstract final int points;

  ColorEffect? effect;

  int get collectionTimeInSeconds => points ~/ 10;

  double get collectionTimeWithSpeedFactor => collectionTimeInSeconds / Constants.collectSpeedFactor[game.collectingSpeedLevel];

  abstract final String image;

  Vector2 floatingVelocity = Vector2(10, 10);

  final double maxWorldDeepness;
  abstract final double garbageWidth;

  bool isHighlighted = false;
  bool isBeingCollected = false;

  Garbage({
    required this.maxWorldDeepness,
    super.position,
    super.size,
    Anchor super.anchor = Anchor.center,
  });

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('garbages/$image');
    final ratio = sprite!.originalSize.x / sprite!.originalSize.y;
    size = Vector2(garbageWidth * ratio, garbageWidth);

    final hitboxSize = size * 1.5;
    add(RectangleHitbox(size: hitboxSize));
  }

  Future startCollecting() async {
    isBeingCollected = true;
    await add(
      SequenceEffect([
        ScaleEffect.by(
          Vector2.all(1.5),
          EffectController(duration: collectionTimeWithSpeedFactor / 4),
        ),
        ScaleEffect.by(
          Vector2.zero(),
          EffectController(duration: collectionTimeWithSpeedFactor / 4 * 3),
        ),
      ]),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Give a floating effect to the garbage
    // Move it from -2 to 2 in the x and y axis
    // Make it turn around the center
    Random random = Random();
    int min = -2, max = 2;
    double next = (min + random.nextInt(max - min)) * random.nextDouble();
    position.add(floatingVelocity * dt * next);

    angle += dt * 0.1;

    if (position.x < -Constants.worldWidthWithOffset / 2 ||
        position.x > Constants.worldWidthWithOffset / 2 ||
        position.y < 0 ||
        position.y > maxWorldDeepness) {
      removeFromParent();
    }
  }

  factory Garbage.random({required double maxWorldDeepness, Vector2? position, Random? random}) {
    final obstacleType = GarbageType.values.random(random);
    switch (obstacleType) {
      case GarbageType.sodaCan:
        return SodaCan(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.householdCleanerBottle:
        return HouseholdCleanerBottle(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.shampooBottle:
        return ShampooBottle(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.plasticBag:
        return PlasticBag(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.straw:
        return Straw(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.microplasticCloud:
        return MicroplasticCloud(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.cottonRod:
        return CottonRod(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.lid:
        return Lid(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.stirrer:
        return Stirrer(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.cutlery:
        return Cutlery(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.coffeeCup:
        return CoffeeCup(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.toothbrush:
        return ToothBrush(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.yogurtCup:
        return YogurtCup(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.foodPackaging:
        return FoodPackaging(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.cigarette:
        return Cigarette(position: position, maxWorldDeepness: maxWorldDeepness);
      case GarbageType.mask:
        return Mask(position: position, maxWorldDeepness: maxWorldDeepness);
      // case GarbageType.bottle:
      default:
        return Bottle(position: position, maxWorldDeepness: maxWorldDeepness);
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Diver && !isBeingCollected) {
      isHighlighted = true;
      add(effect = ColorEffect(
        Colors.white,
        EffectController(duration: 0.5),
        opacityFrom: 0.2,
        opacityTo: 0.8,
      ));
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    effect?.reset();
    effect?.removeFromParent();
    super.onCollisionEnd(other);
  }
}
