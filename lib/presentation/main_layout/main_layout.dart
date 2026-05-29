import 'package:control_card_prototype/common_lib.dart';
import 'package:control_card_prototype/core/common_widgets/side_nav_bar.dart';
import 'package:control_card_prototype/domain/entities/side_nav_entity/side_nav_entity.dart';
import 'package:go_router/go_router.dart';

/// Main layout widget that provides
/// a common structure for the application.
///
/// Includes:
/// - App bar
/// - Side navigation rail
/// - Dynamic content area
class MainLayout extends StatefulWidget {
  /// Creates a [MainLayout].
  ///
  /// [child] is the screen content
  /// displayed beside the side navigation.
  const MainLayout({super.key, required this.child});

  /// Screen widget to be rendered
  /// inside the main content area.
  final Widget child;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  /// Tracks the currently selected
  /// navigation index.
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Custom app bar displayed at the top.
      appBar: const CustomPersistentAppBar(),

      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// Side navigation section.
          sideNavigation(context),

          /// Main content area.
          Expanded(flex: 9, child: widget.child),
        ],
      ),
    );
  }

  /// Builds the side navigation bar.
  ///
  /// Contains navigation items and
  /// handles page navigation.
  Widget sideNavigation(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    /// List of navigation items
    /// shown in the side navigation.
    List<SideNavEntity> sideBarValues = <SideNavEntity>[
      SideNavEntity(title: '01', subTitle: l10n.navOrders),
      SideNavEntity(title: '02', subTitle: l10n.navStage),
      SideNavEntity(title: 'QR', subTitle: l10n.navScan, isHighlighted: true),
      SideNavEntity(title: '03', subTitle: l10n.navAlerts, badgeCount: 2),
      SideNavEntity(title: '04', subTitle: l10n.navReports, badgeCount: 2),
    ];

    return Expanded(
      flex: 1,

      /// Custom side navigation widget.
      child: SideNavBar(
        selectedIndex: selectedIndex,

        /// Navigation items.
        pages: sideBarValues,

        /// Callback triggered when
        /// a navigation item is tapped.
        onItemTapped: (int val) {
          /// Update selected index.
          setState(() {
            selectedIndex = val;
          });

          /// Navigate to the corresponding screen.
          switch (val) {
            /// Navigate to Orders screen.
            case 0:
              context.go(RouteNames.workDetailsScreen);
              break;

            /// Navigate to Stage screen.
            case 1:
              context.go(RouteNames.stageSetupScreen);
              break;

            /// Navigate to Scan screen.
            case 2:
              context.go(RouteNames.scanScreen);
              break;

            /// Navigate to Alerts screen.
            case 3:
              context.go(RouteNames.alertScreen);
              break;

            /// Navigate to Reports screen.
            case 4:
              context.go(RouteNames.reportsScreen);
              break;
          }
        },
      ),
    );
  }
}
