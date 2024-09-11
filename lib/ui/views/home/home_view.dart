import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:plasticdive/ui/common/app_colors.dart';
import 'package:plasticdive/ui/common/app_theme.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';
import 'package:plasticdive/ui/extensions/context_extensions.dart';
import 'package:plasticdive/ui/widgets/common/game_button/game_button.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    // Configure MetaSEO for web app
    if (kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // add meta seo data for web app as you want
      meta.author(author: 'Marie & Chris');
      meta.description(description: 'Plastic Dive is a game for Global Gamers Challenge about cleaning the ocean from plastic.');
      meta.keywords(keywords: 'Flutter, Global Citizen, Global Gamers Challenge, Plastic Dive, plastic pollution, ocean pollution, game');
      meta.ogImage(ogImage: 'https://plastic-diver.web.app/assets/assets/images/icons/logo.png');
    }

    return Stack(
      children: [
        Image.asset(
          "assets/images/screens-backgrounds/home.jpg",
          height: context.height,
          width: context.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  right: 40,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kcPrimaryColor.withOpacity(0.7),
                          border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text("Points: ${viewModel.points}", style: smallButtonTextStyle),
                            if (viewModel.isDiverUpgradable) ...[
                              horizontalSpaceMedium,
                              GameButton(
                                  onPressed: viewModel.navigateToLevelUpDiver, size: 30, child: Text("UPGRADE DIVER", style: smallButtonTextStyle)),
                            ]
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getResponsivePadding(context),
                  child: Center(
                    child: Flex(
                      direction: context.isLandScape ? Axis.horizontal : Axis.vertical,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset("assets/images/icons/logo-no-background.png", width: quarterScreenWidth(context)),
                            verticalSpaceMedium,
                            Text("A game for \nGlobal Gamers Challenge", style: context.bodyLarge, textAlign: TextAlign.center),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            verticalSpaceLarge,
                            GameButton(onPressed: viewModel.navigateToGame, size: 50, child: Text("PLAY", style: context.responsiveButtonTextStyle)),
                            verticalSpaceMedium,
                            GameButton(
                                onPressed: viewModel.navigateToHowToPlay,
                                size: 50,
                                child: Text("HOW-TO PLAY", style: context.responsiveButtonTextStyle)),
                            verticalSpaceMedium,
                            GameButton(
                                onPressed: viewModel.navigateToInfocean, size: 50, child: Text("INFOCEAN", style: context.responsiveButtonTextStyle)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GameButton(
                  onPressed: viewModel.switchSound,
                  size: 50,
                  child:
                      viewModel.isSoundEnabled ? const Icon(Icons.volume_up, color: Colors.white) : const Icon(Icons.volume_off, color: Colors.white),
                ),
                responsiveHorizontalSpace(context),
                GameButton(
                  onPressed: viewModel.navigateToLeaderboard,
                  size: 50,
                  child: const Icon(Icons.leaderboard, color: Colors.white),
                ),
                responsiveHorizontalSpace(context),
                GameButton(
                  onPressed: viewModel.navigateToSettings,
                  size: 50,
                  child: const Icon(Icons.settings, color: Colors.white),
                ),
                responsiveHorizontalSpace(context),
                GameButton(
                  onPressed: viewModel.navigateToAbout,
                  size: 50,
                  child: const Icon(Icons.info_outline, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
