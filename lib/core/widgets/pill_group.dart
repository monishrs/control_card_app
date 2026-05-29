import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';

class PillGroup extends StatefulWidget {
  const PillGroup({
    super.key,
    required this.options,
    this.initialIndex = 0,
    this.onChanged,
  });

  final List<String> options;
  final int initialIndex;
  final ValueChanged<int>? onChanged;

  @override
  State<PillGroup> createState() => _PillGroupState();
}

class _PillGroupState extends State<PillGroup> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.pillGroupBg(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.options.length, (int i) {
          final bool isActive = i == _selected;
          final bool isLast = i == widget.options.length - 1;
          return GestureDetector(
            onTap: () {
              setState(() => _selected = i);
              widget.onChanged?.call(i);
            },
            child: Container(
              height: Sizes.height36,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.padding16),
              decoration: AppDecorations.pillGroupItem(
                isActive: isActive,
                isFirst: i == 0,
                isLast: isLast,
              ),
              child: Center(
                child: Text(
                  widget.options[i],
                  style: AppTextStyles.toggle(
                    isSelected: isActive,
                    inactiveColor: AppColors.textPrimary,
                    fontSize: Sizes.textSize14,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
