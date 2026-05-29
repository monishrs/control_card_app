import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/utils/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';

/// app button
class AppButton extends StatelessWidget {
  /// Creates an [AppButton].
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant =
        BtnVariant.primaryGreen,
    this.size = BtnSize.md,
    this.icon,
    this.loading = false,
    this.fullWidth = false,
    this.iconOnly = false,
    this.color,
  });

  /// Button label text.
  ///
  /// Example:
  /// - Save
  /// - Submit
  /// - Cancel
  final String label;

  /// Callback triggered when
  /// the button is pressed.
  ///
  /// If null, button becomes disabled.
  final VoidCallback? onPressed;

  /// Button visual style variant.
  ///
  /// Controls appearance such as:
  /// - Filled
  /// - Outlined
  /// - Danger
  /// - Success
  final BtnVariant variant;

  /// Button size variant.
  ///
  /// Available sizes:
  /// - sm
  /// - md
  /// - lg
  /// - xl
  final BtnSize size;

  /// Optional icon displayed
  /// inside the button.
  ///
  /// Example:
  /// ```dart
  /// Icons.add
  /// ```
  final IconData? icon;

  /// Indicates whether the button
  /// is in loading state.
  ///
  /// Shows loading indicator and
  /// disables interaction.
  final bool loading;

  /// Whether button should take
  /// full available width.
  ///
  /// Defaults to `false`.
  final bool fullWidth;

  /// Custom button color.
  ///
  /// Overrides variant color.
  final Color? color;

  /// Whether button should display
  /// only an icon without label.
  ///
  /// Useful for toolbar actions.
  final bool iconOnly;

  // ── sizing ──────────────────────────────────
  double get _height => switch (size) {
    BtnSize.sm => Sizes.height28,
    BtnSize.md => Sizes.height36,
    BtnSize.lg => Sizes.height44,
    BtnSize.xl => Sizes.height56,
  };

  double get _fontSize => switch (size) {
    BtnSize.sm => Sizes.textSize12,
    BtnSize.md => Sizes.textSize14,
    BtnSize.lg => Sizes.textSize15,
    BtnSize.xl => Sizes.textSize17,
  };

  double get _iconSize => switch (size) {
    BtnSize.sm => Sizes.iconSize14,
    BtnSize.md => Sizes.iconSize16,
    BtnSize.lg => Sizes.iconSize18,
    BtnSize.xl => Sizes.iconSize20,
  };

  EdgeInsets get _padding => iconOnly
      ? EdgeInsets.zero
      : switch (size) {
          BtnSize.sm => const EdgeInsets.symmetric(horizontal: Sizes.padding10),
          BtnSize.md => const EdgeInsets.symmetric(horizontal: Sizes.padding16),
          BtnSize.lg => const EdgeInsets.symmetric(horizontal: Sizes.padding20),
          BtnSize.xl => const EdgeInsets.symmetric(horizontal: Sizes.padding28),
        };

  // ── colours ─────────────────────────────────
  Color get _bgColor => switch (variant) {
    BtnVariant.primary => AppColors.primary,
    BtnVariant.primaryGreen => AppColors.green04763A,
    BtnVariant.primaryOutline => Colors.transparent,
    BtnVariant.danger => AppColors.danger,
    BtnVariant.dangerOutline => Colors.transparent,
    BtnVariant.warning => AppColors.warning,
    BtnVariant.secondary => Colors.white,
    BtnVariant.ghost => Colors.transparent,
    BtnVariant.info => AppColors.infoLight,
    BtnVariant.success => AppColors.success,
    BtnVariant.offline => AppColors.newRollDarkBg,
    BtnVariant.black => AppColors.transparent,
  };

  Color get _fgColor => switch (variant) {
    BtnVariant.primary => AppColors.textWhite,
    BtnVariant.primaryGreen => AppColors.textWhite,
    BtnVariant.primaryOutline => AppColors.green04763A,
    BtnVariant.danger => AppColors.textWhite,
    BtnVariant.dangerOutline => AppColors.danger,
    BtnVariant.warning => AppColors.textWhite,
    BtnVariant.secondary => AppColors.textPrimary,
    BtnVariant.ghost => AppColors.neutralText,
    BtnVariant.info => AppColors.infoText,
    BtnVariant.success => AppColors.textWhite,
    BtnVariant.offline => AppColors.textWhite,
    BtnVariant.black => AppColors.black,
  };

  Color? get _borderColor => switch (variant) {
    BtnVariant.primaryOutline => AppColors.green04763A,
    BtnVariant.dangerOutline => AppColors.danger,
    BtnVariant.secondary => AppColors.greyBorder,
    BtnVariant.ghost => AppColors.borderColor,
    BtnVariant.info => AppColors.infoBorder,
    BtnVariant.black => AppColors.black,
    _ => null,
  };

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null && !loading;
    final double width = iconOnly ? _height : (fullWidth ? double.infinity : 0);

    final Widget content = loading
        ? SizedBox(
            width: _iconSize,
            height: _iconSize,
            child: CircularProgressIndicator(strokeWidth: Sizes.size2, color: _fgColor),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (icon != null) ...<Widget>[
                Icon(icon, size: _iconSize, color: _fgColor),
                if (!iconOnly) SizedBox(width: size == BtnSize.sm ? Sizes.size4 : Sizes.size6),
              ],
              if (!iconOnly)
                Text(
                  label,
                  style: AppTextStyles.button(fontSize: _fontSize, color: _fgColor),
                ),
            ],
          );

    return AnimatedOpacity(
      opacity: isDisabled ? 0.4 : 1.0,
      duration: const Duration(milliseconds: 120),
      child: SizedBox(
        height: _height,
        width: width > 0 ? width : null,
        child: Material(
          color: _bgColor,
          borderRadius: BorderRadius.circular(Sizes.radius0),
          child: InkWell(
            onTap: isDisabled || loading ? null : onPressed,
            borderRadius: BorderRadius.circular(Sizes.radius0),
            child: Container(
              padding: _padding,
              decoration: AppDecorations.appButton(borderColor: _borderColor),
              child: Center(child: content),
            ),
          ),
        ),
      ),
    );
  }
}
