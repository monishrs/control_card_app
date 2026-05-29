import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/resources/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/widgets/app_button.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/presentation/final_inspection/models/final_inspection_model.dart';

/// A card widget displaying the leakage confirmation requirements,
/// including a photo requirement indicator and a color mark visualization.
class LeakageConfirmationCard extends StatelessWidget {

  /// Creates a [LeakageConfirmationCard].
  const LeakageConfirmationCard({super.key, required this.model});
  /// The data model containing leakage confirmation state.
  final LeakageConfirmationModel model;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.padding16, vertical: Sizes.padding20),
      decoration: AppDecorations.fiLeakageCard(),
      child: Row(
        children: <Widget>[
          // KAKO Button
          AppButton(
            label: l10n.kakotora.replaceAll('TORA', ''), // Just 'KAKO' according to mock
            icon: Icons.star,
            variant: BtnVariant.dangerOutline,
            size: BtnSize.sm,
            onPressed: () {},
          ),
          const SizedBox(width: Sizes.size16),
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  l10n.fiLeakageConfirmationMarking,
                  style: AppTextStyles.inter.fiCardHeader,
                ),
                Text(
                  l10n.fiBlueMarkPhotoRequired,
                  style: AppTextStyles.inter.fiCardSub,
                ),
              ],
            ),
          ),
          // Indicators & Actions
          Container(
            width: 48,
            height: 48,
            decoration: AppDecorations.activeRoundDecoration(color: model.markColor).copyWith(
              border: Border.all(color: AppColors.black, width: Sizes.width2),
              borderRadius: BorderRadius.circular(Sizes.radius8),
              shape: BoxShape.rectangle, // Based on the mock, it's a blue square with rounded corners
            ),
            child: Center(
              child: Container(
                width: 32,
                height: 32,
                decoration: AppDecorations.activeRoundDecoration(color: model.markColor.withValues(alpha:0.8)),
              ),
            ),
          ),
          const SizedBox(width: Sizes.size16),
          if (model.isPhotoOk)
            AppButton(
              label: l10n.fiPhotoOk,
              icon: Icons.camera_alt,
              variant: BtnVariant.primaryGreen,
              onPressed: () {},
            ),
        ],
      ),
    );
  }
}
