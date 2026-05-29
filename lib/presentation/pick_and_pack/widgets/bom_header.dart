import 'package:control_card_prototype/common_lib.dart';

/// Top header bar for the BOM page, showing Work Order context,
/// and overall pick progress as a fraction (e.g., "3 / 6 PICKED").
class BomHeader extends StatelessWidget {
  /// Creates a [BomHeader].
  const BomHeader({super.key, required this.pickedLines, required this.totalLines});

  /// Number of lines currently picked.
  final int pickedLines;

  /// Total number of lines in the BOM.
  final int totalLines;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.padding24),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.padding12,
              vertical: Sizes.padding6,
            ),
            decoration: AppDecorations.bomPickedCount(),
            child: Text(
              '$pickedLines / $totalLines ${l10n.bomPicked}',
              style: AppTextStyles.inter.bomLabelText.copyWith(color: AppColors.textWhite),
            ),
          ),
          const SizedBox(width: Sizes.size12),
          AppButton(label: '[QR] Scan box tag', variant: BtnVariant.primary, onPressed: () {}),
        ],
      ),
    );
  }
}
