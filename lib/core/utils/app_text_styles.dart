import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';

/// A class that houses centralized TextStyles for the application.
class AppTextStyles {
  AppTextStyles._();

  /// The base text style specifying font family and default color.
  static const TextStyle base = TextStyle(
    fontFamily: 'Muli',
    color: AppColors.textPrimary,
  );

  /// Status badge typography style.
  static TextStyle badge({required double fontSize, required Color color}) =>
      base.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
      );

  /// Standard button typography style.
  static TextStyle button({required double fontSize, required Color color}) =>
      base.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
      );

  /// Toggle/segmented control typography style.
  static TextStyle toggle({
    required bool isSelected,
    Color activeColor = AppColors.textWhite,
    Color inactiveColor = AppColors.neutralText,
    double? fontSize,
  }) => base.copyWith(
    fontSize: fontSize ?? Sizes.textSize13,
    fontWeight: isSelected ? FontWeight.w500 : FontWeight.w500,
    color: isSelected ? activeColor : inactiveColor,
  );

  /// Tab bar typography style.
  static TextStyle tab({
    required bool isSelected,
    Color activeColor = AppColors.primaryLight,
    Color inactiveColor = AppColors.tabSubTitleColor,
    double fontSize = Sizes.textSize13,
  }) => base.copyWith(
    fontSize: fontSize,
    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
    color: isSelected ? activeColor : inactiveColor,
  );

  /// Number stepper typography style.
  static final TextStyle stepper = base.copyWith(
    fontSize: Sizes.textSize14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  /// Row Action Button typography style.
  static final TextStyle rowActionButton = base.copyWith(
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryLight,
  );

  /// Action Bar title typography style.
  static final TextStyle actionBar = base.copyWith(
    fontSize: Sizes.textSize13,
    fontWeight: FontWeight.w400,
    color: AppColors.subTitleColor,
  );

  // ── BOM Page Styles ──────────────────────────────────────────

  static final TextStyle bomHeaderTitle = base.copyWith(
    fontSize: Sizes.textSize20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final TextStyle bomLabelText = base.copyWith(
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    letterSpacing: 1.2,
  );

  static final TextStyle bomValueText = base.copyWith(
    fontSize: Sizes.textSize14,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static final TextStyle bomTableHead = base.copyWith(
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    letterSpacing: 1.2,
  );

  static final TextStyle bomTableBodyMain = base.copyWith(
    fontSize: Sizes.textSize13,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final TextStyle bomTableBodySub = base.copyWith(
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static final TextStyle bomProgressText = base.copyWith(
    fontSize: Sizes.textSize24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );
}
