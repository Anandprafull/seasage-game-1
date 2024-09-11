import 'package:plasticdive/app/app.locator.dart';
import 'package:plasticdive/app/app.router.dart';
import 'package:plasticdive/services/diver_upgrade_service.dart';
import 'package:plasticdive/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AfterGameViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _diverUpgradeService = locator<DiverUpgradeService>();

  bool get isDiverUpgradable => _diverUpgradeService.isDiverUpgradable;

  int get highScore => _sharedPreferencesService.highScore;

  int get points => _sharedPreferencesService.points;

  Future replay() async {
    await _navigationService.replaceWithGameView();
  }

  Future navigateToHome() async {
    await _navigationService.replaceWithHomeView();
  }

  Future navigateToLeaderboard() async {
    await _navigationService.replaceWithLeaderboardView();
  }

  Future navigateToLevelUpDiver() async {
    await _navigationService.replaceWithLevelUpDiverView();
  }
}
