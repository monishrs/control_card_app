import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';

/// A singleton dialog class used to
/// display a loading indicator.
///
/// Prevents user interaction while
/// background tasks or API calls
/// are in progress.
class LoadingIndicatorDialog {
  /// Factory constructor that returns
  /// the singleton instance.
  factory LoadingIndicatorDialog() {
    return _singleton;
  }

  /// Private named constructor.
  LoadingIndicatorDialog._internal();

  /// Singleton instance of
  /// [LoadingIndicatorDialog].
  static final LoadingIndicatorDialog _singleton =
      LoadingIndicatorDialog._internal();

  /// Stores dialog context
  /// for dismissing the dialog.
  late BuildContext _context;

  /// Tracks whether the loading
  /// dialog is currently displayed.
  bool isDisplayed = false;

  /// Displays the loading dialog.
  ///
  /// Prevents dismissing using
  /// outside tap or back button.
  void show(BuildContext context) {
    // Prevent showing multiple dialogs.
    // Uncomment if needed.
    // if (isDisplayed) {
    //   return;
    // }

    showDialog<void>(
      context: context,

      /// Prevent dismiss on outside tap.
      barrierDismissible: false,

      builder: (BuildContext context) {
        /// Save dialog context.
        _context = context;

        /// Mark dialog as displayed.
        isDisplayed = true;

        return const PopScope(
          /// Disable back button pop.
          canPop: false,

          child: SimpleDialog(
            /// Transparent background.
            backgroundColor: Colors.transparent,

            children: <Widget>[
              /// Center aligned loader.
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    /// Padding around loader.
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 16, right: 16),

                      /// Circular loading indicator.
                      child: CircularProgressIndicator(
                        color: AppColors.textWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Dismisses the loading dialog
  /// if currently displayed.
  void dismiss() {
    /// Check dialog visibility.
    if (isDisplayed) {
      /// Close the dialog.
      Navigator.of(_context).pop();

      /// Reset dialog state.
      isDisplayed = false;
    }
  }
}
