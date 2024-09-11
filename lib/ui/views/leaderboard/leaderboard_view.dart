import 'package:flutter/material.dart';
import 'package:plasticdive/services/leaderboard_service.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';
import 'package:plasticdive/ui/extensions/context_extensions.dart';
import 'package:stacked/stacked.dart';

import 'leaderboard_viewmodel.dart';

class LeaderboardView extends StackedView<LeaderboardViewModel> {
  const LeaderboardView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LeaderboardViewModel viewModel,
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
            title: const Text('🏆 Leaderboard 🏆'),
          ),
          body: Container(
            padding: getResponsivePadding(context),
            child: viewModel.isBusy
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : viewModel.data == null
                    ? Center(child: Text("Impossible to load the leaderboard 😅", style: context.bodyLarge))
                    : ListView.builder(
                        itemCount: viewModel.data!.length,
                        itemBuilder: (context, index) {
                          final LeaderboardEntry entry = viewModel.data![index];
                          return ListTile(
                            leading: Text(
                              '#${index + 1}',
                              style: index < 3 ? context.titleMedium : context.bodyMedium,
                            ),
                            title: Text(
                              entry.pseudo,
                              style: index < 3 ? context.titleMedium : context.bodyMedium,
                            ),
                            trailing: Text(
                              '${entry.score}',
                              style: index < 3 ? context.titleMedium : context.bodyMedium,
                            ),
                          );
                        },
                      ),
          ),
        ),
      ],
    );
  }

  @override
  LeaderboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LeaderboardViewModel();
}
