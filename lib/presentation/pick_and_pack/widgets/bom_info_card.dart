import 'dart:math';

import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/resources/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';

/// Information card displayed at the top of the BOM page,
/// containing metadata like WO NO, ASSY LOT, QTY, PLAN, etc.
class BomInfoCard extends StatelessWidget {
  /// Creates a [BomInfoCard].
  const BomInfoCard({
    super.key,
    required this.woNo,
    required this.partNo,
    required this.assyLot,
    required this.qty,
    required this.planDate,
    required this.priority,
  });

  /// The Work Order number.
  final String woNo;

  /// The primary part number.
  final String partNo;

  /// The assembly lot code.
  final String assyLot;

  /// Total quantity to be produced.
  final int qty;

  /// Scheduled plan date.
  final String planDate;

  /// Priority tag (e.g., 'P1').
  final String priority;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.padding24, vertical: Sizes.padding16),
      decoration: AppDecorations.bomHeader(),
      child: Row(
        children: <Widget>[
          // WO NO box with barcode
          _qrScannerCard(context),
          const SizedBox(width: Sizes.size32),
          // Info texts
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: Sizes.width20,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildInfoColumn(l10n.bomPart, partNo),
                  _buildInfoColumn(l10n.bomAssyLot, assyLot),
                  _buildInfoColumn(l10n.bomQty, '$qty ${l10n.bomPcs}'),
                  _buildInfoColumn(l10n.bomPlan, planDate),
                  _buildInfoColumn(
                    l10n.bomPriority,
                    priority,
                    isRed: priority == 'P1' || priority.toLowerCase().contains('high'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: Sizes.size32),
          // STORE box
          Transform.rotate(angle: -(pi * 0.08), child: _storeTag(context)),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value, {bool isRed = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: AppTextStyles.liberationMono.bomLabelText),
        const SizedBox(height: Sizes.size4),
        Text(
          value,
          style: AppTextStyles.liberationMono.bomValueText.copyWith(
            color: isRed ? AppColors.danger : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _qrScannerCard(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return SizedBox(
      width: Sizes.width150,
      child: Container(
        decoration: AppDecorations.bomWoNoContainer(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: AppColors.warning,
              padding: const EdgeInsets.symmetric(vertical: Sizes.padding2),
              child: Text(
                l10n.bomWoNo,
                textAlign: TextAlign.center,
                style: AppTextStyles.inter.bomLabelText.copyWith(color: AppColors.textPrimary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding16,
                vertical: Sizes.padding8,
              ),
              child: Column(
                children: <Widget>[
                  Text(woNo, style: AppTextStyles.inter.bomHeaderTitle),
                  const SizedBox(height: Sizes.size4),
                  // Barcode placeholder
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      10,
                      (int index) => Container(
                        width: index % 2 == 0 ? Sizes.width4 : Sizes.width2,
                        height: Sizes.height12,
                        color: AppColors.black,
                        margin: const EdgeInsets.only(right: Sizes.margin2),
                      ),
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

  Widget _storeTag(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.padding16, vertical: Sizes.padding8),
      decoration: AppDecorations.bomStoreButton(),
      child: Text(l10n.bomStore, style: AppTextStyles.inter.bomValueText),
    );
  }
}
