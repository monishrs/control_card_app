import 'package:control_card_prototype/common_lib.dart';

import '../models/work_order.dart';

class HoseRollsList extends StatelessWidget {

  const HoseRollsList({super.key, required this.hoseRolls});
  final List<HoseRoll> hoseRolls;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.detailsListContainer(),
      padding: const EdgeInsets.all(Sizes.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'HOSE ROLLS IN USE',
                style:
                    AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
              ),
              Text(
                '${hoseRolls.length} of 10 max',
                style: AppTextStyles.liberationMono.textStyle10RegularGrey500,
              ),
            ],
          ),
          const SizedBox(height: Sizes.size16),
          ...hoseRolls.map((HoseRoll roll) => _buildRollItem(roll)),
        ],
      ),
    );
  }

  Widget _buildRollItem(HoseRoll roll) {
    return Container(
      margin: const EdgeInsets.only(bottom: Sizes.margin12),
      padding: const EdgeInsets.only(bottom: Sizes.padding12),
      decoration: AppDecorations.detailsListItemBorder(),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.padding8,
              vertical: Sizes.padding4,
            ),
            decoration: AppDecorations.detailsRollIdBadge(),
            child: Text(
              roll.id,
              style: AppTextStyles.liberationMono.textStyle12BoldGreen,
            ),
          ),
          const SizedBox(width: Sizes.size12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                roll.name,
                style: AppTextStyles.inter.textStyle12w600Black87,
              ),
              const SizedBox(height: Sizes.size2),
              Text(
                'Checked by ${roll.checkedBy} • ${roll.usage}',
                style: AppTextStyles.liberationMono.textStyle10RegularGrey500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
