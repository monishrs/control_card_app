import 'package:control_card_prototype/core/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/resources/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/widgets/app_button.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/presentation/pick_and_pack/models/bom_item_model.dart';

/// A single row within the [BomTable] representing a specific [BomItemModel].
/// Adjusts styling based on whether the item is picked, pending, or currently being picked.
class BomTableRow extends StatelessWidget {

  /// Creates a [BomTableRow] for the given [item].
  const BomTableRow({super.key, required this.item});
  /// The data model for this row.
  final BomItemModel item;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final bool isPicked = item.status == BomItemStatus.picked;
    final bool isPickingNow = item.status == BomItemStatus.pickingNow;

    Color bgColor = AppColors.colorWhite;
    if (isPickingNow) {
      bgColor = AppColors.infoLight;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding16,
        vertical: Sizes.padding12,
      ),
      decoration: AppDecorations.bomTableRow(
        isPickingNow: isPickingNow,
        bgColor: bgColor,
      ),
      child: Row(
        children: <Widget>[
          // Icon
          SizedBox(
            width: Sizes.width40,
            child: isPicked
                ? const Icon(
                    Icons.check_circle,
                    color: AppColors.success,
                    size: Sizes.iconSize24,
                  )
                : Icon(
                    Icons.circle_outlined,
                    color: isPickingNow ? AppColors.info : AppColors.greyBorder,
                    size: Sizes.iconSize24,
                  ),
          ),
          // CHILD - SFG
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.childPart,
                  style: AppTextStyles.liberationMono.bomTableBodyMain,
                ),
                const SizedBox(height: Sizes.size4),
                Text(
                  '${item.sfgPart} · ${item.childDescription}',
                  style: AppTextStyles.liberationMono.bomTableBodySub,
                ),
              ],
            ),
          ),
          // DESCRIPTION
          Expanded(
            flex: 2,
            child: Text(
              item.description,
              style: AppTextStyles.liberationMono.bomTableBodyMain,
            ),
          ),
          // QTY UoM
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Text(
                  item.qty.toString(),
                  style: AppTextStyles.liberationMono.bomTableBodyMain,
                ),
                const SizedBox(width: Sizes.size4),
                Text(
                  item.uom,
                  style: AppTextStyles.liberationMono.bomTableBodySub,
                ),
              ],
            ),
          ),
          // CUT/BEND
          Expanded(
            flex: 1,
            child: Text(
              item.cutBend,
              style: AppTextStyles.liberationMono.bomTableBodyMain,
            ),
          ),
          // STATUS
          SizedBox(width: Sizes.width100, child: _buildStatusWidget(l10n)),
        ],
      ),
    );
  }

  Widget _buildStatusWidget(AppLocalizations l10n) {
    switch (item.status) {
      case BomItemStatus.picked:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: Sizes.padding4),
          alignment: Alignment.center,
          decoration: AppDecorations.bomStatusPicked(),
          child: Text(
            item.badgeText ?? '',
            style: AppTextStyles.liberationMono.bomTableBodyMain.copyWith(
              color: AppColors.success,
            ),
          ),
        );
      case BomItemStatus.pickingNow:
        return AppButton(
          label: l10n.bomScanNow,
          variant: BtnVariant.offline, // dark blue
          size: BtnSize.sm,
          onPressed: () {},
        );
      case BomItemStatus.pending:
      default:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: Sizes.padding4),
          alignment: Alignment.center,
          decoration: AppDecorations.bomStatusPending(),
          child: Text(
            l10n.bomPending,
            style: AppTextStyles.liberationMono.bomTableBodyMain.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        );
    }
  }
}
