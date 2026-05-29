import 'package:control_card_prototype/common_lib.dart';

import '../models/work_order.dart';

class RecentNgList extends StatelessWidget {

  const RecentNgList({super.key, required this.recentNgs});
  final List<NgIssue> recentNgs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.detailsListContainer(),
      padding: const EdgeInsets.all(Sizes.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'RECENT NG • LAST 30 MIN',
            style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
          ),
          const SizedBox(height: Sizes.size16),
          ...recentNgs.map((NgIssue ng) => _buildNgItem(ng)),
        ],
      ),
    );
  }

  Widget _buildNgItem(NgIssue ng) {
    return Container(
      margin: const EdgeInsets.only(bottom: Sizes.margin12),
      padding: const EdgeInsets.only(bottom: Sizes.padding12),
      decoration: AppDecorations.detailsListItemBorder(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ng.time,
            style: AppTextStyles.liberationMono.textStyle10BoldGrey600.copyWith(
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(width: Sizes.size16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  ng.issue,
                  style: AppTextStyles.inter.textStyle12w600Black87,
                ),
                const SizedBox(height: Sizes.size2),
                Text(
                  '${ng.details} • by ${ng.checkedBy}',
                  style: AppTextStyles.liberationMono.textStyle10RegularGrey500,
                ),
              ],
            ),
          ),
          Text(
            ng.value,
            style: ng.isWarning
                ? AppTextStyles.liberationMono.textStyle11Bold.copyWith(
                    color: const Color(0xFFD32F2F),
                  )
                : AppTextStyles.liberationMono.textStyle11Bold.copyWith(
                    color: Colors.black87,
                  ),
          ),
        ],
      ),
    );
  }
}
