import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/resources/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/widgets/app_button.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/presentation/final_inspection/models/final_inspection_model.dart';

/// A panel widget that displays a mockup of an RFGen tag.
/// It includes a simulated barcode and QR code, along with part and lot metadata.
class RfgenTagPanel extends StatelessWidget {

  /// Creates an [RfgenTagPanel].
  const RfgenTagPanel({super.key, required this.tagMockup});
  /// The data model for the RFGen tag to be displayed.
  final RfgenTagModel tagMockup;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(Sizes.padding16),
      decoration: AppDecorations.fiTagPanel(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            l10n.fiRfgenTagBundle.replaceAll('#3', tagMockup.bundleRef),
            style: AppTextStyles.inter.ptLabel,
          ),
          const SizedBox(height: Sizes.size4),
          Text(
            l10n.fiGeneratedFrom,
            style: AppTextStyles.inter.fiCardHeader,
          ),
          const SizedBox(height: Sizes.size16),
          // Tag Mockup
          Container(
            padding: const EdgeInsets.all(Sizes.padding12),
            decoration: AppDecorations.fiTagContainer(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(tagMockup.company, style: AppTextStyles.inter.fiTagSmallMono),
                    Text(tagMockup.code, style: AppTextStyles.inter.fiTagSmallMono),
                  ],
                ),
                const Divider(color: AppColors.greyBorder, height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(tagMockup.partNo, style: AppTextStyles.inter.fiMonoValue),
                          const SizedBox(height: Sizes.size24),
                          Text(l10n.fiLotQtyBin, style: AppTextStyles.inter.fiTagSmallMono),
                          Text(tagMockup.lotNo, style: AppTextStyles.inter.fiTagSmallMono.copyWith(fontSize: 10, color: AppColors.black)),
                        ],
                      ),
                    ),
                    // Mock QR code block
                    Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.only(top: Sizes.padding8),
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: AssetImage('assets/images/sample_qr.png'), // Placeholder or fallback
                      //     fit: BoxFit.cover,
                      //   ),
                      //   color: AppColors.greyBorder, // fallback if no image
                      // ),
                      child: const Icon(Icons.qr_code_2, size: 40, color: AppColors.black), // fallback icon
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.size12),
                // Mock Barcode
                Row(
                  children: List.generate(
                    20,
                    (int index) => Container(
                      width: index % 3 == 0 ? 3 : 1.5,
                      height: 12,
                      color: AppColors.black,
                      margin: const EdgeInsets.only(right: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Sizes.size16),
          // Action Button
          AppButton(
            label: l10n.fiPrintPasteTag,
            variant: BtnVariant.offline, // Uses dark color which is close to black
            size: BtnSize.xl,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
