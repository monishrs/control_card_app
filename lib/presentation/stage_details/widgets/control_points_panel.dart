import 'package:control_card_prototype/common_lib.dart';

import '../../work_orders/models/work_order.dart';

class ControlPointsPanel extends StatelessWidget {

  const ControlPointsPanel({
    super.key,
    required this.workOrder,
    required this.activeStage,
  });
  final WorkOrder workOrder;
  final DetailedStage activeStage;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context)!;
    return Container(
      color: const Color(0xFFF7F7F7),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(Sizes.padding24),
              children: <Widget>[
                _buildHeader(context),
                const SizedBox(height: Sizes.height12),
                Text(
                  activeStage
                      .name, // Will use "Crimping End A" or "Caulking" depending on mock
                  style: AppTextStyles.inter.textStyle24BoldBlack87,
                ),
                const SizedBox(height: Sizes.height8),
                Text(
                  '${activeStage.controlPoints.length} control points • ${AppConstants.sampleNWifiVernier}',
                  style: AppTextStyles.liberationMono.textStyle12RegularGrey600,
                ),
                const SizedBox(height: Sizes.height24),
                _buildRequirementCards(),
                const SizedBox(height: Sizes.height32),
                Text(
                  loc.controlPoints,
                  style: AppTextStyles
                      .liberationMono
                      .textStyle10BoldGrey500Spacing1,
                ),
                const SizedBox(height: Sizes.height16),
                _buildControlPointsTable(context),
              ],
            ),
          ),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'STAGE ${activeStage.id} / ${workOrder.totalStages.toString().padLeft(2, '0')} • ${AppConstants.offlineCrimping}',
          style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
        ),
        Row(
          children: <Widget>[
            Container(
              width: Sizes.width6,
              height: Sizes.height6,
              decoration: AppDecorations.onlineCircleIndicator(),
            ),
            const SizedBox(width: Sizes.width6),
            Text(
              AppConstants.sessionLockedYou,
              style:
                  AppTextStyles.liberationMono.textStyle10BoldGrey600Spacing1,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRequirementCards() {
    if (activeStage.requirements.isEmpty) return const SizedBox.shrink();
    return Row(
      children: activeStage.requirements.map((RequirementCard req) {
        bool isWarning = req.isWarning;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: Sizes.margin12),
            padding: const EdgeInsets.all(Sizes.padding12),
            decoration: AppDecorations.requirementCard(isWarning: isWarning),
            child: Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(Sizes.padding4),
                  decoration: AppDecorations.requirementCardIcon(
                    isWarning: isWarning,
                  ),
                  child: Icon(
                    isWarning ? Icons.priority_high : Icons.check,
                    size: Sizes.iconSize16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: Sizes.width8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        req.type,
                        style: AppTextStyles
                            .liberationMono
                            .textStyle8BoldGrey500Spacing1,
                      ),
                      const SizedBox(height: Sizes.height2),
                      Text(
                        req.value,
                        style: AppTextStyles.inter.textStyle12BoldBlack87,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildControlPointsTable(BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context)!;
    return Container(
      decoration: AppDecorations.controlPointsTableContainer(),
      child: Column(
        children: activeStage.controlPoints.asMap().entries.map((MapEntry<int, ControlPoint> entry) {
          int index = entry.key;
          ControlPoint cp = entry.value;
          bool isLast = index == activeStage.controlPoints.length - 1;

          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.padding16,
              vertical: Sizes.padding12,
            ),
            decoration: AppDecorations.controlPointsRow(isLast: isLast),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: Sizes
                      .width50, // kept as is or adjust if necessary, maybe width48
                  child: Text(
                    cp.id,
                    style: AppTextStyles.liberationMono.textStyle10BoldGrey500,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            cp.title,
                            style: AppTextStyles.inter.textStyle14BoldBlack87,
                          ),
                          if (cp.hasKakotora) ...<Widget>[
                            const SizedBox(width: Sizes.width8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Sizes.padding4,
                                vertical: Sizes.padding2,
                              ),
                              decoration: AppDecorations.controlPointKakTag(),
                              child: Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.star,
                                    size: Sizes.iconSize10,
                                    color: Color(0xFFD32F2F),
                                  ),
                                  const SizedBox(width: Sizes.width2),
                                  Text(
                                    loc.kak,
                                    style: AppTextStyles
                                        .liberationMono
                                        .textStyle8BoldRed,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: Sizes.height2),
                      Text(
                        cp.method,
                        style: AppTextStyles
                            .liberationMono
                            .textStyle10RegularGrey500,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    cp.spec,
                    style: AppTextStyles.liberationMono.textStyle12BoldBlack87,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    cp.value,
                    style: cp.isOk
                        ? AppTextStyles.liberationMono.textStyle12BoldGreen
                        : AppTextStyles.liberationMono.textStyle12BoldRed,
                  ),
                ),
                SizedBox(
                  width: Sizes.width100, // kept as is
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.padding6,
                          vertical: Sizes.padding2,
                        ),
                        decoration: AppDecorations.controlPointOkTag(),
                        child: Text(
                          '${loc.ok} ${cp.okCount}',
                          style:
                              AppTextStyles.liberationMono.textStyle10BoldGreen,
                        ),
                      ),
                      const SizedBox(width: Sizes.width8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.padding6,
                          vertical: Sizes.padding2,
                        ),
                        decoration: AppDecorations.controlPointNgTag(
                          hasNg: cp.ngCount > 0,
                        ),
                        child: Text(
                          '${loc.ng} ${cp.ngCount}',
                          style: cp.ngCount > 0
                              ? AppTextStyles.liberationMono.textStyle10BoldRed
                              : AppTextStyles
                                    .liberationMono
                                    .textStyle10BoldGrey500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(Sizes.padding24),
      child: Row(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E8E3E),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.radius4),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding24,
                vertical: Sizes.padding20,
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  loc.resumeStageEntry,
                  style: AppTextStyles.inter.textStyle14Bold,
                ),
                const SizedBox(width: Sizes.width8),
                const Icon(Icons.arrow_forward, size: Sizes.iconSize18),
              ],
            ),
          ),
          const SizedBox(width: Sizes.width16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE0E0E0),
              foregroundColor: Colors.black87,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.radius4),
                side: const BorderSide(color: Colors.black54),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding24,
                vertical: Sizes.padding20,
              ),
            ),
            child: Text(
              loc.openAsQcEditor,
              style: AppTextStyles.inter.textStyle14Bold,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF7F7F7),
              foregroundColor: const Color(0xFFD32F2F),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.radius4),
                side: const BorderSide(color: Color(0xFFD32F2F)),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding24,
                vertical: Sizes.padding20,
              ),
            ),
            child: Text(
              loc.resetStageBreakdown,
              style: AppTextStyles.inter.textStyle14Bold,
            ),
          ),
        ],
      ),
    );
  }
}
