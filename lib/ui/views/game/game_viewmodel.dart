import 'package:plasticdive/app/app.locator.dart';
import 'package:plasticdive/app/app.router.dart';
import 'package:plasticdive/game/dive_game.dart';
import 'package:plasticdive/services/leaderboard_service.dart';
import 'package:plasticdive/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GameViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _leaderboardService = locator<LeaderboardService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();

  int get points => _sharedPreferencesService.points;

  int get highScore => _sharedPreferencesService.highScore;

  int get airTankLevel => _sharedPreferencesService.airTankLevel;

  int get swimmingSpeedLevel => _sharedPreferencesService.swimmingSpeedLevel;

  int get collectingSpeedLevel => _sharedPreferencesService.collectingSpeedLevel;

  int get diveDepthLevel => _sharedPreferencesService.diveDepthLevel;

  bool get isSoundEnabled => _sharedPreferencesService.isSoundEnabled;

  Future onGameOver(bool isWon, int? score, Map<String, int>? collectedGarbage) async {
    if (isWon && score != null) {
      await _sharedPreferencesService.addPoints(score);
      await _leaderboardService.addScore(LeaderboardEntry(
        pseudo: _sharedPreferencesService.username,
        score: score,
        airTankLevel: airTankLevel,
        collectingSpeedLevel: collectingSpeedLevel,
        diveDepthLevel: diveDepthLevel,
        swimmingSpeedLevel: swimmingSpeedLevel,
      ));

      if (score > highScore) {
        await _sharedPreferencesService.setHighScore(score);
      }

      if (collectedGarbage?.isNotEmpty == true) {
        await _sharedPreferencesService.addUnlockedGarbage(collectedGarbage!);
      }
    }
    await _navigationService.replaceWithAfterGameView(isWon: isWon, score: score);
  }

  void resumeGame(DiveGame game) {
    game.resumeGame();
  }

  void exitGame(DiveGame game) {
    game.exitGame();
  }
}
