import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/resources/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';
import 'package:control_card_prototype/core/widgets/app_button.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/presentation/online_assembly/models/pressure_test_model.dart';

class PressureTestQrCard extends StatelessWidget {

  const PressureTestQrCard({super.key, required this.model});
  final PressureTestPageModel model;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(Sizes.padding16),
      decoration: AppDecorations.outline(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // QR Icon Box
          Container(
            width: Sizes.width60,
            height: Sizes.height60,
            decoration: AppDecorations.qrScannerBg(color: AppColors.greyF0F1EC),
            child: Center(child: Text('QR', style: AppTextStyles.inter.textStyle14BoldBlack87)),
          ),
          const SizedBox(width: Sizes.size16),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${l10n.ptLotNumber} · ${l10n.ptScanned}', style: AppTextStyles.inter.ptLabel),
                const SizedBox(height: Sizes.size4),
                Text(
                  '${model.lotNumber} - ${model.lotDescription}',
                  style: AppTextStyles.liberationMono.textStyle18Bold,
                ),
                const SizedBox(height: Sizes.size4),
                if (model.isLotMatched)
                  Row(
                    children: <Widget>[
                      const Icon(Icons.check, color: AppColors.success, size: Sizes.iconSize16),
                      const SizedBox(width: Sizes.size4),
                      Text(
                        l10n.ptMatchesWoLot,
                        style: AppTextStyles.jetBrainsMono.textStyle12BoldGreen,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          // Rescan button
          AppButton(label: l10n.ptRescan, variant: BtnVariant.black, onPressed: () {}),
        ],
      ),
    );
  }
}
