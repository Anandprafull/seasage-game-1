import 'package:plasticdive/game/components/components.dart';

class SodaCan extends Garbage {
  SodaCan({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'soda_can.png';

  @override
  int get points => 40;

  @override
  double get garbageWidth => 40;

  @override
  String get name => 'Soda can';
}
