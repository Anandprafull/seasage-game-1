import 'package:plasticdive/app/app.locator.dart';
import 'package:plasticdive/app/app.router.dart';
import 'package:plasticdive/services/shared_preferences_service.dart';
import 'package:plasticdive/ui/views/settings/settings_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends FormViewModel with $SettingsView {
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _snackbarService = locator<SnackbarService>();

  SettingsViewModel() {
    // Initial value for the username field
    usernameController.text = username;
  }

  String get username => _sharedPreferencesService.username;

  get isSoundEnabled => _sharedPreferencesService.isSoundEnabled;

  Future updateUsername() async {
    _sharedPreferencesService.setUsername(usernameValue);
    rebuildUi();
    _snackbarService.showSnackbar(message: "✅ Settings updated", duration: const Duration(milliseconds: 1500));
    _navigationService.replaceWithHomeView();
  }

  void toggleSound(bool _) {
    _sharedPreferencesService.toggleSoundEnabled();
    rebuildUi();
  }

  Future clearSettings() async {
    var dialogResponse = await _dialogService.showConfirmationDialog(
      title: 'Clear settings',
      description: 'Are you sure you want to clear all settings?',
      confirmationTitle: 'Yes',
      cancelTitle: 'No',
    );
    if (dialogResponse?.confirmed != true) return;

    await _sharedPreferencesService.clearPreferences();
    usernameController.text = username;
    rebuildUi();
  }

  Future goBack() async {
    await _navigationService.replaceWithHomeView();
  }
}
