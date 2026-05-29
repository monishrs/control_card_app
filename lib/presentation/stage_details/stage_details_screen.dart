import 'package:flutter/material.dart';

import '../work_orders/models/work_order.dart';
import 'widgets/stage_details_header.dart';
import 'widgets/stage_details_stats_row.dart';
import 'widgets/stage_list_panel.dart';
import 'widgets/control_points_panel.dart';

class StageDetailsScreen extends StatelessWidget {

  const StageDetailsScreen({super.key, required this.workOrder});
  final WorkOrder workOrder;

  @override
  Widget build(BuildContext context) {
    // Find the active stage from the mock data to display in the right panel.
    // If not found, default to the first detailed stage (if any).
    DetailedStage activeStage;
    try {
      activeStage = workOrder.detailedStages.firstWhere(
        (DetailedStage s) => s.status == 'active',
      );
    } catch (e) {
      activeStage = workOrder.detailedStages.isNotEmpty
          ? workOrder.detailedStages.first
          : DetailedStage(id: '00', name: 'Unknown', status: 'unknown');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          StageDetailsHeader(workOrder: workOrder),
          StageDetailsStatsRow(workOrder: workOrder),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                StageListPanel(workOrder: workOrder),
                Expanded(
                  child: ControlPointsPanel(
                    workOrder: workOrder,
                    activeStage: activeStage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
