import 'package:flame/game.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/components/animals/animal.dart';

class SeaTurtle extends Animal {
  SeaTurtle({
    required super.isGoingRight,
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  static const double minDepth = 10;
  static const double maxDepth = 2000;

  @override
  double get animalWidth => 50;

  @override
  String get image => 'sea_turtle.png';

  @override
  Vector2 get floatingVelocity => Vector2(0.5 * Constants.fishVelocityMultiplier, 0);
}