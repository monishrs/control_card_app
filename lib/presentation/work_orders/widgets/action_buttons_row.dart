import 'package:control_card_prototype/common_lib.dart';
import 'package:go_router/go_router.dart';

import '../models/work_order.dart';

class ActionButtonsRow extends StatelessWidget {

  const ActionButtonsRow({super.key, required this.workOrder});
  final WorkOrder workOrder;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context)!;
    return Row(
      children: <Widget>[
        if (workOrder.currentStageName.isNotEmpty)
          Expanded(
            flex: 2,
            child: _buildPrimaryButton(
              context,
              '${loc.resumeStage} 0${workOrder.currentStageIndex} - ${workOrder.currentStageName} →',
            ),
          ),
        if (workOrder.currentStageName.isNotEmpty)
          const SizedBox(width: Sizes.width12),
        Expanded(
          child: _buildOutlineButton(
            loc.viewControlCard.replaceFirst(' ', '\n'),
            onTap: () {
              context.push(RouteNames.pressureTestPage);
            },
          ),
        ),
        const SizedBox(width: Sizes.width12),
        Expanded(
          child: _buildOutlineButton(
            loc.printPickAndPack.replaceFirst(' ', '\n'),
            onTap: () {
              context.push(RouteNames.pickPackBomPage);
            },
          ),
        ),
        const SizedBox(width: Sizes.width12),
        Expanded(child: _buildDangerButton(loc.raiseBreakdown.replaceFirst(' ', '\n'))),
      ],
    );
  }

  Widget _buildPrimaryButton(BuildContext context, String text) {
    return ElevatedButton(
      onPressed: () {
        context.push('/stage-details', extra: workOrder);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1E8E3E),
        padding: const EdgeInsets.symmetric(vertical: Sizes.padding16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.radius4)),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.inter.textStyle14Bold.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildOutlineButton(String text, {VoidCallback? onTap}) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: Sizes.padding16),
        side: const BorderSide(color: Color(0xFFE0E0E0), width: Sizes.width1P5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.radius4)),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.inter.textStyle12BoldBlack87,
      ),
    );
  }

  Widget _buildDangerButton(String text) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: Sizes.padding16),
        side: const BorderSide(color: Color(0xFFD32F2F), width: Sizes.width1P5),
        backgroundColor: const Color(0xFFFFF0F0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.radius4)),
      ),
      child: Text(text, textAlign: TextAlign.center, style: AppTextStyles.inter.textStyle12BoldRed),
    );
  }
}
