import 'package:flutter/material.dart';

import 'data/mock_data.dart';
import 'widgets/header_section.dart';
import 'widgets/statistics_row.dart';
import 'widgets/work_order_list_panel.dart';
import 'widgets/work_order_details_panel.dart';

class WorkOrdersScreen extends StatefulWidget {
  const WorkOrdersScreen({super.key});

  @override
  State<WorkOrdersScreen> createState() => _WorkOrdersScreenState();
}

class _WorkOrdersScreenState extends State<WorkOrdersScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Basic color palette based on the design
    final Color bgColor = const Color(0xFFF7F7F7);
    final Color borderColor = const Color(0xFFE0E0E0);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Top Header
            const HeaderSection(),
            // Divider
            Divider(height: 1, thickness: 1, color: borderColor),
            // Statistics Row
            const StatisticsRow(),
            // Divider
            Divider(height: 1, thickness: 1, color: borderColor),
            // Main Content Area
            Expanded(
              child: Row(
                children: <Widget>[
                  // Left Panel (Work Order List)
                  SizedBox(
                    width: 380, // Fixed width for left panel
                    child: WorkOrderListPanel(
                      workOrders: mockWorkOrders,
                      selectedIndex: _selectedIndex,
                      onSelect: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ),
                  // Vertical Divider
                  VerticalDivider(width: 1, thickness: 1, color: borderColor),
                  // Right Panel (Work Order Details)
                  Expanded(
                    child: WorkOrderDetailsPanel(
                      workOrder: mockWorkOrders[_selectedIndex],
                    ),
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
