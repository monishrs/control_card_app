import '../../common_lib.dart';

/// A reusable card widget that displays
/// a shortened version of a title.
///
/// Useful for showing initials or limited
/// characters from a given string.
class NameCard extends StatelessWidget {
  /// Creates a [NameCard].
  ///
  /// [title] is required.
  ///
  /// [textLength] controls how many characters
  /// should be displayed from the title.
  /// Default value is `2`.
  const NameCard({super.key, required this.title, this.textLength = 2});

  /// Full text to display.
  final String title;

  /// Maximum number of characters to show.
  final int textLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Sizes.width40,
      height: Sizes.height40,

      color: AppColors.black,
      child: Text(
        title.isNotEmpty ? getTitle : '',
        style: AppTextStyles.hankenGrotesk.textStyle14BoldWhite,
      ),
    );
  }

  /// Returns a shortened version of the title.
  ///
  /// If title length is greater than [textLength],
  /// it trims the string using substring.
  ///
  /// Example:
  /// title = "Flutter"
  /// textLength = 2
  /// Result = "Fl"
  String get getTitle {
    String title = this.title.replaceAll('.', '').replaceAll(' ', '');
    return title.length > textLength ? title.substring(0, textLength) : title;
  }
}
