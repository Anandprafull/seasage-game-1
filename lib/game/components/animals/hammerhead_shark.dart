import 'package:flame/game.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/components/animals/animal.dart';

class HammerheadShark extends Animal {
  HammerheadShark({
    required super.isGoingRight,
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  static const double minDepth = 3000;
  static const double maxDepth = 6000;

  @override
  String get image => 'hammerhead_shark.png';

  @override
  double get animalWidth => 150;

  @override
  Vector2 get floatingVelocity => Vector2(1.5 * Constants.fishVelocityMultiplier, 0);
}
