import 'package:plasticdive/game/components/components.dart';

class HouseholdCleanerBottle extends Garbage {
  HouseholdCleanerBottle({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'household_cleaner_bottle.png';

  @override
  int get points => 40;

  @override
  double get garbageWidth => 45;

  @override
  String get name => 'Household Cleaner';
}
