import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:plasticdive/game/dive_game.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';
import 'package:plasticdive/ui/extensions/context_extensions.dart';
import 'package:plasticdive/ui/widgets/common/game_button/game_button.dart';
import 'package:stacked/stacked.dart';

import 'game_viewmodel.dart';

class GameView extends StackedView<GameViewModel> {
  const GameView({super.key});

  @override
  Widget builder(
    BuildContext context,
    GameViewModel viewModel,
    Widget? child,
  ) {
    return GameWidget(
      game: DiveGame(
        gameHeight: context.height,
        gameWidth: context.width,
        onGameOver: viewModel.onGameOver,
        airTankLevel: viewModel.airTankLevel,
        collectingSpeedLevel: viewModel.collectingSpeedLevel,
        diveDepthLevel: viewModel.diveDepthLevel,
        swimmingSpeedLevel: viewModel.swimmingSpeedLevel,
        previousHighScore: viewModel.highScore,
        isSoundEnabled: viewModel.isSoundEnabled,
      ),
      autofocus: true,
      loadingBuilder: (context) => Stack(
        children: [
          Image.asset(
            "assets/images/screens-backgrounds/home.jpg",
            height: context.height,
            width: context.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Loading...',
                    style: context.titleLarge,
                  ),
                  verticalSpaceMedium,
                  const CircularProgressIndicator(color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
      overlayBuilderMap: {
        'PauseMenu': (BuildContext context, DiveGame game) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: context.isMobile ? screenWidthFraction(context, dividedBy: 1) : thirdScreenWidth(context) * 2,
                height: halfScreenHeight(context),
                child: Card(
                  color: context.cardColor.withOpacity(0.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Paused',
                        style: context.titleLarge,
                      ),
                      verticalSpaceLarge,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GameButton(
                            onPressed: () => viewModel.exitGame(game),
                            size: 50,
                            color: Colors.redAccent,
                            child: Text('Exit', style: context.responsiveButtonTextStyle),
                          ),
                          horizontalSpaceMedium,
                          GameButton(
                            onPressed: () => viewModel.resumeGame(game),
                            size: 50,
                            child: Text('Resume', style: context.responsiveButtonTextStyle),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  GameViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GameViewModel();
}
