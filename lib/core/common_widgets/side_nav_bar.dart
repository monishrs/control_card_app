import 'package:control_card_prototype/common_lib.dart';
import 'package:control_card_prototype/core/common_widgets/name_card.dart';
import 'package:control_card_prototype/domain/entities/side_nav_entity/side_nav_entity.dart';

/// side nav bar
class SideNavBar extends StatelessWidget {
  /// constructor
  const SideNavBar({
    super.key,

    required this.selectedIndex,
    required this.pages,
    required this.onItemTapped,
  });

  /// Currently selected navigation index.
  ///
  /// Used to identify which side navigation
  /// item is active/selected.
  final int selectedIndex;

  /// List of side navigation pages/items.
  ///
  /// Contains the navigation data used to
  /// render the side navigation menu.
  final List<SideNavEntity> pages;

  /// Callback triggered when a navigation
  /// item is tapped.
  ///
  /// Returns the selected item index.
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => onItemTapped(index),
              child: SideNavCard(model: pages[index], isSelected: selectedIndex == index),
            );
          },
        ),
        const Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: VerticalDivider(width: Sizes.width1),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(Sizes.padding12),
          child: Column(
            children: <Widget>[
              NameCard(title: AppLocalizations.of(context)!.prod),
              Text(
                AppLocalizations.of(context)!.prod,
                style: AppTextStyles.jetBrainsMono.textStyle10BoldGrey500,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// side nav card
class SideNavCard extends StatelessWidget {
  /// Creates a [SideNavCard].
  const SideNavCard({
    super.key,
    required this.model,
    required this.isSelected,
  });

  /// Side navigation item model.
  ///
  /// Contains the data required to display
  /// the navigation card such as:
  /// - title
  /// - subtitle
  /// - badge count
  /// - highlight state
  final SideNavEntity model;

  /// Indicates whether this navigation
  /// item is currently selected.
  ///
  /// Used to update the UI state such as:
  /// - selected border
  /// - background color
  /// - active indicator
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.sideNavBarOuter(isSelected: isSelected),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            if (isSelected)
              const VerticalDivider(
                color: AppColors.redColor,
                thickness: Sizes.width4,
                width: Sizes.width0,
              ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: Sizes.padding12, bottom: Sizes.padding12),
                  child: _content(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _content() {
    return Column(
      spacing: Sizes.height2,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding14,
                vertical: Sizes.padding8,
              ),
              decoration: AppDecorations.sideNavBarInner(
                color: model.isHighlighted ? AppColors.black : null,
              ),
              child: Text(
                model.title,
                style: AppTextStyles.liberationMono.textStyle11BoldBlackSpacing.copyWith(
                  color: model.isHighlighted ? AppColors.colorWhite : null,
                ),
              ),
            ),
            if (model.badgeCount > 0) _badge(),
          ],
        ),
        Text(model.subTitle, style: AppTextStyles.inter.textStyle11BoldBlackSpacing),
      ],
    );
  }

  Widget _badge() {
    return Positioned(
      top: -Sizes.height8,
      right: -Sizes.width10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.padding4),
        decoration: AppDecorations.badgeDecoration(),
        child: Text(model.badgeCount.toString(), style: AppTextStyles.inter.textStyle11BoldWhite),
      ),
    );
  }
}
