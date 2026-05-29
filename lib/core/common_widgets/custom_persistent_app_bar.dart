
import '../../common_lib.dart';
import 'name_card.dart';

/// A custom AppBar with a title, optional leading and trailing buttons, and background image.
class CustomPersistentAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// Constructor for [CustomPersistentAppBar] with optional parameters for customization.
  const CustomPersistentAppBar({super.key});

  @override
  State<CustomPersistentAppBar> createState() => _CustomPersistentAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomPersistentAppBarState extends State<CustomPersistentAppBar> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return AppBar(
      titleSpacing: 0,
      title: SafeArea(
        left: false,
        right: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.padding16),
                child: IntrinsicHeight(
                  child: Row(
                    spacing: Sizes.width16,
                    children: <Widget>[
                      _controlCardVersion(l10n),

                      _verticalDivider(),
                      _shiftDetails(),
                      const Spacer(),
                      _verticalDivider(),
                      _networkDetails(),
                      Text('08:42', style: AppTextStyles.liberationMono.textStyle12BoldBlackSpacing),
                      _verticalDivider(),
                      _ProfileCard(title: 'K. Iyer', subTitle: l10n.prodCrimp),
                    ],
                  ),
                ),
              ),
            ),

            const Divider(height: Sizes.height0),
          ],
        ),
      ),
    );
  }

  Widget _verticalDivider() {
    return const VerticalDivider(width: Sizes.width0, thickness: 1, endIndent: 0);
  }

  EdgeInsetsGeometry get bottomPadding => const EdgeInsets.symmetric(vertical: Sizes.padding8);

  Widget _controlCardVersion(AppLocalizations l10n) {
    return Padding(
      padding: bottomPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const NameCard(title: 'CC'),
          const SizedBox(width: Sizes.width8),
          Text(l10n.controlCard, style: AppTextStyles.hankenGrotesk.textStyle14BoldTextHeader),
          const SizedBox(width: Sizes.width4),
          Text(l10n.appVersion, style: AppTextStyles.hankenGrotesk.textStyle14BoldGrey),
        ],
      ),
    );
  }

  Widget _shiftDetails() {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: bottomPadding,
      child:  Row(
        spacing: Sizes.width16,
        children: <Widget>[
          _NameSubTitle(title: l10n.plant, subTitle: l10n.plantYamato),
          _NameSubTitle(title: l10n.line, subTitle: '03'),
          _NameSubTitle(title: l10n.station, subTitle: 'TBL-03'),
        ],
      ),
    );
  }

  Widget _networkDetails() {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: bottomPadding,
      child:  Row(
        spacing: Sizes.width16,
        children: <Widget>[
          _DotWithTitle(title: l10n.sapHana),
          _DotWithTitle(title: l10n.wifi),
        ],
      ),
    );
  }
}

class _NameSubTitle extends StatelessWidget {
  const _NameSubTitle({required this.title, required this.subTitle, this.gap});

  final String title;
  final String subTitle;
  final double? gap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(title, style: AppTextStyles.liberationMono.textStyle12RegularGrey41Spacing),
        SizedBox(width: gap ?? Sizes.width4),
        Text(subTitle, style: AppTextStyles.liberationMono.textStyle12BoldBlackSpacing),
      ],
    );
  }
}

class _DotWithTitle extends StatelessWidget {
  const _DotWithTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final double size = Sizes.width12;
    return Row(
      spacing: Sizes.width8,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(width: size, height: size, decoration: AppDecorations.activeRoundDecoration()),
        Text(title, style: AppTextStyles.liberationMono.textStyle12RegularGrey41Spacing),
      ],
    );
  }
}

/// app bar profile view
class _ProfileCard extends StatelessWidget {
  /// constructor
  const _ProfileCard({required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Sizes.width8,
      children: <Widget>[
        NameCard(title: title),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title, style: AppTextStyles.liberationMono.textStyle12BoldBlackSpacing),
            Text(subTitle, style: AppTextStyles.liberationMono.textStyle11RegularGrey41),
          ],
        ),
      ],
    );
  }
}
