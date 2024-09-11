import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plasticdive/app/app.locator.dart';
import 'package:plasticdive/app/app.router.dart';
import 'package:plasticdive/services/shared_preferences_service.dart';
import 'package:plasticdive/ui/views/how_to_play/how_to_play_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HowToPlayViewModel extends FormViewModel with $HowToPlayView {
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _navigationService = locator<NavigationService>();

  final bool goToGameOnComplete;

  final GlobalKey<IntroductionScreenState> introScreenKey = GlobalKey<IntroductionScreenState>();

  bool get shouldDisplayUsernameForm => _sharedPreferencesService.username == "Diver";

  HowToPlayViewModel({this.goToGameOnComplete = false}) {
    usernameController.text = "Diver #${Random().nextInt(1000)}";
  }

  Future completeHowToPlay() async {
    if (shouldDisplayUsernameForm) {
      await _sharedPreferencesService.setUsername(usernameController.text);
    }

    await _sharedPreferencesService.setHasSeenHowToPlay(true);

    if (goToGameOnComplete) {
      return await _navigationService.replaceWithGameView();
    }

    return _navigationService.back();
  }

  Future skipToLastPage() async {
    await introScreenKey.currentState?.skipToEnd();
  }

  void goToNextPage() {
    introScreenKey.currentState?.next();
  }
}
