import 'package:plasticdive/game/components/components.dart';

class YogurtCup extends Garbage {
  YogurtCup({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'yogurt_cup.png';

  @override
  int get points => 40;

  @override
  double get garbageWidth => 35;

  @override
  String get name => 'Yogurt cup';
}
