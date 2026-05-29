import 'package:control_card_prototype/common_lib.dart';

import '../models/work_order.dart';
import 'work_order_card.dart';

class WorkOrderListPanel extends StatelessWidget {

  const WorkOrderListPanel({
    super.key,
    required this.workOrders,
    required this.selectedIndex,
    required this.onSelect,
  });
  final List<WorkOrder> workOrders;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          // Filter Tabs
          Container(
            padding: const EdgeInsets.all(Sizes.padding16),
            decoration: AppDecorations.filterTabsContainer(),
            child: Row(
              children: <Widget>[
                _buildFilterChip('ALL • 18', true),
                const SizedBox(width: Sizes.size8),
                _buildFilterChip('TODAY', false),
                const SizedBox(width: Sizes.size8),
                _buildFilterChip('PRIORITY', false),
                const SizedBox(width: Sizes.size8),
                _buildFilterChip('FRONT RH', false),
              ],
            ),
          ),
          // List
          Expanded(
            child: ListView.separated(
              itemCount: workOrders.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(
                height: Sizes.size1,
                thickness: Sizes.size1,
                color: Color(0xFFE0E0E0),
              ),
              itemBuilder: (BuildContext context, int index) {
                return WorkOrderCard(
                  workOrder: workOrders[index],
                  isSelected: index == selectedIndex,
                  onTap: () => onSelect(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding12,
        vertical: Sizes.padding6,
      ),
      decoration: AppDecorations.filterChip(isSelected: isSelected),
      child: Text(
        label,
        style: isSelected
            ? AppTextStyles.liberationMono.textStyle10BoldWhiteSpacing05
            : AppTextStyles.liberationMono.textStyle10BoldGrey600Spacing05,
      ),
    );
  }
}
