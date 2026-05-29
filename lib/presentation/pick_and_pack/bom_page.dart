import 'package:control_card_prototype/common_lib.dart';
import 'package:control_card_prototype/presentation/pick_and_pack/widgets/bom_header.dart';
import 'package:control_card_prototype/presentation/pick_and_pack/widgets/bom_info_card.dart';
import 'package:control_card_prototype/presentation/pick_and_pack/widgets/bom_table.dart';
import 'package:control_card_prototype/presentation/pick_and_pack/widgets/bom_right_panel.dart';
import 'package:control_card_prototype/presentation/pick_and_pack/widgets/bom_error_banner.dart';
import 'package:control_card_prototype/presentation/pick_and_pack/models/bom_page_model.dart';

/// Main page for the Bill of Materials (BOM) view in the Pick & Pack process.
/// This page displays the BOM details, pick progress, and a list of items to pick.
class BomPage extends StatelessWidget {
  /// Constructor for [BomPage].
  const BomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BomPageModel model = mockBomPageData;
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.neutralBg,
      appBar: CustomAppBar(
        title: l10n.pickPackPage,
        subTitle: '${l10n.bomWo} ${model.woNo} · ${model.partNo} · ${l10n.bomStore}',
        actions: <Widget>[BomHeader(pickedLines: model.pickedLines, totalLines: model.totalLines)],
        isLeadingEnabled: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            BomInfoCard(
              woNo: model.woNo,
              partNo: model.partNo,
              assyLot: model.assyLot,
              qty: model.qty,
              planDate: model.planDate,
              priority: model.priority,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: BomTable(
                            items: model.items,
                            totalLines: model.totalLines,
                          ),
                        ),
                        if (model.hasError &&
                            model.errorTitle != null &&
                            model.errorDescription != null)
                          BomErrorBanner(
                            title: model.errorTitle!,
                            description: model.errorDescription!,
                          ),
                      ],
                    ),
                  ),
                  BomRightPanel(
                    pickingNowItem: model.pickingNowItem,
                    pickedLines: model.pickedLines,
                    totalLines: model.totalLines,
                    kitProgress: model.kitProgress,
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
