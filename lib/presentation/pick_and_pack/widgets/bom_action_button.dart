import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/widgets/app_button.dart';

/// A primary action button at the bottom of the BOM right panel,
/// typically used to finalize the picking process.
class BomActionButton extends StatelessWidget {
  /// Constructor for [BomActionButton].
  const BomActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: 'Picking done -> Kit ready \u2713', // ✓
      variant: BtnVariant.primaryGreen,
      size: BtnSize.xl,
      fullWidth: true,
      onPressed: () {},
    );
  }
}
