import 'package:control_card_prototype/common_lib.dart';

import '../models/work_order.dart';

class WorkOrderCard extends StatelessWidget {

  const WorkOrderCard({
    super.key,
    required this.workOrder,
    required this.isSelected,
    required this.onTap,
  });
  final WorkOrder workOrder;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isRunning = workOrder.status == 'RUNNING';
    final Color statusColor = isRunning
        ? const Color(0xFF1E8E3E)
        : const Color(0xFFD97706);

    return InkWell(
      onTap: onTap,
      child: Container(
        color: isSelected ? const Color(0xFFE8F0FE) : Colors.white,
        padding: const EdgeInsets.all(Sizes.padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Top row: WO number, priority, status badge
            Row(
              children: <Widget>[
                Text(
                  'WO ${workOrder.id}',
                  style: AppTextStyles.liberationMono.textStyle14BoldBlack87,
                ),
                if (workOrder.priority.isNotEmpty) ...<Widget>[
                  const SizedBox(width: Sizes.size8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.padding6,
                      vertical: Sizes.padding2,
                    ),
                    decoration: AppDecorations.cardPriorityBadge(),
                    child: Text(
                      workOrder.priority,
                      style: AppTextStyles.liberationMono.textStyle10BoldWhite,
                    ),
                  ),
                ],
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.padding8,
                    vertical: Sizes.padding4,
                  ),
                  decoration: AppDecorations.cardStatusBadge(
                    statusColor: statusColor,
                  ),
                  child: Text(
                    workOrder.status,
                    style: AppTextStyles.liberationMono.textStyle10Bold
                        .copyWith(color: statusColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Sizes.size8),
            // Part details
            Text(
              '${workOrder.partNumber} • ${workOrder.partName}',
              style: AppTextStyles.inter.textStyle13w600Black87,
            ),
            const SizedBox(height: Sizes.size12),
            // Planned, Lot, Line info
            Row(
              children: <Widget>[
                _buildInfoColumn('PLANNED', workOrder.planned.toString()),
                const SizedBox(width: Sizes.size24),
                _buildInfoColumn('LOT', workOrder.lot),
                const SizedBox(width: Sizes.size24),
                _buildInfoColumn('LINE', workOrder.line),
              ],
            ),
            const SizedBox(height: Sizes.size16),
            // Progress Bar area
            if (workOrder.currentStageName.isNotEmpty) ...<Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${workOrder.currentStageName} - ${workOrder.currentStageIndex}/${workOrder.totalStages}',
                    style:
                        AppTextStyles.liberationMono.textStyle11RegularGrey600,
                  ),
                  Text(
                    '${workOrder.stageProgressPercentage.toInt()}%',
                    style: isRunning
                        ? AppTextStyles.liberationMono.textStyle11BoldGreen
                        : AppTextStyles.liberationMono.textStyle11BoldOrange,
                  ),
                ],
              ),
              const SizedBox(height: Sizes.size8),
              LinearProgressIndicator(
                value: workOrder.stageProgressPercentage / 100,
                backgroundColor: Colors.grey[200],
                color: isRunning
                    ? const Color(0xFF1E8E3E)
                    : const Color(0xFFD97706),
                minHeight: Sizes.size4,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style:
              AppTextStyles.liberationMono.textStyle10RegularGrey500Spacing05,
        ),
        const SizedBox(height: Sizes.size2),
        Text(value, style: AppTextStyles.liberationMono.textStyle13BoldBlack87),
      ],
    );
  }
}
