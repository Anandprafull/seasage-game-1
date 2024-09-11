import 'package:flame/game.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/components/animals/animal.dart';

class ClownFish extends Animal {
  ClownFish({
    required super.isGoingRight,
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  static const double minDepth = 10;
  static const double maxDepth = 1000;

  @override
  String get image => 'clown_fish.png';

  @override
  double get animalWidth => 35;

  @override
  Vector2 get floatingVelocity => Vector2(0.5 * Constants.fishVelocityMultiplier, 0);
}
