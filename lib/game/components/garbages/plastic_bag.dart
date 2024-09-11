import 'package:plasticdive/game/components/components.dart';

class PlasticBag extends Garbage {
  PlasticBag({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'plastic_bag.png';

  @override
  int get points => 20;

  @override
  double get garbageWidth => 50;

  @override
  String get name => 'Plastic bag';
}
