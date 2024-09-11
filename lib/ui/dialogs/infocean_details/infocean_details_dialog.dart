import 'package:flutter/material.dart';
import 'package:plasticdive/ui/common/app_colors.dart';
import 'package:plasticdive/ui/common/ui_helpers.dart';
import 'package:plasticdive/ui/extensions/context_extensions.dart';
import 'package:plasticdive/ui/views/infocean/infocean_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'infocean_details_dialog_model.dart';

class InfoceanDetailsDialog extends StackedView<InfoceanDetailsDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const InfoceanDetailsDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(
    BuildContext context,
    InfoceanDetailsDialogModel viewModel,
    Widget? child,
  ) {
    InfoceanInfo info = request.data as InfoceanInfo;

    return Dialog(
      backgroundColor: kcPrimaryColor.withAlpha(240),
      surfaceTintColor: Colors.black,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => completer(DialogResponse(confirmed: false)),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        request.imageUrl ?? 'assets/images/animals/clown_fish.png',
                        height: screenHeightFraction(context, dividedBy: 10),
                        fit: BoxFit.fitHeight,
                      ),
                      horizontalSpaceMedium,
                      Text(
                        request.title ?? 'Infocean',
                        style: context.titleMedium,
                      ),
                      verticalSpaceMedium,
                    ],
                  ),
                ],
              ),
              verticalSpaceMedium,
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('⏳ Lifelong', style: context.titleMedium),
                  Text(info.lifeLong, style: context.bodyMedium),
                  verticalSpaceMedium,
                  if (info.endangeredStatus != null) ...[
                    Text('🚨 Endangered status', style: context.titleMedium),
                    Text(info.endangeredStatus!, style: context.bodyMedium),
                    verticalSpaceMedium,
                  ],
                  if (info.alternatives != null) ...[
                    Text('⚖️ Alternatives', style: context.titleMedium),
                    Text(info.alternatives!, style: context.bodyMedium),
                    verticalSpaceMedium,
                  ],
                  if (info.howToAvoid != null) ...[
                    Text('🙅 How to avoid?', style: context.titleMedium),
                    Text(info.howToAvoid!, style: context.bodyMedium),
                    verticalSpaceMedium,
                  ],
                  if (info.whereToFind != null) ...[
                    Text('📍 Where', style: context.titleMedium),
                    Text(info.whereToFind!, style: context.bodyMedium),
                    verticalSpaceMedium,
                  ],
                  if (info.howToDispose != null) ...[
                    Text('♻️ How to dispose?', style: context.titleMedium),
                    Text(info.howToDispose!, style: context.bodyMedium),
                    verticalSpaceMedium,
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  InfoceanDetailsDialogModel viewModelBuilder(BuildContext context) => InfoceanDetailsDialogModel();
}
