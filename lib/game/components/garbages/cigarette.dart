import 'package:plasticdive/game/components/components.dart';

class Cigarette extends Garbage {
  Cigarette({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'cigarette.png';

  @override
  int get points => 20;

  @override
  double get garbageWidth => 35;

  @override
  String get name => 'Cigarette';
}
