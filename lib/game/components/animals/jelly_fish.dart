import 'package:flame/game.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/components/animals/animal.dart';

class JellyFish extends Animal {
  JellyFish({
    required super.isGoingRight,
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  static const double minDepth = 10;
  static const double maxDepth = 3000;

  @override
  double get animalWidth => 35;

  @override
  String get image => 'jelly_fish.png';

  @override
  Vector2 get floatingVelocity => Vector2(0, 0.2 * Constants.fishVelocityMultiplier);
}
