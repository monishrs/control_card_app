import 'package:flutter/cupertino.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    required this.variant,
    this.icon,
  });

  final String label;
  final BadgeVariant variant;
  final IconData? icon;

  Color get _bg => switch (variant) {
    BadgeVariant.success => AppColors.successLight,
    BadgeVariant.danger => AppColors.dangerLight,
    BadgeVariant.warning => AppColors.warningLight,
    BadgeVariant.info => AppColors.infoLight,
    BadgeVariant.neutral => AppColors.neutralBg,
    BadgeVariant.revised => AppColors.newRollBg,
    BadgeVariant.ok => AppColors.selectedSuccessBg,
    BadgeVariant.ng => AppColors.dangerLight,
  };

  Color get _fg => switch (variant) {
    BadgeVariant.success => AppColors.successText,
    BadgeVariant.danger => AppColors.dangerText,
    BadgeVariant.warning => AppColors.warningText,
    BadgeVariant.info => AppColors.infoText,
    BadgeVariant.neutral => AppColors.neutralText,
    BadgeVariant.revised => AppColors.revisedColor,
    BadgeVariant.ok => AppColors.okColor,
    BadgeVariant.ng => AppColors.ngColor,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding10,
        vertical: Sizes.padding3,
      ),
      decoration: AppDecorations.statusBadge(color: _bg),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(icon, size: Sizes.iconSize12, color: _fg),
            const SizedBox(width: Sizes.size4),
          ],
          Text(
            label,
            style: AppTextStyles.badge(fontSize: Sizes.textSize12, color: _fg),
          ),
        ],
      ),
    );
  }
}
