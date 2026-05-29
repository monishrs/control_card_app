import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/resources/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';
import 'package:control_card_prototype/core/widgets/app_button.dart';

/// An error banner that appears in the main BOM view
/// when a wrong item or invalid action occurs (e.g. scanning wrong part).
class BomErrorBanner extends StatelessWidget {

  /// Creates a [BomErrorBanner] with the given [title] and [description].
  const BomErrorBanner({super.key, required this.title, required this.description});
  /// The main title of the error.
  final String title;

  /// A detailed description of what went wrong and how to fix it.
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.padding24, vertical: Sizes.padding16),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.padding16, vertical: Sizes.padding12),
      decoration: AppDecorations.bomErrorBanner(),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.error,
            color: AppColors.danger,
            size: Sizes.iconSize24,
          ),
          const SizedBox(width: Sizes.size16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: AppTextStyles.hankenGrotesk.bomTableBodyMain.copyWith(
                    color: AppColors.danger,
                  ),
                ),
                Text(
                  description,
                  style: AppTextStyles.hankenGrotesk.bomTableBodySub.copyWith(
                    color: AppColors.danger,
                  ),
                ),
              ],
            ),
          ),
          AppButton(label: 'Dismiss', variant: BtnVariant.dangerOutline, onPressed: () {}),
        ],
      ),
    );
  }
}
