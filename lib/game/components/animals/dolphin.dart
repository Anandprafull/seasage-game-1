import 'package:flame/game.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/components/animals/animal.dart';

class Dolphin extends Animal {
  Dolphin({
    required super.isGoingRight,
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  static const double minDepth = 30;
  static const double maxDepth = 1000;

  @override
  String get image => 'dolphin.png';

  @override
  double get animalWidth => 75;

  @override
  Vector2 get floatingVelocity => Vector2(2 * Constants.fishVelocityMultiplier, 0);
}
