import 'package:plasticdive/game/components/components.dart';

class MicroplasticCloud extends Garbage {
  MicroplasticCloud({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'microplastic_cloud.png';

  @override
  int get points => 100;

  @override
  double get garbageWidth => 75;

  @override
  String get name => 'Microplastic';
}
