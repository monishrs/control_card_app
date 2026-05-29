import 'package:control_card_prototype/common_lib.dart';
import 'package:control_card_prototype/presentation/online_assembly/models/pressure_test_model.dart';
import 'package:go_router/go_router.dart';

class PressureTestBottomBar extends StatelessWidget {

  const PressureTestBottomBar({super.key, required this.model});
  final PressureTestPageModel model;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.padding24, vertical: Sizes.padding16),
      decoration: AppDecorations.ptBottomBar(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: <InlineSpan>[
                TextSpan(
                  text: 'Piece ',
                  style: AppTextStyles.liberationMono.textStyle10BoldGrey500.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: Sizes.textSize12,
                  ),
                ),
                TextSpan(
                  text: '#47 / 145',
                  style: AppTextStyles.liberationMono.textStyle10BoldGrey500.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    fontSize: Sizes.textSize12,
                  ),
                ),

                TextSpan(
                  text: ' · ',
                  style: AppTextStyles.liberationMono.textStyle14BoldBlack.copyWith(
                    color: Colors.grey,
                  ),
                ),

                TextSpan(
                  text: 'WiFi Vernier auto-logging',
                  style: AppTextStyles.liberationMono.textStyle10BoldGrey500.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: Sizes.textSize12,
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: <Widget>[
              AppButton(
                label: l10n.ptFailPiece,
                variant: BtnVariant.dangerOutline,
                onPressed: () {},
              ),
              const SizedBox(width: Sizes.size16),
              AppButton(label: l10n.ptAutoMode, variant: BtnVariant.secondary, onPressed: () {}),
              const SizedBox(width: Sizes.size16),
              AppButton(
                label: l10n.ptLogPassNextPiece,
                variant: BtnVariant.primaryGreen,
                onPressed: () {
                  context.push(RouteNames.finalInspection);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
