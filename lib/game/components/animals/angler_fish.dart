import 'package:flame/game.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/components/animals/animal.dart';

class AnglerFish extends Animal {
  AnglerFish({
    required super.isGoingRight,
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  static const double minDepth = 5000;
  static const double maxDepth = 7500;

  @override
  String get image => 'anglerfish.png';

  @override
  double get animalWidth => 75;

  @override
  Vector2 get floatingVelocity => Vector2(0.2 * Constants.fishVelocityMultiplier, 0);
}
