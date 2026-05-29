import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';

class ColorChipButton extends StatelessWidget {
  const ColorChipButton({
    super.key,
    required this.color,
    this.isSelected = false,
    this.onTap,
    this.size = 28,
  });

  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: AppDecorations.outline(
          borderColor: isSelected
              ? AppColors.darkBlueBorder
              : Colors.transparent,
          borderWidth: Sizes.size2,
          radius: Sizes.radius4,
          color: color,
        ),
        child: isSelected
            ? Icon(Icons.check, size: size * 0.55, color: AppColors.textWhite)
            : null,
      ),
    );
  }
}
