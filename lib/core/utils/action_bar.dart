import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';

/// Reusable action bar widget.
///
/// Displays:
/// - Title
/// - Action widgets
///
/// Commonly used for:
/// - Section headers
/// - Toolbar actions
/// - Filter/action areas
///
/// Example:
///
/// ```dart
/// ActionBar(
///   title: 'Orders',
///   actions: [
///     IconButton(
///       onPressed: () {},
///       icon: Icon(Icons.search),
///     ),
///   ],
/// )
/// ```
class ActionBar extends StatelessWidget {
  /// Creates an [ActionBar].
  const ActionBar({
    super.key,
    required this.title,
    required this.actions,
  });

  /// Title displayed on the left side
  /// of the action bar.
  final String title;

  /// List of action widgets displayed
  /// on the right side.
  ///
  /// Example:
  /// - Buttons
  /// - Icon buttons
  /// - Dropdowns
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal:
        Sizes.padding16,
        vertical:
        Sizes.padding12,
      ),

      decoration:
      AppDecorations.actionBar(),

      child: Row(
        children: <Widget>[
          /// Title
          Expanded(
            child: Text(
              title,
              style:
              AppTextStyles
                  .actionBar,
            ),
          ),

          /// Actions
          ...actions.map(
                (
                Widget action,
                ) =>
                Padding(
                  padding:
                  const EdgeInsets.only(
                    left:
                    Sizes.padding8,
                  ),
                  child: action,
                ),
          ),
        ],
      ),
    );
  }
}