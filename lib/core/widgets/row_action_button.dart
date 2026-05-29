import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';

class RowActionButton extends StatelessWidget {
  const RowActionButton({
    super.key,
    required this.icon,
    this.onTap,
    this.color,
    this.tooltip,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color? color;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final GestureDetector btn = GestureDetector(
      onTap: onTap,
      child: Container(
        width: Sizes.width30,
        height: Sizes.height30,
        decoration: AppDecorations.rowActionButton(),
        child: Icon(
          icon,
          size: Sizes.iconSize15,
          color: color ?? AppColors.subTitleColor,
        ),
      ),
    );
    return tooltip != null ? Tooltip(message: tooltip!, child: btn) : btn;
  }
}
