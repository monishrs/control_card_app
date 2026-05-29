import 'package:control_card_prototype/common_lib.dart';

/// themes
ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme(),
    dividerTheme: const DividerThemeData(color: AppColors.divider)
  );
}

/// app bar theme
AppBarTheme appBarTheme() {
  return const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,

    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),


  );
}
