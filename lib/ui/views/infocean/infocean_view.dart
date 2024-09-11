import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';
import 'package:plasticdive/ui/extensions/context_extensions.dart';
import 'package:stacked/stacked.dart';

import 'infocean_viewmodel.dart';

class InfoceanView extends StackedView<InfoceanViewModel> {
  const InfoceanView({super.key});

  @override
  Widget builder(
    BuildContext context,
    InfoceanViewModel viewModel,
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
          bottomNavigationBar: NavigationBar(
            destinations: [
              NavigationDestination(label: 'Garbage', icon: Image.asset('assets/images/garbages/soda_can.png', height: 35)),
              NavigationDestination(label: 'Animals', icon: Image.asset('assets/images/animals/clown_fish.png', height: 35)),
            ],
            selectedIndex: viewModel.currentIndex,
            onDestinationSelected: viewModel.setIndex,
          ),
          appBar: AppBar(
            title: const Text('Infocean'),
          ),
          body: GridView.count(
            primary: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: max(1, (quarterScreenWidth(context) ~/ 100).toInt()),
            padding: getResponsivePadding(context),
            children: List.generate(
              viewModel.source.length,
              (index) => _buildCard(context, viewModel, index),
            ),
          ),
        ),
      ],
    );
  }

  @override
  InfoceanViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InfoceanViewModel();

  _buildCard(BuildContext context, InfoceanViewModel viewModel, int index) {
    return InkWell(
      onTap: viewModel.isCardUnlocked(viewModel.source[index]) ? () => viewModel.showInfoceanDetails(index) : null,
      child: Card(
        color: Colors.white.withOpacity(0.7),
        child: Stack(
          children: [
            _buildImage(context, viewModel, index),
            _buildPoints(context, viewModel, index),
            _buildMoreInfo(context, viewModel, index),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildName(context, viewModel, index),
                  verticalSpaceSmall,
                  _buildLifeLong(context, viewModel, index),
                  verticalSpaceMedium,
                  Expanded(
                    child: Text(
                      viewModel.isCardUnlocked(viewModel.source[index]) ? viewModel.source[index].description : "???",
                      style: context.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, InfoceanViewModel viewModel, int index) {
    return Positioned(
      bottom: -20,
      right: -20,
      child: Transform.flip(
        flipX: viewModel.source[index].shouldFlip,
        child: Transform.rotate(
          angle: 75,
          child: Image.asset(
            viewModel.source[index].imagePath,
            height: 100,
            width: 100,
            color: viewModel.isCardUnlocked(viewModel.source[index]) ? null : Colors.grey,
            // colorBlendMode: BlendMode.saturation,
          ),
        ),
      ),
    );
  }

  Widget _buildName(BuildContext context, InfoceanViewModel viewModel, int index) {
    return Text(
      viewModel.isCardUnlocked(viewModel.source[index]) ? viewModel.source[index].name : "???",
      style: context.titleMedium,
    );
  }

  Widget _buildLifeLong(BuildContext context, InfoceanViewModel viewModel, int index) {
    return Chip(
      label: Text(viewModel.isCardUnlocked(viewModel.source[index])
          ? viewModel.source[index].lifeLong
          : viewModel.source[index].requiredLevel == null
              ? "Collect this garbage to unlock it"
              : "Unlock: Dive level ${viewModel.source[index].requiredLevel}"),
    );
  }

  Widget _buildPoints(BuildContext context, InfoceanViewModel viewModel, int index) {
    if (viewModel.source[index].points != null) {
      return Positioned(
        bottom: 20,
        left: 20,
        child: Chip(
          padding: const EdgeInsets.all(5),
          label: Text(viewModel.isCardUnlocked(viewModel.source[index]) ? "${viewModel.source[index].points} points" : "??? points",
              style: context.bodySmall),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildMoreInfo(BuildContext context, InfoceanViewModel viewModel, int index) {
    return Positioned(
      top: 25,
      right: 20,
      child: Text(
        viewModel.isCardUnlocked(viewModel.source[index]) ? "More info" : "",
        style: context.bodyMedium,
      ),
    );
  }
}
