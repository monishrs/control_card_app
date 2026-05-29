import 'package:control_card_prototype/common_lib.dart';

import '../models/work_order.dart';
import 'stage_pipeline.dart';
import 'hose_rolls_list.dart';
import 'recent_ng_list.dart';
import 'action_buttons_row.dart';

class WorkOrderDetailsPanel extends StatelessWidget {

  const WorkOrderDetailsPanel({super.key, required this.workOrder});
  final WorkOrder workOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F7F7),
      child: ListView(
        padding: const EdgeInsets.all(Sizes.padding24),
        children: <Widget>[
          // Header info row
          Row(
            children: <Widget>[
              Text(
                'WO ${workOrder.id} • CC ${workOrder.cc} • ${workOrder.r} • LOT ${workOrder.lot} • LINE ${workOrder.line}',
                style:
                    AppTextStyles.liberationMono.textStyle12BoldGrey500Spacing1,
              ),
              const Spacer(),
              if (workOrder.status.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.padding8,
                    vertical: Sizes.padding4,
                  ),
                  decoration: AppDecorations.detailsStatusBadge(
                    status: workOrder.status,
                  ),
                  child: Text(
                    workOrder.status,
                    style: AppTextStyles.liberationMono.textStyle10BoldWhite,
                  ),
                ),
            ],
          ),
          const SizedBox(height: Sizes.size8),
          // Title row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                workOrder.partNumber,
                style: AppTextStyles.inter.textStyle32BoldBlack87,
              ),
              if (workOrder.priority.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.padding12,
                    vertical: Sizes.padding4,
                  ),
                  decoration: AppDecorations.detailsPriorityBadge(),
                  child: Text(
                    'PRIORITY - ${workOrder.priority}',
                    style: AppTextStyles.liberationMono.textStyle10BoldWhite,
                  ),
                ),
            ],
          ),
          const SizedBox(height: Sizes.size8),
          // Description
          Text(
            workOrder.description,
            style: AppTextStyles.liberationMono.textStyle12RegularGrey600,
          ),
          const SizedBox(height: Sizes.size24),
          // Stats Row
          Container(
            padding: const EdgeInsets.symmetric(vertical: Sizes.padding16),
            decoration: AppDecorations.detailsStatsContainer(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildStatItem(
                  'PLANNED',
                  workOrder.planned.toString(),
                  Colors.black87,
                ),
                _buildStatItem(
                  'TAKEN',
                  workOrder.taken.toString(),
                  Colors.black87,
                ),
                _buildStatItem(
                  'OK',
                  workOrder.ok.toString(),
                  const Color(0xFF1E8E3E),
                ),
                _buildStatItem(
                  'NG',
                  workOrder.ng.toString(),
                  const Color(0xFFD32F2F),
                ),
                _buildStatItem(
                  'YIELD',
                  '${workOrder.yieldPercentage}%',
                  const Color(0xFF1E8E3E),
                ),
              ],
            ),
          ),
          const SizedBox(height: Sizes.size24),
          // Pipeline
          StagePipelineWidget(workOrder: workOrder),
          const SizedBox(height: Sizes.size24),
          // Two column layout for Hose Rolls and Recent NG
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (workOrder.hoseRolls.isNotEmpty)
                Expanded(child: HoseRollsList(hoseRolls: workOrder.hoseRolls)),
              if (workOrder.hoseRolls.isNotEmpty &&
                  workOrder.recentNgs.isNotEmpty)
                const SizedBox(width: Sizes.size24),
              if (workOrder.recentNgs.isNotEmpty)
                Expanded(child: RecentNgList(recentNgs: workOrder.recentNgs)),
            ],
          ),
          const SizedBox(height: Sizes.size24),
          // Bottom action buttons
          ActionButtonsRow(workOrder: workOrder),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color valueColor) {
    return Column(
      children: <Widget>[
        Text(
          label,
          style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
        ),
        const SizedBox(height: Sizes.size4),
        Text(
          value,
          style: valueColor == Colors.black87
              ? AppTextStyles.inter.textStyle20BoldBlack87
              : valueColor == const Color(0xFF1E8E3E)
              ? AppTextStyles.inter.textStyle20BoldGreen
              : AppTextStyles.inter.textStyle20BoldRed,
        ),
      ],
    );
  }
}
