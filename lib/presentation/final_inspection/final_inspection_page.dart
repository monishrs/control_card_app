import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/widgets/app_button.dart';
import 'package:control_card_prototype/core/common_widgets/custom_app_bar.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/presentation/final_inspection/models/final_inspection_model.dart';
import 'package:control_card_prototype/presentation/final_inspection/widgets/leakage_confirmation_card.dart';
import 'package:control_card_prototype/presentation/final_inspection/widgets/fitment_verification_card.dart';
import 'package:control_card_prototype/presentation/final_inspection/widgets/packing_bundles_card.dart';
import 'package:control_card_prototype/presentation/final_inspection/widgets/rfgen_tag_panel.dart';
import 'package:control_card_prototype/presentation/final_inspection/widgets/first_bin_check_panel.dart';

/// Final Inspection Page.
///
/// Displays the final inspection details and
/// related actions for the inspection workflow.
///
/// This page is responsible for:
/// - Showing inspection information
/// - Displaying inspection status
/// - Handling final verification actions
/// - Managing user interactions during inspection
/// The main screen for the Final Inspection and Packing process.
/// It displays various cards indicating fitment verification, leakage confirmation,
/// bundle packing progress, and RFGen tag generation.
class FinalInspectionPage extends StatelessWidget {
  /// Creates a [FinalInspectionPage].
  const FinalInspectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final FinalInspectionPageModel model = mockFinalInspectionData;

    return Scaffold(
      backgroundColor: AppColors.neutralBg,
      appBar: CustomAppBar(
        title: l10n.fiFinalInspection,
        subTitle:
            'WO ${model.workOrder} · STAGE ${model.stageCode} · ${model.connectionType} · FINAL',
        isLeadingEnabled: true,
        actions: <Widget>[
          AppButton(
            label: l10n.fiFirstBinInProgress,
            variant: BtnVariant.warning,
            onPressed: () {},
          ),
          const SizedBox(width: Sizes.size24),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(Sizes.padding24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Left Column
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: <Widget>[
                          LeakageConfirmationCard(model: model.leakage),
                          const SizedBox(height: Sizes.size24),
                          FitmentVerificationCard(fitments: model.fitments),
                          const SizedBox(height: Sizes.size24),
                          PackingBundlesCard(packing: model.packing),
                        ],
                      ),
                    ),
                    const SizedBox(width: Sizes.size24),
                    // Right Column
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: <Widget>[
                          RfgenTagPanel(tagMockup: model.tagMockup),
                          const SizedBox(height: Sizes.size24),
                          FirstBinCheckPanel(checklist: model.firstBinChecklist),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Action Bar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding24,
                vertical: Sizes.padding16,
              ),
              decoration: const BoxDecoration(
                color: AppColors.neutralBg,
                border: Border(top: BorderSide(color: AppColors.greyBorder)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AppButton(
                    label: l10n.fiSubmitReadyForQa,
                    variant: BtnVariant.primaryGreen,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
