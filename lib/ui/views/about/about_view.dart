import 'package:flutter/material.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';
import 'package:plasticdive/ui/extensions/context_extensions.dart';
import 'package:stacked/stacked.dart';

import 'about_viewmodel.dart';

class AboutView extends StackedView<AboutViewModel> {
  const AboutView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AboutViewModel viewModel,
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
            title: const Text('About'),
          ),
          body: SingleChildScrollView(
            padding: getResponsivePadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Plastic Diver',
                  style: context.titleLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'Version: 1.0.0',
                  style: context.bodyLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'Developed by Marie & Chris with ❤️',
                  style: context.titleLarge,
                  textAlign: TextAlign.center,
                ),
                verticalSpaceMedium,
                Image.asset(
                  "assets/images/screens-backgrounds/about.png",
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                verticalSpaceLarge,
                Text(
                  'We are proud to present our very first game. We hope you enjoy it! We know it\'s not perfect, but we are working hard to improve it.',
                  style: context.bodyLarge,
                ),
                verticalSpaceLarge,
                Text(
                  'Special thanks to:',
                  style: context.titleLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'Our earth for being so beautiful and inspiring us to create this game. Let\'s not forget to protect it!',
                  style: context.bodyLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'Our friends testing the game and giving us feedback. (You know who you are! Even if you didn\'t test it, you are still our friend!)',
                  style: context.bodyLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'Flutter, Flame, Stacked for their frameworks helping us to shape our crazy ideas into a game. Global Citizen for their challenge idea and inspiration.',
                  style: context.bodyLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'DALL-E for the amazing icon and images we used in our game. (We are still working on our own art skills! 😅)',
                  style: context.bodyLarge,
                ),
                verticalSpaceSmall,
                Text(
                  'And last but not least, you for playing our game!',
                  style: context.bodyLarge,
                ),
                Text(
                  '© 2024',
                  style: context.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  AboutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AboutViewModel();
}
