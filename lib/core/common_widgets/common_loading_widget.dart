import 'package:control_card_prototype/core/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/utils/extensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// common loader widget
class CommonLoadingWidget {
  /// show common loader
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.addOpacity(0.5),
      builder: (_) => const _LoaderDialog(),
    );
  }

  /// hide common loader
  static void hide(BuildContext context) {
    try {
      Navigator.of(context, rootNavigator: true).pop();
    } catch (ex) {
      debugPrint('Exception: Loader issue - $ex ');
    }
  }
}

class _LoaderDialog extends StatelessWidget {
  const _LoaderDialog();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CustomLoadingIndicator());
  }
}

/// custom loader widget
class CustomLoadingIndicator extends StatelessWidget {
  /// constructor for CustomLoadingIndicator
  const CustomLoadingIndicator({super.key, this.size = Sizes.width50});

  /// size of the loader
  final double size;

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(color: AppColors.primary, size: size);
  }
}
