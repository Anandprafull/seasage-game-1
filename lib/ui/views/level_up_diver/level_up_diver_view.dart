import 'package:flutter/material.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';
import 'package:plasticdive/ui/extensions/context_extensions.dart';
import 'package:plasticdive/ui/widgets/common/level_bar/level_bar.dart';
import 'package:stacked/stacked.dart';

import 'level_up_diver_viewmodel.dart';

class LevelUpDiverView extends StackedView<LevelUpDiverViewModel> {
  const LevelUpDiverView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LevelUpDiverViewModel viewModel,
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
            title: const Text('Level up diver'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => viewModel.goBack(),
            ),
          ),
          body: Padding(
            padding: getResponsivePadding(context),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Available points: ${viewModel.points}',
                    style: context.titleLarge,
                  ),
                  verticalSpaceLarge,
                  LevelBar(
                    skillName: 'Air tank',
                    level: viewModel.airTankLevel,
                    isUpgradeAllowed: viewModel.isAirTankUpgradeAllowed,
                    onUpgrade: viewModel.upgradeAirTank,
                    requiredPointsToUpgrade: viewModel.requiredPointsForAirTankUpgrade,
                    maxLevel: viewModel.airTankLevelMax,
                  ),
                  verticalSpaceMedium,
                  LevelBar(
                    skillName: 'Swim speed',
                    level: viewModel.swimmingSpeedLevel,
                    isUpgradeAllowed: viewModel.isSwimmingSpeedUpgradeAllowed,
                    onUpgrade: viewModel.upgradeSwimmingSpeed,
                    requiredPointsToUpgrade: viewModel.requiredPointsForSwimmingSpeedUpgrade,
                    maxLevel: viewModel.swimmingSpeedLevelMax,
                  ),
                  verticalSpaceMedium,
                  LevelBar(
                    skillName: 'Collecting speed',
                    level: viewModel.collectingSpeedLevel,
                    isUpgradeAllowed: viewModel.isCollectingSpeedUpgradeAllowed,
                    onUpgrade: viewModel.upgradeCollectingSpeed,
                    requiredPointsToUpgrade: viewModel.requiredPointsForCollectingSpeedUpgrade,
                    maxLevel: viewModel.collectingSpeedLevelMax,
                  ),
                  verticalSpaceMedium,
                  LevelBar(
                    skillName: 'Dive depth',
                    level: viewModel.diveDepthLevel,
                    isUpgradeAllowed: viewModel.isDiveDepthUpgradeAllowed,
                    onUpgrade: viewModel.upgradeDiveDepth,
                    requiredPointsToUpgrade: viewModel.requiredPointsForDiveDepthUpgrade,
                    maxLevel: viewModel.diveDepthLevelMax,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  LevelUpDiverViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LevelUpDiverViewModel();
}
