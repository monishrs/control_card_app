import 'package:control_card_prototype/core/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

/// Reusable custom dotted border widget.
///
/// Features:
/// - Custom child widget
/// - Configurable dash pattern
/// - Border radius
/// - Stroke width
/// - Padding
/// - Border color
///
/// Example:
///
/// ```dart
/// CustomDottedBorder(
///   child: Text('Hello'),
/// )
/// ```
class CustomDottedBorder
    extends StatelessWidget {
  /// Creates a [CustomDottedBorder].
  const CustomDottedBorder({
    super.key,
    required this.child,
    this.dashPattern =
    const <double>[5, 5],
    this.strokeWidth = Sizes.width1,
    this.padding =
     EdgeInsets.zero,
    this.borderColor = Colors.grey,
    this.borderRadius = Sizes.radius4,
  });

  /// Child widget.
  final Widget child;

  /// Dash pattern.
  ///
  /// Example:
  /// [10, 5]
  final List<double> dashPattern;

  /// Border stroke width.
  final double strokeWidth;

  /// Internal padding.
  final EdgeInsets padding;

  /// Border color.
  final Color borderColor;

  /// Border radius.
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        dashPattern: dashPattern,
        strokeWidth: strokeWidth,
        padding: padding,
        color: borderColor,
        

        radius: Radius.circular(
          borderRadius,
        ),
      ),

      child: child,
    );
  }
}