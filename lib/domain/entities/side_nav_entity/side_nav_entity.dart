/// Model class representing a side navigation rail item.
///
/// Used to store navigation information such as:
/// - Title
/// - Subtitle
/// - Badge count
/// - Highlight state
class SideNavEntity {
  /// Creates a [SideNavEntity] instance.
  SideNavEntity({
    required this.title,
    required this.subTitle,
    this.badgeCount = 0,
    this.isHighlighted = false,
  });

  /// Main title displayed in the navigation item.
  final String title;

  /// Subtitle displayed below the title.
  final String subTitle;

  /// Badge count shown on the navigation item.
  ///
  /// Example:
  /// - Notification count
  /// - Unread message count
  final int badgeCount;

  /// Indicates whether the navigation item
  /// is currently highlighted or selected.
  final bool isHighlighted;
}
