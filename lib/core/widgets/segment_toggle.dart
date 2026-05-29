import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';

class SegmentedToggle extends StatefulWidget {
  const SegmentedToggle({
    super.key,
    required this.options,
    this.initialIndex = 0,
    this.onChanged,
    this.activeColor = AppColors.primaryLight,
  });

  final List<String> options;
  final int initialIndex;
  final ValueChanged<int>? onChanged;
  final Color activeColor;

  @override
  State<SegmentedToggle> createState() => _SegmentedToggleState();
}

class _SegmentedToggleState extends State<SegmentedToggle> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.height36,
      padding: const EdgeInsets.all(Sizes.padding3),
      decoration: AppDecorations.segmentedToggleBg(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.options.length, (int i) {
          final bool isActive = i == _selected;
          return GestureDetector(
            onTap: () {
              setState(() => _selected = i);
              widget.onChanged?.call(i);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.symmetric(horizontal: Sizes.padding14),
              decoration: isActive
                  ? AppDecorations.segmentedToggleActive(
                      activeColor: widget.activeColor,
                    )
                  : AppDecorations.transparent(),
              alignment: Alignment.center,
              child: Text(
                widget.options[i],
                style: AppTextStyles.toggle(
                  isSelected: isActive,
                  inactiveColor: AppColors.tabSubTitleColor,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
