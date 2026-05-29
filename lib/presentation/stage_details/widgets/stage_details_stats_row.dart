import 'package:control_card_prototype/common_lib.dart';

import '../../work_orders/models/work_order.dart';

class StageDetailsStatsRow extends StatelessWidget {

  const StageDetailsStatsRow({super.key, required this.workOrder});
  final WorkOrder workOrder;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context)!;
    return Container(
      color: const Color(0xFFF0F0F0),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding24,
        vertical: Sizes.padding16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildStatItem(
            loc.planned,
            workOrder.planned.toString(),
            Colors.black87,
          ),
          _buildStatItem(loc.taken, workOrder.taken.toString(), Colors.black87),
          _buildStatItem(
            loc.ok,
            workOrder.ok.toString(),
            const Color(0xFF1E8E3E),
          ),
          _buildStatItem(
            loc.ng,
            workOrder.ng.toString(),
            const Color(0xFFD32F2F),
          ),
          _buildStatItem(loc.lot, workOrder.lot, Colors.black87),
          _buildStatItem(loc.assy, workOrder.assy, Colors.black87),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '${loc.bomRev} 14',
                style:
                    AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
              ),
              const SizedBox(height: Sizes.height4),
              Text(
                workOrder.bomRev,
                style:
                    AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
        ),
        const SizedBox(height: Sizes.height4),
        Text(
          value,
          style: AppTextStyles.inter.textStyle18Bold.copyWith(
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
