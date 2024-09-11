import 'package:flame/game.dart';
import 'package:plasticdive/game/components/animals/animal.dart';

class Coral extends Animal {
  final int number;
  Coral({
    required super.isGoingRight,
    required super.maxWorldDeepness,
    super.position,
    required this.number,
    super.size,
    super.anchor,
  });

  static const double minDepth = 10;
  static const double maxDepth = 100;

  @override
  String get image => 'coral_$number.png';

  @override
  double get animalWidth => 50;

  @override
  Vector2 get floatingVelocity => Vector2.zero();
}
