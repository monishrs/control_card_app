import 'package:flutter/material.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// This class is used for displaying toast messages
class ToastUtil {
  ToastUtil._();

  /// Method to show a generic message toast
  static void showMessage(BuildContext context, {String? text}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: text ?? AppLocalizations.of(context)!.somethingWentWrong,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: AppColors.greyBorder,
      textColor: AppColors.textWhite,
      fontSize: 16.0,
    );
  }
}
