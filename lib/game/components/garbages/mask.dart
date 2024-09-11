import 'package:plasticdive/game/components/components.dart';

class Mask extends Garbage {
  Mask({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'mask.png';

  @override
  int get points => 30;

  @override
  double get garbageWidth => 25;

  @override
  String get name => 'Mask';
}
