import 'package:control_card_prototype/common_lib.dart';
import 'package:go_router/go_router.dart';
import '../../work_orders/models/work_order.dart';

class StageListPanel extends StatelessWidget {

  const StageListPanel({super.key, required this.workOrder});
  final WorkOrder workOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      decoration: AppDecorations.stageListPanel(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildHeader(context),
          Expanded(
            child: ListView.separated(
              itemCount: workOrder.detailedStages.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(
                height: Sizes.height1,
                color: AppColors.stageGreyBorder,
              ),
              itemBuilder: (BuildContext context, int index) {
                return _buildStageItem(
                  context,
                  workOrder.detailedStages[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context)!;
    return InkWell(
      onTap: () {
        context.push(RouteNames.offlineProcessesScreen, extra: workOrder);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.padding16,
          vertical: Sizes.padding12,
        ),
        decoration: AppDecorations.stageListHeader(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${loc.stages} . ${workOrder.totalStages}',
              style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
            ),
            Text(
              loc.offlineOnline,
              style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStageItem(BuildContext context, DetailedStage stage) {
    final AppLocalizations loc = AppLocalizations.of(context)!;
    bool isActive = stage.status == 'active';
    bool isDone = stage.status == 'done';

    return InkWell(
      onTap: () {
        context.push(
          RouteNames.stageSetupScreen,
          extra: <String, Object>{'workOrder': workOrder, 'stage': stage},
        );
      },
      child: Container(
        decoration: AppDecorations.stageListItem(
          isActive: isActive,
        ),
        padding: const EdgeInsets.all(Sizes.padding16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Icon and Index column
            Column(
              children: <Widget>[
                Text(
                  stage.id,
                  style: isDone || isActive
                      ? AppTextStyles.inter.textStyle14BoldGreen
                      : AppTextStyles.inter.textStyle14BoldGrey,
                ),
                const SizedBox(height: Sizes.height4),
                if (isDone)
                  const Icon(
                    Icons.check_circle,
                    size: Sizes.iconSize16,
                    color: AppColors.stageLiveGreen,
                  )
                else if (isActive)
                  Container(
                    width: Sizes.width16,
                    height: Sizes.height16,
                    decoration: AppDecorations.stageActiveCircle(),
                  )
                else
                  const Icon(
                    Icons.close,
                    size: Sizes.iconSize16,
                    color: AppColors.grey400,
                  ),
              ],
            ),
            const SizedBox(width: Sizes.width16),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        stage.name,
                        style: AppTextStyles.inter.textStyle14BoldBlack87,
                      ),
                      if (stage.isOffline)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.padding6,
                            vertical: Sizes.padding2,
                          ),
                          decoration: AppDecorations.stageOfflineTag(),
                          child: Text(
                            loc.offline.toUpperCase(),
                            style: AppTextStyles
                                .liberationMono
                                .textStyle10BoldGrey600,
                          ),
                        )
                      else if (stage.isGate)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.padding6,
                            vertical: Sizes.padding2,
                          ),
                          decoration: AppDecorations.stageGateTag(),
                          child: Text(
                            'GATE', // Assuming GATE is not localized or maybe it is? We will leave it as GATE for now since it wasn't requested.
                            style: AppTextStyles
                                .liberationMono
                                .textStyle10BoldBlue,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: Sizes.height4),
                  if (stage.assigneeInfo.isNotEmpty || stage.hasKakotora)
                    Row(
                      children: <Widget>[
                        if (stage.assigneeInfo.isNotEmpty)
                          Expanded(
                            child: Text(
                              stage.assigneeInfo,
                              style: AppTextStyles
                                  .liberationMono
                                  .textStyle10RegularGrey600,
                            ),
                          ),
                        if (stage.hasKakotora)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.padding4,
                              vertical: Sizes.padding2,
                            ),
                            decoration: AppDecorations.stageKakotoraTag(),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.star,
                                  size: Sizes.iconSize10,
                                  color: AppColors.pinkBorder,
                                ),
                                const SizedBox(width: Sizes.width2),
                                Text(
                                  loc.kakotora,
                                  style: AppTextStyles
                                      .liberationMono
                                      .textStyle8BoldPink,
                                ),
                              ],
                            ),
                          ),
                      ],
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
