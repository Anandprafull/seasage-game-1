import 'package:plasticdive/game/components/components.dart';

class Stirrer extends Garbage {
  Stirrer({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'stirrer.png';

  @override
  int get points => 10;

  @override
  double get garbageWidth => 35;

  @override
  String get name => 'Stirrer';
}
