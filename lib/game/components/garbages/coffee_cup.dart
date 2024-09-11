import 'package:plasticdive/game/components/components.dart';

class CoffeeCup extends Garbage {
  CoffeeCup({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'coffee_cup.png';

  @override
  int get points => 30;

  @override
  double get garbageWidth => 35;

  @override
  String get name => 'Coffee cup';
}
