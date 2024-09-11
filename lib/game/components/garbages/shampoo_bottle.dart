import 'package:plasticdive/game/components/components.dart';

class ShampooBottle extends Garbage {
  ShampooBottle({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'shampoo_bottle.png';

  @override
  int get points => 30;

  @override
  double get garbageWidth => 45;

  @override
  String get name => 'Shampoo bottle';
}
