import 'package:flutter/material.dart';

/// A utility class that contains
/// all application color constants.
///
/// Includes:
/// - Primary colors
/// - Status colors
/// - Background & border colors
/// - Text colors
/// - Offline/Dark mode colors
/// - Miscellaneous colors
class AppColors {
  // ──────────────────────────────────────────
  // Primary Colors
  // ──────────────────────────────────────────

  /// Primary application color.
  static const Color primary = Color(0xff0F0F0F);

  /// Primary light color.
  static const Color primaryLight = Color(0xFF1D9E75);

  /// Primary dark color.
  static const Color primaryDark = Color(0xFF0F6E56);

  // ──────────────────────────────────────────
  // Status Colors
  // ──────────────────────────────────────────

  /// Red status color.
  static const Color redColor = Color(0xffEF4444);

  /// Divider color.
  static const Color divider = Color(0xffCBD5E1);

  /// Black color.
  static const Color black = Color(0xff000000);

  /// Yellow status color.
  static const Color yellowColor = Color(0xffFFD666);

  /// Orange status color.
  static const Color orangeColor = Color(0xffF59E0B);

  /// Blue status color.
  static const Color blueColor = Color(0xff2563EB);

  /// Green status color.
  static const Color greenColor = Color(0xff16A34A);

  /// Dark green status color.
  static const Color darkGreenColor = Color(0xff006B3D);

  /// NG status color.
  static const Color ngColor = Color(0xffB91C1C);

  /// Quality check color.
  static const Color qCColor = Color(0xffCE203C);

  /// Light grey color.
  static const Color lightGrey = Color(0xffF1F5F9);

  /// Danger status color.
  static const Color danger = Color(0xFFE24B4A);

  /// Dark danger color.
  static const Color dangerDark = Color(0xFFA32D2D);

  /// Light danger background color.
  static const Color dangerLight = Color(0xFFFCEBEB);

  /// Warning status color.
  static const Color warning = Color(0xFFEF9F27);

  /// Dark warning color.
  static const Color warningDark = Color(0xFFBA7517);

  /// Light warning background color.
  static const Color warningLight = Color(0xFFFAEEDA);

  /// Information status color.
  static const Color info = Color(0xFF185FA5);

  /// Light information background color.
  static const Color infoLight = Color(0xFFE6F1FB);

  /// Information border color.
  static const Color infoBorder = Color(0xFFB5D4F4);

  /// Success status color.
  static const Color success = Color(0xff16A34A);

  /// Success border color.
  static const Color successBorder = Color(0xff22C55E);

  /// Success background color.
  static const Color successBg = Color(0xff22C55E);

  /// Light success background color.
  static const Color successLight = Color(0xFFEAF3DE);

  /// Revised status color.
  static const Color revisedColor = Color(0xff2563EB);

  /// OK status color.
  static const Color okColor = Color(0xff006B3D);

  // ──────────────────────────────────────────
  // Background & Border Colors
  // ──────────────────────────────────────────

  /// Grey border color.
  static const Color greyBorder = Color(0xffD8DADC);

  /// Dark blue border color.
  static const Color darkBlueBorder = Color(0xff0F172A);

  /// Border color.
  static const Color borderColor = Color(0xFFD3D1C7);

  /// Selected success background color.
  static const Color selectedSuccessBg = Color(0xffD3F4E1);

  /// Information background color.
  static const Color infoBg = Color(0xffFFF7ED);

  /// Dark new roll background color.
  static const Color newRollDarkBg = Color(0xff1E3A5F);

  /// Dark new roll transparent color.
  static const Color transparent =
  Colors.transparent;

  /// New roll background color.
  static const Color newRollBg = Color(0xffEBF2FA);

  /// Slip required background color.
  static const Color slipRequired = Color(0xffFED7AA);

  /// Neutral background color.
  static const Color neutralBg = Color(0xFFF1EFE8);

  /// Surface background color.
  static const Color surfaceBg = Color(0xFFF8F8F6);

  // ──────────────────────────────────────────
  // Text Colors
  // ──────────────────────────────────────────

  /// Primary text color.
  static const Color textPrimary = Color(0xff0F172A);

  /// Secondary text color.
  static const Color textSecondary = Color(0xff94A3B8);

  /// Live data text color.
  static const Color textLiveData = Color(0xff15803D);

  /// Subtitle text color.
  static const Color subTitleColor = Color(0xff64748B);

  /// Tab subtitle text color.
  static const Color tabSubTitleColor = Color(0xff6B7280);

  /// Alert text color.
  static const Color textAlert = Color(0xff475569);

  /// Header text color.
  static const Color textHeader = Color(0xff191C1E);

  /// White text color.
  static const Color textWhite = Color(0xffFFFFFF);

  /// Success text color.
  static const Color successText = Color(0xFF3B6D11);

  /// Danger text color.
  static const Color dangerText = Color(0xFFA32D2D);

  /// Warning text color.
  static const Color warningText = Color(0xFF854F0B);

  /// Information text color.
  static const Color infoText = Color(0xFF0C447C);

  /// Empty slot text color.
  static const Color emptySlotText = Color(0xff717D8A);

  /// Sign-in required text color.
  static const Color signInNeeded = Color(0xffEA580C);

  /// Tab bar text color.
  static const Color tabBarText = Color(0xff3F4941);

  /// Neutral text color.
  static const Color neutralText = Color(0xFF5F5E5A);

  // ──────────────────────────────────────────
  // Offline / Dark Mode Colors
  // ──────────────────────────────────────────

  /// Offline background color.
  static const Color offlineBg = Color(0xFF1A2235);

  /// Offline text color.
  static const Color offlineText = Colors.white;

  // ──────────────────────────────────────────
  // Miscellaneous Colors
  // ──────────────────────────────────────────

  /// Information dot color.
  static const Color infoDot = Color(0xffF97316);

  /// White color.
  static const Color colorWhite = Color(0xffFFFFFF);

  /// Grey shade color.
  static const Color grey41 = Color(0xff41484D);


  /// Grey shade color.
  static const Color greyF0F1EC =
  Color(0xffF0F1EC);


  /// Grey shade color.
  static const Color greyF8F7F4 =
  Color(0xffF8F7F4);

  /// Grey shade color.
  static const Color greyD1D5DB =
  Color(0xffD1D5DB);


  /// Grey shade color.
  static const Color greyADBAB2 =
  Color(0xffADBAB2);


  /// Grey shade color.
  static const Color green04763A =
  Color(0xff04763A);

  static const Color stageBg = Color(0xFFF9F9F9);

  static const Color stageLocked = Color(0xFFD97706);

  static const Color stageDone = Color(0xFF1E8E3E);

  static const Color stageProgress = Color(0xFF1565C0);

  static const Color stageLightGreen = Color(0xFFF4FBF7);

  static const Color stageLightBlue = Color(0xFFE6F3FF);

  static const Color stageGreyBg = Color(0xFFF5F5F5);

  static const Color stageGreyBorder = Color(0xFFE0E0E0);

  static const Color stageDivider = Color(0xFFE5E5E5);

  static const Color warningOrange = Color(0xFFE65100);

  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);


// Stage Setup Additional Colors
  static const Color stageDividerLight = Color(0xFFE5E5E5);
  static const Color stageCardGreenBg = Color(0xFFF4FBF7);
  static const Color stageLightBorder = Color(0xFFE0E0E0);
  static const Color stageSuccessBg = Color(0xFFE8F5E9);

  static const Color grey300Color = Color(0xFFE0E0E0);
  static const Color grey400Color = Color(0xFFBDBDBD);
  static const Color grey500Color = Color(0xFF9E9E9E);

  // Quality Setup Colors
  static const Color qualityPanelBg = Color(0xFFF0F0F0);
  static const Color qualityRequirementsBg = Color(0xFFF4F4F4);

  static const Color stageLiveGreen = Color(0xFF1E8E3E);

  static const Color stageDangerBg = Color(0xFFFCE8E8);

  static const Color histogramBlue = Color(0xFF1565C0);
  static const Color histogramLightBlue = Color(0xFF90CAF9);

  static const Color darkSurface = Color(0xFF1A1D20);

  static const Color pinkBorder = Colors.pink;

  static const Color stageWarningLight = Color(0xFFFFF3E0);

  static const Color stageWarningNoteBg = Color(0xFFFFFBF0);
  static const Color stageWarningNoteBorder = Color(0xFFFFE0B2);

  static const Color detailsPriorityRed = Color(0xFFD32F2F);

  static const Color detailsDivider = Color(0xFFF0F0F0);

  static const Color disabledGrey300 = Color(0xFFE0E0E0);
  static const Color disabledGrey500 = Color(0xFF9E9E9E);

  static const Color outlineGrey = Color(0xFFCCCCCC);

  static const Color stageHeaderBg = Color(0xFFF7F7F7);

  static const Color offlineActiveBlue = Color(0xFF1E3A5F);

  static const Color offlineActiveBg = Color(0xFFEBF3FC);

  static const Color offlineSuccessBg = Color(0xFFEAF5EA);

  static const Color offlineKakoBg = Color(0xFFFFF0F0);

  static const Color offlineKakoBorder = Color(0xFFFFC0C0);

  static const Color offlineDangerLight = Color(0xFFFFF5F5);

  static const Color successDark = Color(0xFF04763A);
}
