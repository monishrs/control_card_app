import 'package:control_card_prototype/presentation/online_assembly/models/pressure_test_model.dart';
import 'package:control_card_prototype/presentation/online_assembly/widgets/pressure_test_main_panel.dart';
import 'package:control_card_prototype/presentation/online_assembly/widgets/pressure_test_right_panel.dart';
import 'package:control_card_prototype/presentation/online_assembly/widgets/pressure_test_bottom_bar.dart';

import '../../common_lib.dart';

class PressureTestPage extends StatelessWidget {
  const PressureTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final PressureTestPageModel model = mockPressureTestData;

    return Scaffold(
      backgroundColor: AppColors.neutralBg,
      appBar: CustomAppBar(
        title: l10n.ptPressureTest,
        subTitle: 'STAGE ${model.stageCode} · ${model.connectionType} · ${model.workOrder}',
        isLeadingEnabled: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.padding8),
            child: AppButton(
              label: l10n.ptKakotora,
              icon: Icons.star,
              variant: BtnVariant.dangerOutline,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: Sizes.size16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.padding8),
            child: AppButton(
              label: l10n.ptLive,
              icon: Icons.circle,
              variant: BtnVariant.primaryGreen,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: Sizes.size24),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(Sizes.padding24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: PressureTestMainPanel(model: model),
                    ),
                    const SizedBox(width: Sizes.size24),
                    Expanded(
                      flex: 3,
                      child: PressureTestRightPanel(model: model),
                    ),
                  ],
                ),
              ),
            ),
            PressureTestBottomBar(model: model),
          ],
        ),
      ),
    );
  }
}
