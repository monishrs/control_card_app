import 'package:control_card_prototype/common_lib.dart';

/// Reusable custom app bar.
///
/// Features:
/// - Dynamic title/subtitle
/// - Optional back button
/// - Auto leading handling
/// - AppBar actions support
/// - Custom back action
/// - Bottom colored divider
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a [CustomAppBar].
  const CustomAppBar({
    super.key,
    required this.title,
    this.subTitle,
    this.isLeadingEnabled,
    this.onLeadingTap,
    this.centerTitle = false,
    this.actions,
    this.bottomLineColor = AppColors.divider,
    this.bottomLineHeight = 2,
  });

  /// Main title.
  final String title;

  /// Optional subtitle.
  final String? subTitle;

  /// Controls leading visibility.
  ///
  /// If null:
  /// - Mobile → show if can pop
  /// - Tablet/Desktop → hide
  final bool? isLeadingEnabled;

  /// Callback for leading tap.
  ///
  /// Defaults to pop().
  final VoidCallback? onLeadingTap;

  /// Whether title should be centered.
  final bool centerTitle;

  /// App bar actions.
  final List<Widget>? actions;

  /// Bottom divider color.
  final Color bottomLineColor;

  /// Bottom divider height.
  final double bottomLineHeight;

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.sizeOf(context).width >= 768;

    /// Auto decide leading visibility
    final bool showLeading = isLeadingEnabled ?? (!isTablet && Navigator.canPop(context));

    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      elevation: 0,
      shadowColor: Colors.transparent,
      backgroundColor: AppColors.greyF8F7F4,

      /// Leading
      leading: showLeading
          ? GestureDetector(
              onTap:
                  onLeadingTap ??
                  () {
                    Navigator.pop(context);
                  },
              child: Padding(
                padding: const EdgeInsets.all(Sizes.padding8),
                child: Container(
                  decoration: AppDecorations.bomBackButton(),
                  child: const Center(child: Icon(Icons.chevron_left, size: Sizes.iconSize20)),
                ),
              ),
            )
          : null,

      /// Title
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(subTitle ?? '', style: AppTextStyles.inter.bomLabelText),

          const SizedBox(height: Sizes.size4),

          Text(title, style: AppTextStyles.inter.bomHeaderTitle),
        ],
      ),

      /// Actions
      actions: actions,

      /// Bottom Color Line
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(bottomLineHeight),
        child: Container(height: bottomLineHeight, color: bottomLineColor),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + bottomLineHeight);
}
