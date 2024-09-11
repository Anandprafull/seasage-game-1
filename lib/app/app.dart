import 'package:plasticdive/app/custom_route_transition.dart';
import 'package:plasticdive/services/diver_upgrade_service.dart';
import 'package:plasticdive/services/leaderboard_service.dart';
import 'package:plasticdive/services/shared_preferences_service.dart';
import 'package:plasticdive/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:plasticdive/ui/dialogs/infocean_details/infocean_details_dialog.dart';
import 'package:plasticdive/ui/views/about/about_view.dart';
import 'package:plasticdive/ui/views/after_game/after_game_view.dart';
import 'package:plasticdive/ui/views/game/game_view.dart';
import 'package:plasticdive/ui/views/home/home_view.dart';
import 'package:plasticdive/ui/views/how_to_play/how_to_play_view.dart';
import 'package:plasticdive/ui/views/infocean/infocean_view.dart';
import 'package:plasticdive/ui/views/leaderboard/leaderboard_view.dart';
import 'package:plasticdive/ui/views/level_up_diver/level_up_diver_view.dart';
import 'package:plasticdive/ui/views/settings/settings_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_shared/stacked_shared.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: HomeView, initial: true, path: '/', transitionsBuilder: CustomRouteTransition.sharedAxis),
    CustomRoute(page: GameView, path: '/play', transitionsBuilder: CustomRouteTransition.sharedAxis),
    CustomRoute(page: LeaderboardView, path: '/leaderboard', transitionsBuilder: CustomRouteTransition.sharedAxis),
    CustomRoute(page: SettingsView, path: '/settings', transitionsBuilder: CustomRouteTransition.sharedAxis),
    CustomRoute(page: AboutView, path: '/about', transitionsBuilder: CustomRouteTransition.sharedAxis),
    CustomRoute(page: InfoceanView, path: '/infocean', transitionsBuilder: CustomRouteTransition.sharedAxis),
    CustomRoute(page: AfterGameView, path: '/well-played', transitionsBuilder: CustomRouteTransition.sharedAxis),
    CustomRoute(page: LevelUpDiverView, path: '/level-up', transitionsBuilder: CustomRouteTransition.sharedAxis),
    CustomRoute(page: HowToPlayView, path: '/how-to-play', transitionsBuilder: CustomRouteTransition.sharedAxis),
    // @stacked-route
  ],
  dependencies: [
    InitializableSingleton(classType: SharedPreferencesService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LeaderboardService),
    LazySingleton(classType: DiverUpgradeService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoceanDetailsDialog),
    // @stacked-dialog
  ],
)
class App {}
