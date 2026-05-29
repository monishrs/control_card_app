// import 'package:flutter/material.dart';
//
// enum Environment { dev, test, stage, prod }
//
// class AppConfig extends InheritedWidget {
//   final Environment environment;
//   final String appName;
//   final String baseURL;
//
//   const AppConfig(
//       {super.key,
//       required super.child,
//       required this.environment,
//       required this.appName,
//       required this.baseURL});
//
//   static AppConfig of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<AppConfig>()!;
//   }
//
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
// }
