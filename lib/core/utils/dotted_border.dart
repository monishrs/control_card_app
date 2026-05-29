import 'dart:ui';

import 'package:flutter/material.dart';

/// A custom painter that draws a dotted (dashed) border around a widget.
class DottedBorder extends CustomPainter {
  ///constructor to build dotted border
  DottedBorder({
    required this.color,
    required this.strokeWidth,
    required this.gap,
    required this.radius,
  });

  /// Color of the border
  final Color color;

  /// Thickness of the border
  final double strokeWidth;

  /// Gap between each dash
  final double gap;

  /// Corner radius for rounded rectangle
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );

    // Draw dashed border
    drawDashedPath(canvas, path, paint);
  }

  /// Draws a dashed version of the given [path] using the specified [paint].
  void drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final Path dashPath = Path();
    final double dashLength = 8;

    for (PathMetric metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        double start = distance;
        double end = distance + dashLength;
        if (end > metric.length) {
          end = metric.length;
        }
        dashPath.addPath(metric.extractPath(start, end), Offset.zero);
        distance = distance + dashLength + gap;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
