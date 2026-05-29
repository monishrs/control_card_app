import 'package:control_card_prototype/common_lib.dart';
import 'package:control_card_prototype/presentation/final_inspection/models/final_inspection_model.dart';

class FitmentVerificationCard extends StatelessWidget {

  const FitmentVerificationCard({super.key, required this.fitments});
  final List<FitmentDataModel> fitments;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(Sizes.padding16),
      decoration: AppDecorations.fiOutlineCard(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(l10n.fiFitmentVerification, style: AppTextStyles.inter.ptLabel),
          const SizedBox(height: Sizes.size16),
          Row(
            children: fitments.map((FitmentDataModel fitment) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: Sizes.padding12),
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.padding16),
                    decoration: AppDecorations.fiInfoBlock(),
                    child: Column(
                      spacing: Sizes.size4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(fitment.label, style: AppTextStyles.inter.bomTableBodySub),
                        Text(fitment.value, style: AppTextStyles.inter.fiMonoValue),
                        Text(fitment.subValue, style: AppTextStyles.inter.bomTableBodySub),
                        if (fitment.isQrMatch)
                          CustomOutlinedButton(title: l10n.fiQrMatch, onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
