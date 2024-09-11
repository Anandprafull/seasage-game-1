import 'package:flame/game.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/components/animals/animal.dart';

class WhaleShark extends Animal {
  WhaleShark({
    required super.isGoingRight,
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  static const double minDepth = 10;
  static const double maxDepth = 2000;

  @override
  double get animalWidth => 150;

  @override
  String get image => 'whale_shark.png';

  @override
  Vector2 get floatingVelocity => Vector2(1 * Constants.fishVelocityMultiplier, 0);
}
