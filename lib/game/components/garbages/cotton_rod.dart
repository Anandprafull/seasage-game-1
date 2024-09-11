import 'package:plasticdive/game/components/components.dart';

class CottonRod extends Garbage {
  CottonRod({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'cotton_rod.png';

  @override
  int get points => 10;

  @override
  double get garbageWidth => 35;

  @override
  String get name => 'Cotton rod';
}
