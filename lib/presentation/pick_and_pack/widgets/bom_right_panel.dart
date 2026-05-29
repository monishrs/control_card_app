import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/resources/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';
import 'package:control_card_prototype/core/widgets/app_button.dart';
import 'package:control_card_prototype/presentation/pick_and_pack/widgets/bom_action_button.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/presentation/pick_and_pack/models/bom_item_model.dart';

/// The persistent side panel on the BOM page, displaying context on the item
/// currently being picked, the camera viewfinder, and overall kit progress.
class BomRightPanel extends StatelessWidget {

  /// Creates a [BomRightPanel].
  const BomRightPanel({
    super.key,
    this.pickingNowItem,
    required this.pickedLines,
    required this.totalLines,
    required this.kitProgress,
  });
  /// The item currently selected for picking (can be null if none).
  final BomItemModel? pickingNowItem;

  /// Number of lines currently picked.
  final int pickedLines;

  /// Total number of lines.
  final int totalLines;

  /// Picking progress ratio (0.0 to 1.0).
  final double kitProgress;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return Container(
      width: Sizes.width300 + Sizes.width50, // Roughly 350
      decoration: AppDecorations.bomRightPanel(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Picking Now Section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Sizes.padding24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    decoration: AppDecorations.bomPickingNowSection(),
                    child: IntrinsicHeight(
                      child: Row(
                        children: <Widget>[
                          const VerticalDivider(
                            width: Sizes.width0,
                            color: AppColors.newRollDarkBg,
                            thickness: Sizes.width4,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(Sizes.padding24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${l10n.bomPickingNow} · $pickedLines / $totalLines',
                                    style: AppTextStyles.inter.bomLabelText,
                                  ),
                                  const SizedBox(height: Sizes.size8),
                                  Text(
                                    pickingNowItem != null
                                        ? '${pickingNowItem!.description.split('·').first.trim()} · ${pickingNowItem!.description.contains('·') ? pickingNowItem!.description.split('·')[1].trim() : ''}'
                                        : 'No item selected',
                                    style: AppTextStyles.inter.bomHeaderTitle,
                                  ),
                                  const SizedBox(height: Sizes.size4),
                                  Text(
                                    pickingNowItem != null
                                        ? '${pickingNowItem!.childDescription} · qty ${pickingNowItem!.qty} ${pickingNowItem!.uom} · cut ${pickingNowItem!.cutBend}'
                                        : '',
                                    style: AppTextStyles.inter.bomTableBodySub,
                                  ),
                                  const SizedBox(height: Sizes.size16),
                                  // Camera Viewfinder Placeholder
                                  Container(
                                    height: Sizes.height160,
                                    decoration: AppDecorations.bomCameraPlaceholder(),
                                    child: Stack(
                                      children: <Widget>[
                                        // Dashed border effect (simulated with standard border for simplicity, or just a solid border since we don't have dashed border package)
                                        Container(
                                          decoration: AppDecorations.bomCameraPlaceholderBorder(),
                                        ),
                                        Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              const Icon(
                                                Icons.qr_code_scanner,
                                                color: AppColors.textSecondary,
                                              ),
                                              const SizedBox(width: Sizes.size8),
                                              Text(
                                                l10n.bomCameraViewfinder,
                                                style: AppTextStyles.inter.bomTableBodySub,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: Sizes.size16),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: AppButton(
                                          label: '[QR] Scan box tag',
                                          variant: BtnVariant.primary,
                                          onPressed: () {},
                                        ),
                                      ),
                                      const SizedBox(width: Sizes.size8),
                                      AppButton(
                                        label: 'Skip',
                                        variant: BtnVariant.secondary,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: Sizes.size24),
                  // Kit Progress Section
                  _kitProgress(l10n),
                ],
              ),
            ),
          ),
          // Bottom right button
          const Padding(padding: EdgeInsets.all(Sizes.padding24), child: BomActionButton()),
        ],
      ),
    );
  }

  Widget _buildBulletText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: Sizes.padding6, right: Sizes.padding8),
          child: Icon(Icons.circle, size: Sizes.size4, color: AppColors.textSecondary),
        ),
        Expanded(child: Text(text, style: AppTextStyles.inter.bomTableBodySub)),
      ],
    );
  }

  Widget _kitProgress(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(Sizes.padding24),
      decoration: AppDecorations.bomPickingNowSection(),
      child: Column(
        children: <Widget>[
          Text(l10n.bomKitProgress, style: AppTextStyles.inter.bomLabelText),
          const SizedBox(height: Sizes.size8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text('${(kitProgress * 100).toInt()}%', style: AppTextStyles.inter.bomProgressText),
              const SizedBox(width: Sizes.size8),
              Text(
                '$pickedLines ${l10n.bomOf} $totalLines ${l10n.bomLines}',
                style: AppTextStyles.inter.bomTableBodySub,
              ),
            ],
          ),
          const SizedBox(height: Sizes.size8),
          // Progress Bar
          Container(
            height: Sizes.height8,
            decoration: AppDecorations.bomProgressBarBg(),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: (kitProgress * 100).toInt(),
                  child: Container(decoration: AppDecorations.bomProgressBarFill()),
                ),
                Expanded(flex: 100 - (kitProgress * 100).toInt(), child: const SizedBox()),
              ],
            ),
          ),
          const SizedBox(height: Sizes.size16),
          _buildBulletText('Cut/bend specs auto-derived from BOM'),
          const SizedBox(height: Sizes.size4),
          _buildBulletText('Kanban bush picked at the end'),
          const SizedBox(height: Sizes.size4),
          _buildBulletText('Kit posts to production line on completion'),
        ],
      ),
    );
  }
}
