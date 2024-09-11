import 'package:flutter/material.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';
import 'package:plasticdive/ui/extensions/context_extensions.dart';
import 'package:plasticdive/ui/widgets/common/game_button/game_button.dart';
import 'package:stacked/stacked.dart';

import 'after_game_viewmodel.dart';

class AfterGameView extends StackedView<AfterGameViewModel> {
  final bool isWon;
  final int? score;

  const AfterGameView({required this.isWon, this.score, super.key});

  @override
  Widget builder(
    BuildContext context,
    AfterGameViewModel viewModel,
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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isWon ? 'You won! 🙌' : 'You lost! 🥹',
                  style: context.titleLarge,
                ),
                if (isWon) ...[
                  Text(
                    'New score: $score',
                    style: context.titleMedium,
                  ),
                ],
                Text(
                  'High score: ${viewModel.highScore}',
                  style: context.titleMedium,
                ),
                Text(
                  'Total points: ${viewModel.points}',
                  style: context.titleMedium,
                ),
                verticalSpaceLarge,
                GameButton(
                  onPressed: viewModel.replay,
                  size: 50,
                  child: Text('Replay', style: context.responsiveButtonTextStyle),
                ),
                verticalSpaceMedium,
                GameButton(
                  onPressed: viewModel.isDiverUpgradable ? viewModel.navigateToLevelUpDiver : null,
                  size: 50,
                  child: Text(viewModel.isDiverUpgradable ? 'Level up diver' : 'No level up possible yet', style: context.responsiveButtonTextStyle),
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GameButton(
                      onPressed: viewModel.navigateToLeaderboard,
                      size: 50,
                      child: const Icon(Icons.leaderboard, color: Colors.white),
                    ),
                    horizontalSpaceMedium,
                    GameButton(
                      onPressed: viewModel.navigateToHome,
                      size: 50,
                      child: const Icon(Icons.home, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  AfterGameViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AfterGameViewModel();
}
