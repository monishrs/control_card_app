import 'package:control_card_prototype/common_lib.dart';
import 'package:go_router/go_router.dart';

import '../../work_orders/models/work_order.dart';

class StageDetailsHeader extends StatelessWidget {

  const StageDetailsHeader({super.key, required this.workOrder});
  final WorkOrder workOrder;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding24,
        vertical: Sizes.padding16,
      ),
      decoration: AppDecorations.stageDetailsHeader(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Back button
          InkWell(
            onTap: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/');
              }
            },
            child: Container(
              padding: const EdgeInsets.all(Sizes.padding8),
              decoration: AppDecorations.stageDetailsBackButton(),
              child: const Icon(
                Icons.chevron_left,
                size: Sizes.iconSize24,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: Sizes.width16),
          // Title info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'WO ${workOrder.id} • ${workOrder.priority} • CC ${workOrder.cc} • LINE ${workOrder.line}',
                  style: AppTextStyles
                      .liberationMono
                      .textStyle10BoldGrey500Spacing1,
                ),
                const SizedBox(height: Sizes.height4),
                Text(
                  workOrder.partNumber,
                  style: AppTextStyles.inter.textStyle24BoldBlack87,
                ),
              ],
            ),
          ),
          // Right actions
          if (workOrder.status.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(right: Sizes.margin16),
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding12,
                vertical: Sizes.padding6,
              ),
              decoration: AppDecorations.detailsStatusBadge(
                status: workOrder.status,
                radius: Sizes.radius4,
              ),
              child: Text(
                workOrder.status,
                style: AppTextStyles.liberationMono.textStyle12BoldWhite,
              ),
            ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              elevation: 0,
              side: const BorderSide(color: Colors.black87),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.radius4),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding16,
                vertical: Sizes.padding16,
              ),
            ),
            child: Text(
              loc.viewControlCard,
              style: AppTextStyles.inter.textStyle14w600,
            ),
          ),
        ],
      ),
    );
  }
}
