import 'package:control_card_prototype/common_lib.dart';

/// Reusable custom outlined button.
///
/// Features:
/// - Custom text
/// - Optional icon
/// - Loading state
/// - Custom colors
/// - Custom size
/// - Border customization
/// - Disabled state
///
/// Example:
///
/// ```dart
/// CustomOutlinedButton(
///   title: 'Cancel',
///   onPressed: () {},
/// )
/// ```
class CustomOutlinedButton extends StatelessWidget {
  /// Creates a [CustomOutlinedButton].
  const CustomOutlinedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
    this.height,
    this.width,
    this.borderRadius = 0,
    this.borderWidth = 1.5,
    this.padding,
    this.textStyle,
    this.backgroundColor = Colors.transparent,
    this.borderColor = AppColors.green04763A,
    this.textColor = AppColors.green04763A,
  });

  /// Button title.
  final String title;

  /// Tap callback.
  final VoidCallback? onPressed;

  /// Optional icon.
  final Widget? icon;

  /// Loading state.
  final bool isLoading;

  /// Whether button is enabled.
  final bool isEnabled;

  /// Button height.
  final double? height;

  /// Button width.
  final double? width;

  /// Border radius.
  final double borderRadius;

  /// Border thickness.
  final double borderWidth;

  /// Internal padding.
  final EdgeInsetsGeometry? padding;

  /// Custom text style.
  final TextStyle? textStyle;

  /// Background color.
  final Color backgroundColor;

  /// Border color.
  final Color borderColor;

  /// Text color.
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = !isEnabled || isLoading;

    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: isDisabled ? null : onPressed,

        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          minimumSize: const Size(0, 0),

          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: Sizes.padding12, vertical: Sizes.padding6),
          side: BorderSide(color: isDisabled ? Colors.grey : borderColor, width: borderWidth),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),

        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2, color: textColor),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (icon != null) ...<Widget>[icon!, const SizedBox(width: 8)],

                  Text(
                    title,
                    style:
                        textStyle ??
                        AppTextStyles.inter.textStyle10BoldGreen.copyWith(
                          color: isDisabled ? Colors.grey : textColor,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
