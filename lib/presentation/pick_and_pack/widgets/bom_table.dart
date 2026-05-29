import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/resources/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/presentation/pick_and_pack/models/bom_item_model.dart';
import 'package:control_card_prototype/presentation/pick_and_pack/widgets/bom_table_row.dart';

/// Displays the list of all BOM items inside a scrollable table layout,
/// including a title header and column headers.
class BomTable extends StatelessWidget {

  /// Creates a [BomTable].
  const BomTable({super.key, required this.items, required this.totalLines});
  /// The list of items to display.
  final List<BomItemModel> items;

  /// Total number of lines in the BOM.
  final int totalLines;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Title row
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.padding24,
            vertical: Sizes.padding16,
          ),
          child: Text(
            '${l10n.bomTitle} · $totalLines ${l10n.bomLineItems} · ${l10n.bomKitForAssembly}',
            style: AppTextStyles.inter.bomLabelText,
          ),
        ),
        // Table Container
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: Sizes.padding24),
            decoration: AppDecorations.bomTableContainer(),
            child: Column(
              children: <Widget>[
                // Table Header
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.padding16,
                    vertical: Sizes.padding12,
                  ),
                  decoration: AppDecorations.bomTableHeader(),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: Sizes.width40),
                      Expanded(
                        flex: 2,
                        child: Text(
                          l10n.bomChildSfg,
                          style: AppTextStyles.inter.bomTableHead,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          l10n.bomDescription,
                          style: AppTextStyles.inter.bomTableHead,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          l10n.bomQtyUom,
                          style: AppTextStyles.inter.bomTableHead,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          l10n.bomCutBend,
                          style: AppTextStyles.inter.bomTableHead,
                        ),
                      ),
                      SizedBox(
                        width: Sizes.width100,
                        child: Text(
                          l10n.bomStatus,
                          style: AppTextStyles.inter.bomTableHead,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
                // Table Body
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BomTableRow(item: items[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
