import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/resources/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/widgets/app_button.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';

/// A panel widget that displays a checklist for the first-bin check process,
/// accompanied by a call-to-action button to scan the RFGen tag.
class FirstBinCheckPanel extends StatelessWidget {

  /// Creates a [FirstBinCheckPanel].
  const FirstBinCheckPanel({super.key, required this.checklist});
  /// The list of items to display in the checklist.
  final List<String> checklist;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(Sizes.padding16),
      decoration: AppDecorations.fiOutlineCard(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            l10n.fiFirstBinCheck,
            style: AppTextStyles.inter.ptLabel,
          ),
          const SizedBox(height: Sizes.size16),
          // Bulleted List
          ...checklist.map((String item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: Sizes.padding8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 6, right: Sizes.padding8),
                    width: Sizes.size4,
                    height: Sizes.size4,
                    decoration: const BoxDecoration(
                      color: AppColors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: AppTextStyles.inter.bomTableBodySub.copyWith(color: AppColors.black),
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: Sizes.size16),
          // Action Button
          AppButton(
            label: l10n.fiScanRfgenTag,
            variant: BtnVariant.offline, // Dark color
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
