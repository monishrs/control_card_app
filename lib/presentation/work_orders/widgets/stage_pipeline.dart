import 'package:control_card_prototype/common_lib.dart';
import '../models/work_order.dart';

class StagePipelineWidget extends StatelessWidget {

  const StagePipelineWidget({super.key, required this.workOrder});
  final WorkOrder workOrder;

  @override
  Widget build(BuildContext context) {
    if (workOrder.pipeline.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'STAGE PIPELINE • OFFLINE → ONLINE',
              style:
                  AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
            ),
            Text(
              'STAGE 0${workOrder.currentStageIndex} / 0${workOrder.totalStages} - ${workOrder.stageProgressPercentage.toInt()}%',
              style: AppTextStyles.liberationMono.textStyle10BoldBlueDark,
            ),
          ],
        ),
        const SizedBox(height: Sizes.size12),
        Row(
          children: workOrder.pipeline.map((StagePipeline stage) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: Sizes.padding8),
                child: _buildStageBox(stage),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStageBox(StagePipeline stage) {
    Color bgColor;
    Color textColor;

    if (stage.status == 'done') {
      bgColor = const Color(0xFF1E8E3E);
      textColor = Colors.white;
    } else if (stage.status == 'active') {
      bgColor = const Color(0xFF1F3A5F);
      textColor = Colors.white;
    } else {
      bgColor = const Color(0xFFEEEEEE);
      textColor = Colors.grey[500]!;
    }

    return Container(
      height: Sizes.height60,
      decoration: AppDecorations.statusBadge(
        color: bgColor,
        radius: Sizes.radius4,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            stage.id,
            style: AppTextStyles.liberationMono.textStyle10Bold.copyWith(
              color: textColor.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: Sizes.size2),
          Text(
            stage.name,
            style: AppTextStyles.inter.textStyle12Bold.copyWith(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
