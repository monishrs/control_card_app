import 'package:control_card_prototype/common_lib.dart';
import 'package:control_card_prototype/presentation/final_inspection/models/final_inspection_model.dart';

/// A card widget that displays the current packing progress.
/// It renders a row of bundles showing their fill statuses (filled, current, empty).
class PackingBundlesCard extends StatelessWidget {

  /// Creates a [PackingBundlesCard].
  const PackingBundlesCard({super.key, required this.packing});
  /// The packing model containing bundle data and bin information.
  final PackingModel packing;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(Sizes.padding16),
      decoration: AppDecorations.fiOutlineCard(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(l10n.fiPackingFormula, style: AppTextStyles.inter.ptLabel),
                  const SizedBox(height: Sizes.size4),
                  Text(packing.binColourDescription, style: AppTextStyles.inter.fiCardHeader),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.padding8, vertical: Sizes.padding4),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.success),
                  borderRadius: BorderRadius.circular(Sizes.radius4),
                ),
                child: Text(
                  l10n.fiBinsPacked,
                  style: AppTextStyles.inter.textStyle10BoldGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: Sizes.size16),
          Row(
            children: packing.bundles.map((BundleModel bundle) {
              final bool isFilled = bundle.state == BundleState.filled;
              final bool isCurrent = bundle.state == BundleState.current;
              final bool isEmpty = bundle.state == BundleState.empty;

              BoxDecoration decoration;
              if (isFilled) {
                decoration = AppDecorations.fiBundleSolid(
                  bgColor: AppColors.successLight.withValues(alpha:0.6),
                  borderColor: AppColors.green04763A,
                );
              } else if (isCurrent) {
                decoration = AppDecorations.fiBundleSolid(
                  bgColor: AppColors.successLight.withValues(alpha:0.2),
                  borderColor: AppColors.green04763A.withValues(alpha:0.6),
                );
              } else {
                decoration = AppDecorations.fiBundleDashed();
                return Expanded(child: CustomDottedBorder(child: _packagingCard(null,isEmpty,bundle,l10n)));
              }

              return Expanded(child: _packagingCard(decoration,isEmpty,bundle,l10n));
            }).toList(),
          ),
        ],
      ),
    );
  }
  Widget _packagingCard(BoxDecoration? decoration, bool isEmpty, BundleModel bundle, AppLocalizations l10n){
    return Padding(
      padding: const EdgeInsets.only(right: Sizes.padding12),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              l10n.fiBundle,
              style: AppTextStyles.inter.bomLabelText.copyWith(
                color: isEmpty ? AppColors.greyD1D5DB : AppColors.greyADBAB2,
              ),
            ),
            Text(
              '#${bundle.id}',
              style: AppTextStyles.inter.fiBundleNumber.copyWith(
                color: isEmpty ? AppColors.greyBorder : AppColors.green04763A,
              ),
            ),
            Text(
              isEmpty ? '-' : '${bundle.currentAmount} / ${bundle.totalAmount}',
              style: AppTextStyles.inter.bomTableBodySub.copyWith(
                color: isEmpty ? AppColors.greyADBAB2 : AppColors.green04763A,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
