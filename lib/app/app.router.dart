// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:plasticdive/app/custom_route_transition.dart' as _i12;
import 'package:plasticdive/ui/views/about/about_view.dart' as _i6;
import 'package:plasticdive/ui/views/after_game/after_game_view.dart' as _i8;
import 'package:plasticdive/ui/views/game/game_view.dart' as _i3;
import 'package:plasticdive/ui/views/home/home_view.dart' as _i2;
import 'package:plasticdive/ui/views/how_to_play/how_to_play_view.dart' as _i10;
import 'package:plasticdive/ui/views/infocean/infocean_view.dart' as _i7;
import 'package:plasticdive/ui/views/leaderboard/leaderboard_view.dart' as _i4;
import 'package:plasticdive/ui/views/level_up_diver/level_up_diver_view.dart' as _i9;
import 'package:plasticdive/ui/views/settings/settings_view.dart' as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i13;

class Routes {
  static const homeView = '/';

  static const gameView = '/play';

  static const leaderboardView = '/leaderboard';

  static const settingsView = '/settings';

  static const aboutView = '/about';

  static const infoceanView = '/infocean';

  static const afterGameView = '/well-played';

  static const levelUpDiverView = '/level-up';

  static const howToPlayView = '/how-to-play';

  static const all = <String>{
    homeView,
    gameView,
    leaderboardView,
    settingsView,
    aboutView,
    infoceanView,
    afterGameView,
    levelUpDiverView,
    howToPlayView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.gameView,
      page: _i3.GameView,
    ),
    _i1.RouteDef(
      Routes.leaderboardView,
      page: _i4.LeaderboardView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i5.SettingsView,
    ),
    _i1.RouteDef(
      Routes.aboutView,
      page: _i6.AboutView,
    ),
    _i1.RouteDef(
      Routes.infoceanView,
      page: _i7.InfoceanView,
    ),
    _i1.RouteDef(
      Routes.afterGameView,
      page: _i8.AfterGameView,
    ),
    _i1.RouteDef(
      Routes.levelUpDiverView,
      page: _i9.LevelUpDiverView,
    ),
    _i1.RouteDef(
      Routes.howToPlayView,
      page: _i10.HowToPlayView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i11.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => const _i2.HomeView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i12.CustomRouteTransition.sharedAxis,
      );
    },
    _i3.GameView: (data) {
      return _i11.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => const _i3.GameView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i12.CustomRouteTransition.sharedAxis,
      );
    },
    _i4.LeaderboardView: (data) {
      return _i11.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => const _i4.LeaderboardView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i12.CustomRouteTransition.sharedAxis,
      );
    },
    _i5.SettingsView: (data) {
      return _i11.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => const _i5.SettingsView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i12.CustomRouteTransition.sharedAxis,
      );
    },
    _i6.AboutView: (data) {
      return _i11.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => const _i6.AboutView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i12.CustomRouteTransition.sharedAxis,
      );
    },
    _i7.InfoceanView: (data) {
      return _i11.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => const _i7.InfoceanView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i12.CustomRouteTransition.sharedAxis,
      );
    },
    _i8.AfterGameView: (data) {
      final args = data.getArgs<AfterGameViewArguments>(nullOk: false);
      return _i11.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => _i8.AfterGameView(isWon: args.isWon, score: args.score, key: args.key),
        settings: data,
        transitionsBuilder: data.transition ?? _i12.CustomRouteTransition.sharedAxis,
      );
    },
    _i9.LevelUpDiverView: (data) {
      return _i11.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => const _i9.LevelUpDiverView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i12.CustomRouteTransition.sharedAxis,
      );
    },
    _i10.HowToPlayView: (data) {
      final args = data.getArgs<HowToPlayViewArguments>(
        orElse: () => const HowToPlayViewArguments(),
      );
      return _i11.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => _i10.HowToPlayView(goToGameOnComplete: args.goToGameOnComplete, key: args.key),
        settings: data,
        transitionsBuilder: data.transition ?? _i12.CustomRouteTransition.sharedAxis,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AfterGameViewArguments {
  const AfterGameViewArguments({
    required this.isWon,
    this.score,
    this.key,
  });

  final bool isWon;

  final int? score;

  final _i11.Key? key;

  @override
  String toString() {
    return '{"isWon": "$isWon", "score": "$score", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AfterGameViewArguments other) {
    if (identical(this, other)) return true;
    return other.isWon == isWon && other.score == score && other.key == key;
  }

  @override
  int get hashCode {
    return isWon.hashCode ^ score.hashCode ^ key.hashCode;
  }
}

class HowToPlayViewArguments {
  const HowToPlayViewArguments({
    this.goToGameOnComplete = false,
    this.key,
  });

  final bool goToGameOnComplete;

  final _i11.Key? key;

  @override
  String toString() {
    return '{"goToGameOnComplete": "$goToGameOnComplete", "key": "$key"}';
  }

  @override
  bool operator ==(covariant HowToPlayViewArguments other) {
    if (identical(this, other)) return true;
    return other.goToGameOnComplete == goToGameOnComplete && other.key == key;
  }

  @override
  int get hashCode {
    return goToGameOnComplete.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i13.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView, id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToGameView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<dynamic>(Routes.gameView, id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToLeaderboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<dynamic>(Routes.leaderboardView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToAboutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<dynamic>(Routes.aboutView, id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToInfoceanView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<dynamic>(Routes.infoceanView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToAfterGameView({
    required bool isWon,
    int? score,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  }) async {
    return navigateTo<dynamic>(Routes.afterGameView,
        arguments: AfterGameViewArguments(isWon: isWon, score: score, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLevelUpDiverView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<dynamic>(Routes.levelUpDiverView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToHowToPlayView({
    bool goToGameOnComplete = false,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  }) async {
    return navigateTo<dynamic>(Routes.howToPlayView,
        arguments: HowToPlayViewArguments(goToGameOnComplete: goToGameOnComplete, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView, id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithGameView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<dynamic>(Routes.gameView, id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithLeaderboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<dynamic>(Routes.leaderboardView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithAboutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<dynamic>(Routes.aboutView, id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithInfoceanView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<dynamic>(Routes.infoceanView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithAfterGameView({
    required bool isWon,
    int? score,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  }) async {
    return replaceWith<dynamic>(Routes.afterGameView,
        arguments: AfterGameViewArguments(isWon: isWon, score: score, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLevelUpDiverView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<dynamic>(Routes.levelUpDiverView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithHowToPlayView({
    bool goToGameOnComplete = false,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  }) async {
    return replaceWith<dynamic>(Routes.howToPlayView,
        arguments: HowToPlayViewArguments(goToGameOnComplete: goToGameOnComplete, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
