import 'package:plasticdive/game/components/components.dart';

class Bottle extends Garbage {
  Bottle({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'bottle.png';

  @override
  int get points => 30;

  @override
  double get garbageWidth => 45;

  @override
  String get name => 'Bottle';
}
