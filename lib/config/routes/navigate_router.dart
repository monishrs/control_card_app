import 'package:control_card_prototype/config/routes/route_names.dart';
import 'package:control_card_prototype/presentation/alert/alert_screen.dart';
import 'package:control_card_prototype/presentation/darft_ui.dart';
import 'package:control_card_prototype/presentation/final_inspection/final_inspection_page.dart';
import 'package:control_card_prototype/presentation/login/login_screen.dart';
import 'package:control_card_prototype/presentation/main_layout/main_layout.dart';
import 'package:control_card_prototype/presentation/online_assembly/pressure_test_page.dart';
import 'package:control_card_prototype/presentation/pick_and_pack/bom_page.dart';
import 'package:control_card_prototype/presentation/qr_scan/qr_scan_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:control_card_prototype/presentation/work_orders/work_orders_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:control_card_prototype/presentation/stage_details/stage_details_screen.dart';
import 'package:control_card_prototype/presentation/stage_details/offline_processes_screen.dart';
import 'package:control_card_prototype/presentation/stage_setup/stage_setup_screen.dart';
import 'package:control_card_prototype/presentation/stage_setup/quality_setup_screen.dart';
import 'package:control_card_prototype/presentation/work_orders/models/work_order.dart';
import 'package:control_card_prototype/presentation/work_orders/data/mock_data.dart';

/// A centralized router class to manage
/// application navigation using GoRouter.
class NavigateRouter {
  NavigateRouter._();

  // ──────────────────────────────────────────
  // GoRouter Configuration
  // ──────────────────────────────────────────
  /// SINGLE INSTANCE
  static final NavigateRouter instance = NavigateRouter._();

  /// Main router configuration for the app.
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.loginScreen,

    /// List of application routes.
    routes: <RouteBase>[
      /// Root route (Initial Screen)
      GoRoute(
        path: RouteNames.loginScreen,

        /// Builds the Daily News screen.
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),

        /// Nested routes under initial screen.
        routes: <RouteBase>[
          /// Details screen route
          GoRoute(
            path: RouteNames.detailsScreen,

            /// Builds the details screen.
            /// Replace Container() with actual screen widget.
            builder: (BuildContext context, GoRouterState state) => Container(),
          ),
        ],
      ),
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MainLayout(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: RouteNames.stageSetupScreen,
            builder: (BuildContext context, GoRouterState state) {
              WorkOrder? workOrder;
              DetailedStage? stage;
              if (state.extra is Map<String, dynamic>) {
                final Map<String, dynamic> extra =
                    state.extra as Map<String, dynamic>;
                workOrder = extra['workOrder'] as WorkOrder?;
                stage = extra['stage'] as DetailedStage?;
              }
              workOrder ??= mockWorkOrders.first;
              stage ??= workOrder.detailedStages.firstWhere(
                (DetailedStage s) => s.id == '05',
                orElse: () => workOrder!.detailedStages.first,
              );
              return StageSetupScreen(workOrder: workOrder, stage: stage);
            },
          ),
          GoRoute(
            path: RouteNames.qualitySetupScreen,
            builder: (BuildContext context, GoRouterState state) {
              WorkOrder? workOrder;
              DetailedStage? stage;
              if (state.extra is Map<String, dynamic>) {
                final Map<String, dynamic> extra =
                    state.extra as Map<String, dynamic>;
                workOrder = extra['workOrder'] as WorkOrder?;
                stage = extra['stage'] as DetailedStage?;
              }
              workOrder ??= mockWorkOrders.first;
              stage ??= workOrder.detailedStages.firstWhere(
                (DetailedStage s) => s.id == '05',
                orElse: () => workOrder!.detailedStages.first,
              );
              return QualitySetupScreen(workOrder: workOrder, stage: stage);
            },
          ),
          GoRoute(
            path: RouteNames.stageDetailsScreen,
            builder: (BuildContext context, GoRouterState state) {
              final WorkOrder workOrder = (state.extra is WorkOrder)
                  ? state.extra as WorkOrder
                  : mockWorkOrders.first;
              return StageDetailsScreen(workOrder: workOrder);
            },
          ),
          GoRoute(
            path: RouteNames.stageScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen('stageScreen');
            },
          ),
          GoRoute(
            path: RouteNames.scanScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const QrScanScreen();
            },
          ),
          GoRoute(
            path: RouteNames.alertScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const AlertScreen();
            },
          ),
          GoRoute(
            path: RouteNames.reportsScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen('reportsScreen');
            },
          ),
          GoRoute(
            path: RouteNames.pickPackBomPage,
            builder: (BuildContext context, GoRouterState state) {
              return const BomPage();
            },
          ),

          GoRoute(
            path: RouteNames.pressureTestPage,
            builder: (BuildContext context, GoRouterState state) {
              return const PressureTestPage();
            },
          ),
          GoRoute(
            path: RouteNames.finalInspection,
            builder: (BuildContext context, GoRouterState state) {
              return const FinalInspectionPage();
            },
          ),
          GoRoute(
            path: RouteNames.offlineProcessesScreen,
            builder: (BuildContext context, GoRouterState state) {
              final WorkOrder workOrder = (state.extra is WorkOrder)
                  ? state.extra as WorkOrder
                  : mockWorkOrders.first;
              return OfflineProcessesScreen(workOrder: workOrder);
            },
          ),
          GoRoute(
            path: RouteNames.stageDetailsScreen,
            builder: (BuildContext context,GoRouterState state) {
              final WorkOrder workOrder = state.extra as WorkOrder;
              return StageDetailsScreen(workOrder: workOrder);
            },
          ),
          GoRoute(
            path: RouteNames.workDetailsScreen,

            /// Builds the Daily News screen.
            builder: (BuildContext context, GoRouterState state) => const WorkOrdersScreen(),

            /// Nested routes under initial screen.
            routes: <RouteBase>[],
          ),
        ],
      ),
    ],
  );
}
