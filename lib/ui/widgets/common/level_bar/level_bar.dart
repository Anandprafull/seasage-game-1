import 'package:flutter/material.dart';
import 'package:plasticdive/ui/common/app_colors.dart';
import 'package:plasticdive/ui/common/app_theme.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';
import 'package:plasticdive/ui/extensions/context_extensions.dart';
import 'package:plasticdive/ui/widgets/common/game_button/game_button.dart';

class LevelBar extends StatelessWidget {
  final int maxLevel;
  final String skillName;
  final int level;
  final VoidCallback? onUpgrade;
  final bool isUpgradeAllowed;

  final int? requiredPointsToUpgrade;

  const LevelBar({
    required this.skillName,
    required this.level,
    required this.maxLevel,
    this.onUpgrade,
    required this.isUpgradeAllowed,
    required this.requiredPointsToUpgrade,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              skillName,
              style: context.titleMedium,
            ),
          ],
        ),
        verticalSpaceSmall,
        Row(
          children: [
            // Display the level as a number of rounded rectangles
            for (var i = 0; i < maxLevel; i++)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.isLandScape ? 10 : 2),
                  child: Container(
                    width: 40,
                    height: 20,
                    decoration: BoxDecoration(
                      color: i < level ? kcPrimaryColor.withOpacity(0.7) : Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            horizontalSpaceMedium,
            GameButton(
              onPressed: isUpgradeAllowed && level < maxLevel ? onUpgrade : null,
              size: context.isLandScape ? 30 : 20,
              child: Text((level < maxLevel) ? 'Upgrade ($requiredPointsToUpgrade)' : 'MAX', style: smallButtonTextStyle),
            ),
          ],
        ),
      ],
    );
  }
}
