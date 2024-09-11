import 'package:flutter/material.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';
import 'package:plasticdive/ui/extensions/context_extensions.dart';
import 'package:plasticdive/ui/validators/form_validators.dart';
import 'package:plasticdive/ui/widgets/common/game_button/game_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'settings_view.form.dart';
import 'settings_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'username', validator: FormValidators.usernameValidator),
])
class SettingsView extends StackedView<SettingsViewModel> with $SettingsView {
  const SettingsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/screens-backgrounds/home.jpg",
          height: context.height,
          width: context.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: SingleChildScrollView(
            padding: getResponsivePadding(context),
            child: Column(
              children: [
                Text(
                  'Username',
                  style: context.titleLarge,
                ),
                verticalSpaceSmall,
                TextFormField(
                  controller: usernameController,
                  focusNode: usernameFocusNode,
                  decoration: const InputDecoration(
                    hintText: 'Enter your username',
                  ),
                ),
                verticalSpaceMedium,
                Text(
                  'Sound',
                  style: context.titleLarge,
                ),
                verticalSpaceSmall,
                Transform.scale(
                  scale: 1.5,
                  child: Switch(
                    value: viewModel.isSoundEnabled,
                    onChanged: viewModel.toggleSound,
                    thumbIcon: WidgetStateProperty.resolveWith(
                        (states) => states.contains(WidgetState.selected) ? const Icon(Icons.volume_up) : const Icon(Icons.volume_off)),
                  ),
                ),
                verticalSpaceLarge,
                Text(
                  '🚨 Danger Zone ',
                  style: context.titleLarge,
                ),
                verticalSpaceMedium,
                GameButton(
                  onPressed: viewModel.clearSettings,
                  size: 50,
                  color: Colors.redAccent,
                  child: Text('CLEAR SETTINGS', style: context.responsiveButtonTextStyle),
                ),
              ],
            ),
          ),
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: [
            GameButton(
              onPressed: viewModel.updateUsername,
              size: 50,
              child: Text('UPDATE', style: context.responsiveButtonTextStyle),
            ),
          ],
        ),
      ],
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();

  @override
  void onViewModelReady(SettingsViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(SettingsViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
