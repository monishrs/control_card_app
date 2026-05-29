import 'package:control_card_prototype/common_lib.dart';
import 'package:intl/intl.dart';

/// custom max height
double getMaxHeight(BuildContext context) => MediaQuery.of(context).size.height;

/// custom max width
double getMaxWidth(BuildContext context) => MediaQuery.of(context).size.width;

/// formats time as HH:mm
String formatTimeHHmm(DateTime time) => DateFormat('HH:mm').format(time);

/// formats date as dd·MMM·yy in uppercase
String formatDateDDMMMYY(DateTime date) =>
    DateFormat('dd·MMM·yy').format(date).toUpperCase();
