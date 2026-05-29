import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';
/// Custom Tab Bar Widget.
/// Handles tab selection and change callback.
class AppTabBar extends StatefulWidget {
  const AppTabBar({
    super.key,
    required this.tabs,
    this.initialIndex = 0,
    this.onChanged,
  });

  /// List of tab labels.
  ///
  /// Used to render the tabs
  /// displayed in the tab bar.
  ///
  /// Example:
  /// ```dart
  /// ['Home', 'Orders', 'Settings']
  /// ```
  final List<String> tabs;

  /// Initial selected tab index.
  ///
  /// Defaults to `0`.
  ///
  /// Example:
  /// If set to `1`, second tab
  /// will be selected initially.
  final int initialIndex;

  /// Callback triggered when
  /// selected tab changes.
  ///
  /// Returns the selected tab index.
  ///
  /// Example:
  /// ```dart
  /// onChanged: (index) {
  ///   print(index);
  /// }
  /// ```
  final ValueChanged<int>? onChanged;

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.tabContainer(),
      child: Row(
        children: List<Widget>.generate(widget.tabs.length, (int i) {
          final bool isActive = i == _selected;
          return GestureDetector(
            onTap: () {
              setState(() => _selected = i);
              widget.onChanged?.call(i);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding16,
                vertical: Sizes.padding10,
              ),
              decoration: AppDecorations.tabIndicator(
                color: isActive ? AppColors.primaryLight : Colors.transparent,
              ),
              child: Text(
                widget.tabs[i],
                style: AppTextStyles.tab(isSelected: isActive),
              ),
            ),
          );
        }),
      ),
    );
  }
}
