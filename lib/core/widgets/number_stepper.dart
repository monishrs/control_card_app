import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/app_text_styles.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';

class NumberStepper extends StatefulWidget {
  const NumberStepper({
    super.key,
    this.initialValue = 0,
    this.min = 0,
    this.max = 999,
    this.step = 1,
    this.onChanged,
  });

  final int initialValue;
  final int min;
  final int max;
  final int step;
  final ValueChanged<int>? onChanged;

  @override
  State<NumberStepper> createState() => _NumberStepperState();
}

class _NumberStepperState extends State<NumberStepper> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _decrement() {
    if (_value - widget.step >= widget.min) {
      setState(() => _value -= widget.step);
      widget.onChanged?.call(_value);
    }
  }

  void _increment() {
    if (_value + widget.step <= widget.max) {
      setState(() => _value += widget.step);
      widget.onChanged?.call(_value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.height36,
      decoration: AppDecorations.outline(color: Colors.transparent),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _StepBtn(icon: Icons.remove, onTap: _decrement),
          Container(
            width: Sizes.width48,
            alignment: Alignment.center,
            decoration: AppDecorations.numberStepperValue(),
            child: Text('$_value', style: AppTextStyles.stepper),
          ),
          _StepBtn(icon: Icons.add, onTap: _increment),
        ],
      ),
    );
  }
}

class _StepBtn extends StatelessWidget {
  const _StepBtn({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Sizes.radius8),
      child: SizedBox(
        width: Sizes.width36,
        height: Sizes.height36,
        child: Icon(
          icon,
          size: Sizes.iconSize16,
          color: AppColors.subTitleColor,
        ),
      ),
    );
  }
}
