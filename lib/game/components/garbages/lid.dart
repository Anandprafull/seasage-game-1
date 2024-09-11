import 'package:plasticdive/game/components/components.dart';

class Lid extends Garbage {
  Lid({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'lid.png';

  @override
  int get points => 10;

  @override
  double get garbageWidth => 20;

  @override
  String get name => 'Lid';
}
