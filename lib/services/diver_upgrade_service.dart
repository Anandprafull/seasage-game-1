import 'package:plasticdive/app/app.locator.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/services/shared_preferences_service.dart';

class DiverUpgradeService {
  final SharedPreferencesService _sharedPreferencesService = locator<SharedPreferencesService>();

  int get airTankLevel => _sharedPreferencesService.airTankLevel;

  int get swimmingSpeedLevel => _sharedPreferencesService.swimmingSpeedLevel;

  int get collectingSpeedLevel => _sharedPreferencesService.collectingSpeedLevel;

  int get diveDepthLevel => _sharedPreferencesService.diveDepthLevel;

  int get points => _sharedPreferencesService.points;

  bool get isDiverUpgradable =>
      isAirTankUpgradeAllowed || isSwimmingSpeedUpgradeAllowed || isCollectingSpeedUpgradeAllowed || isDiveDepthUpgradeAllowed;

  bool get isAirTankUpgradeAllowed => points >= requiredPointsForAirTankUpgrade && airTankLevel < airTankLevelMax;

  bool get isSwimmingSpeedUpgradeAllowed => points >= requiredPointsForSwimmingSpeedUpgrade && swimmingSpeedLevel < swimmingSpeedLevelMax;

  bool get isCollectingSpeedUpgradeAllowed => points >= requiredPointsForCollectingSpeedUpgrade && collectingSpeedLevel < collectingSpeedLevelMax;

  bool get isDiveDepthUpgradeAllowed => points >= requiredPointsForDiveDepthUpgrade && diveDepthLevel < diveDepthLevelMax;

  int get requiredPointsForAirTankUpgrade => airTankLevel < airTankLevelMax ? Constants.requiredPointsToUpgradeSkills[airTankLevel + 1] : 0;

  int get requiredPointsForSwimmingSpeedUpgrade =>
      swimmingSpeedLevel < swimmingSpeedLevelMax ? Constants.requiredPointsToUpgradeSkills[swimmingSpeedLevel + 1] : 0;

  int get requiredPointsForCollectingSpeedUpgrade =>
      collectingSpeedLevel < collectingSpeedLevelMax ? Constants.requiredPointsToUpgradeSkills[collectingSpeedLevel + 1] : 0;

  int get requiredPointsForDiveDepthUpgrade => diveDepthLevel < diveDepthLevelMax ? Constants.requiredPointsToUpgradeSkills[diveDepthLevel + 1] : 0;

  int get airTankLevelMax => Constants.requiredPointsToUpgradeSkills.length - 1;

  int get swimmingSpeedLevelMax => Constants.requiredPointsToUpgradeSkills.length - 1;

  int get collectingSpeedLevelMax => Constants.requiredPointsToUpgradeSkills.length - 1;

  int get diveDepthLevelMax => Constants.requiredPointsToUpgradeSkills.length - 1;

  Future upgradeAirTank() async {
    await _sharedPreferencesService.addPoints(-Constants.requiredPointsToUpgradeSkills[airTankLevel + 1]);
    await _sharedPreferencesService.upgradeAirTank();
  }

  Future upgradeSwimmingSpeed() async {
    await _sharedPreferencesService.addPoints(-Constants.requiredPointsToUpgradeSkills[swimmingSpeedLevel + 1]);
    _sharedPreferencesService.upgradeSwimmingSpeed();
  }

  Future upgradeCollectingSpeed() async {
    await _sharedPreferencesService.addPoints(-Constants.requiredPointsToUpgradeSkills[collectingSpeedLevel + 1]);
    _sharedPreferencesService.upgradeCollectingSpeed();
  }

  Future upgradeDiveDepth() async {
    await _sharedPreferencesService.addPoints(-Constants.requiredPointsToUpgradeSkills[diveDepthLevel + 1]);
    _sharedPreferencesService.upgradeDiveDepth();
  }
}
