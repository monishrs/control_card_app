import 'dart:ui';

import 'package:intl/intl.dart';

/// Extension on Color class
extension ColourExtension on Color {
  /// Adds opacity to a color and returns the resulting color
  Color addOpacity(double opacity) {
    return withAlpha((opacity * 255).toInt());
  }
}

/// Extension for dateFormats
extension DateFormats on String {
  /// Converts a date string to a DateTime object
  DateTime formatDateFromString() {
    final DateFormat format = DateFormat('yyyy/MM/dd HH:mm:ss');
    return format.parse(this);
  }

  /// Converts a date string to a DateTime object
  DateTime formatDateFromStringKind() {
    final DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    return format.parse(this);
  }

  /// Converts a date string to a local date string
  String toLocalDateOnly({String format = 'yyyy/MM/dd'}) {
    try {
      final DateTime utcDate = DateTime.parse(this);
      final DateTime localDate = utcDate.toLocal();
      return DateFormat(format).format(localDate);
    } catch (e) {
      return 'Invalid date';
    }
  }
}
