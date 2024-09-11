import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plasticdive/ui/common/app_colors.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';
import 'package:plasticdive/ui/extensions/context_extensions.dart';
import 'package:plasticdive/ui/validators/form_validators.dart';
import 'package:plasticdive/ui/views/how_to_play/how_to_play_view.form.dart';
import 'package:plasticdive/ui/widgets/common/game_button/game_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'how_to_play_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'username', validator: FormValidators.usernameValidator),
])
class HowToPlayView extends StackedView<HowToPlayViewModel> with $HowToPlayView {
  final bool goToGameOnComplete;

  const HowToPlayView({this.goToGameOnComplete = false, super.key});

  @override
  Widget builder(
    BuildContext context,
    HowToPlayViewModel viewModel,
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
        IntroductionScreen(
          key: viewModel.introScreenKey,
          pages: listPagesViewModel(context, viewModel),
          bodyPadding: getResponsivePadding(context).copyWith(bottom: -50),
          globalBackgroundColor: Colors.transparent,
          showNextButton: true,
          showSkipButton: true,
          dotsDecorator: DotsDecorator(
            size: const Size(20.0, 20.0),
            color: Colors.white.withOpacity(0.7),
            activeColor: kcPrimaryColor,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
            activeSize: const Size(40.0, 20.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          skip: GameButton(
            onPressed: viewModel.skipToLastPage,
            size: screenHeightFraction(context, dividedBy: 20),
            child: Text('Skip', style: context.responsiveButtonTextStyle),
          ),
          next: GameButton(
            onPressed: viewModel.goToNextPage,
            size: screenHeightFraction(context, dividedBy: 20),
            child: Text('Next', style: context.responsiveButtonTextStyle),
          ),
          done: GameButton(
            onPressed: viewModel.completeHowToPlay,
            size: screenHeightFraction(context, dividedBy: 20),
            child: Text('Done', style: context.responsiveButtonTextStyle),
          ),
          onDone: viewModel.completeHowToPlay,
        ),
      ],
    );
  }

  PageDecoration getDecoration(BuildContext context) => PageDecoration(
        bodyTextStyle: context.bodyMedium!,
        titleTextStyle: context.titleMedium!,
      );

  List<PageViewModel> listPagesViewModel(BuildContext context, HowToPlayViewModel viewModel) => [
        PageViewModel(
          title: "Welcome, little diver!",
          body: "You're about to discover the wonders of the oceans, but beware, some might surprise you!",
          image: Image.asset("assets/images/how-to-play/howtoplay1.png", height: quarterScreenHeight(context)),
          decoration: getDecoration(context),
        ),
        PageViewModel(
          title: "Your mission",
          body:
              "Collect as much trash as possible before resurfacing. Keep an eye on your oxygen! The more trash you collect, the more points you get... and help the earth! With the points, you can upgrade your diver!",
          image: Image.asset("assets/images/how-to-play/howtoplay2.png", height: quarterScreenHeight(context)),
          decoration: getDecoration(context),
        ),
        PageViewModel(
          title: "How to dive?",
          body:
              "To navigate, use the joystick or the arrow keys on your keyboard. To collect trash, use the button or the space bar. Be careful, the larger the trash, the more time it will take you.",
          image: Image.asset("assets/images/how-to-play/howtoplay3.png", height: quarterScreenHeight(context)),
          decoration: getDecoration(context),
        ),
        if (viewModel.shouldDisplayUsernameForm) ...[
          PageViewModel(
            title: "Ready to dive?",
            bodyWidget: Form(
              // key: viewModel.formKey,
              child: Column(
                children: [
                  Text(
                    "Before you dive, please enter your username",
                    style: context.bodyMedium,
                  ),
                  verticalSpaceMedium,
                  TextFormField(
                    controller: usernameController,
                    focusNode: usernameFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Enter your username',
                    ),
                  ),
                ],
              ),
            ),
            image: Image.asset("assets/images/how-to-play/howtoplay4.png", height: quarterScreenHeight(context)),
            decoration: getDecoration(context),
          ),
        ],
      ];

  @override
  HowToPlayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HowToPlayViewModel(goToGameOnComplete: goToGameOnComplete);

  @override
  void onViewModelReady(HowToPlayViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(HowToPlayViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
