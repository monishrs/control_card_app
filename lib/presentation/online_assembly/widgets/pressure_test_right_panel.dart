import 'package:control_card_prototype/common_lib.dart';
import 'package:control_card_prototype/presentation/online_assembly/models/pressure_test_model.dart';

class PressureTestRightPanel extends StatelessWidget {

  const PressureTestRightPanel({super.key, required this.model});
  final PressureTestPageModel model;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final StageTallyModel  tally = model.tally;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // STAGE TALLY
        Container(
          padding: const EdgeInsets.all(Sizes.padding16),
          decoration: AppDecorations.ptSidePanelContainer(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(l10n.ptStageTally, style: AppTextStyles.inter.ptLabel),
              const SizedBox(height: Sizes.size16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _testDatas(l10n.ptTested, tally.tested.toString(), AppColors.black),
                  _testDatas(l10n.ptPending, tally.pending.toString(), AppColors.black),
                ],
              ),
              const SizedBox(height: Sizes.size16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _testDatas(l10n.ptPassed, tally.passed.toString(), AppColors.success),
                  _testDatas(l10n.ptFailed, tally.failed.toString(), AppColors.danger),
                ],
              ),
              const SizedBox(height: Sizes.size24),
              // Progress Bar
              Stack(
                children: <Widget>[
                  Container(height: Sizes.size8, decoration: AppDecorations.bomProgressBarBg()),
                  Positioned.fill(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: Sizes.size8,
                          decoration: AppDecorations.bomProgressBarFill().copyWith(
                            color: AppColors.success,
                          ),
                        ),
                        Container(
                          width: 5,
                          height: Sizes.size8,
                          decoration: AppDecorations.bomDangerProgressBarFill(),
                        ),
                      ],
                    ),
                  ),
                  // FractionallySizedBox(
                  //   widthFactor: tally.completePercentage / 100,
                  //   child: Container(
                  //     height: Sizes.size8,
                  //     decoration: AppDecorations.bomProgressBarFill().copyWith(
                  //       color: AppColors.success,
                  //     ),
                  //   ),
                  // ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: FractionallySizedBox(
                  //     widthFactor: tally.yieldPercentage > 95 ? 0.05 : 0.2,
                  //     // Rough estimate for red zone
                  //     child: Container(
                  //       height: Sizes.size8,
                  //       decoration: AppDecorations.bomProgressBarFill().copyWith(
                  //         color: AppColors.danger,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: Sizes.size8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${tally.completePercentage.toInt()}% ${l10n.ptComplete}',
                    style: AppTextStyles.inter.bomTableBodySub,
                  ),
                  Text(
                    '${l10n.ptYield} ${tally.yieldPercentage.toStringAsFixed(1)}%',
                    style: AppTextStyles.inter.bomTableBodySub,
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: Sizes.size24),

        // LAST 8 PIECES
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(Sizes.padding16),
            decoration: AppDecorations.ptSidePanelContainer(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(l10n.ptLast8Pieces, style: AppTextStyles.inter.ptLabel),
                const SizedBox(height: Sizes.size16),
                Expanded(
                  child: ListView.separated(
                    itemCount: model.lastPieces.length,
                    separatorBuilder: (BuildContext context,int index) =>
                        const Divider(color: AppColors.greyBorder, height: 1),
                    itemBuilder: (BuildContext context,int index) {
                      final PieceTestModel piece = model.lastPieces[index];
                      return _listCard(piece, l10n);
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

  Widget _testDatas(String title, String subTitle, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: AppTextStyles.inter.bomLabelText),
        Text(subTitle, style: AppTextStyles.inter.ptTallyValueBlack.copyWith(color: color)),
      ],
    );
  }

  Widget _listCard(PieceTestModel piece, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.padding12),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 40,
            child: Text(piece.pieceId, style: AppTextStyles.liberationMono.bomTableBodySub),
          ),
          Expanded(
            child: Text(
              '${piece.pressure.toStringAsFixed(1)} ${l10n.ptMpa}',
              style: AppTextStyles.liberationMono.ptTableData,
            ),
          ),
          Text('${piece.time}${l10n.ptS}', style: AppTextStyles.liberationMono.bomTableBodySub),
          const SizedBox(width: Sizes.size16),
          CustomOutlinedButton(
            title: piece.isOk ? l10n.ptOk : l10n.ptNg,
            onPressed: () {},
            padding: const EdgeInsets.symmetric(vertical: Sizes.padding4, horizontal: Sizes.padding16),
          ),
        ],
      ),
    );
  }
}
