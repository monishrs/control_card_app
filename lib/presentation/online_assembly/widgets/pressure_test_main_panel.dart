import 'package:control_card_prototype/common_lib.dart';
import 'package:control_card_prototype/presentation/online_assembly/models/pressure_test_model.dart';
import 'package:control_card_prototype/presentation/online_assembly/widgets/pressure_test_qr_card.dart';

class PressureTestMainPanel extends StatelessWidget {

  const PressureTestMainPanel({super.key, required this.model});
  final PressureTestPageModel model;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Main Graph & Stats Container
          Container(
            decoration: AppDecorations.ptGraphContainer(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Dark Header
                _darkHeader(l10n),

                // Stats Row
                _statsRow(l10n),

                _chardStats(l10n,context),
              ],
            ),
          ),

          const SizedBox(height: Sizes.size24),

          // QR Card
          PressureTestQrCard(model: model),
        ],
      ),
    );
  }

  Widget _darkHeader(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.padding16, vertical: Sizes.padding12),
      decoration: AppDecorations.ptGraphHeader(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '${l10n.ptMachine} ${model.machineId} · ${model.wifiStatus} · ${l10n.ptPiece} #${model.currentPiece}',
            style: AppTextStyles.jetBrainsMono.ptDarkHeader,
          ),
          Row(
            children: <Widget>[
              Container(
                width: Sizes.size8,
                height: Sizes.size8,
                decoration: AppDecorations.activeRoundDecoration(color: AppColors.success),
              ),
              const SizedBox(width: Sizes.size8),
              Text(
                model.linkStatus,
                style: AppTextStyles.inter.ptDarkHeader.copyWith(
                  color: AppColors.colorWhite.withValues(alpha:0.9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statsRow(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.padding24),
      child: Row(
        spacing: Sizes.width10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// Pressure Column
          Expanded(
            child: _PressureInfo(
              model: model,
              progressValue: 0.3,
              title: l10n.ptPressure,
              unit: l10n.ptMpa,
              specLabel: l10n.ptSpec,
              currentValue: model.currentPressure.toStringAsFixed(1),
              specValue: model.pressureSpec,
            ),
          ),

          /// Hold Time Column
          Expanded(
            child: _PressureInfo(
              model: model,
              progressValue: 0.3,
              title: l10n.ptHoldTime,
              unit: l10n.ptS,
              specLabel: l10n.ptHolding,
              currentValue: model.holdTimeCurrent.toString(),
              trailingText:
                  '/ ${model.holdTimeTotal} '
                  '${l10n.ptS}',
              specValue:
                  '${model.holdTimeTotal - model.holdTimeCurrent} '
                  '${l10n.ptS} '
                  '${l10n.ptRemaining}',
              valueStyle: AppTextStyles.inter.ptLargeValueBlack,
            ),
          ),

          /// Leakage Column
          Expanded(
            child: _PressureInfo(
              model: model,
              title: l10n.ptLeakage,
              unit: l10n.ptCm3Min,
              specLabel: '',
              currentValue: model.leakage.toStringAsFixed(1),
              trailingText: l10n.ptCc,
              specValue: l10n.ptNoLeakDetected,
              bottomChild: Row(
                children: <Widget>[
                  Expanded(
                    child: AppButton(label: l10n.ptVisualOk, onPressed: () {}, size: BtnSize.sm),
                  ),

                  const SizedBox(width: Sizes.size8),

                  Expanded(
                    child: CustomOutlinedButton(title: l10n.ptSoapClear, onPressed: () {}),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chardStats(AppLocalizations l10n, BuildContext context) {
    return Column(
      children: <Widget>[
        // Pressure Curve Graph Placeholder
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.padding24),
          child: Text(
            '${l10n.ptPressureCurve}  0 -> ${model.holdTimeTotal} ${l10n.ptS}',
            style: AppTextStyles.inter.ptLabel,
          ),
        ),
        const SizedBox(height: Sizes.size8),
        Padding(
          padding: const EdgeInsets.only(
            left: Sizes.padding24,
            right: Sizes.padding24,
            bottom: Sizes.padding24,
          ),
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.2,
            decoration: BoxDecoration(
              color: AppColors.greyF0F1EC,
              borderRadius: BorderRadius.circular(Sizes.radius8),
            ),
            child: Center(
              child: Text(
                'Chart Placeholder',
                style: AppTextStyles.inter.textStyle12RegularGrey500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Pressure information section.
///
/// Displays:
/// - Title
/// - Current value
/// - Unit
/// - Spec text
/// - Optional bottom widget
class _PressureInfo extends StatelessWidget {
  const _PressureInfo({
    required this.model,
    required this.title,
    required this.unit,
    required this.specLabel,
    required this.currentValue,
    required this.specValue,
    this.valueStyle,
    this.trailingText,
    this.bottomChild,
    this.progressValue,
  });

  /// Pressure page model.
  final PressureTestPageModel model;

  /// Title text.
  ///
  /// Example:
  /// Pressure
  final String title;

  /// Unit text.
  ///
  /// Example:
  /// MPa
  final String unit;

  /// Spec label.
  ///
  /// Example:
  /// Spec
  final String specLabel;

  /// Main value.
  ///
  /// Example:
  /// 1.5
  final String currentValue;

  /// Spec/description value.
  ///
  /// Example:
  /// 1.2 ±0.1
  final String specValue;

  /// Optional trailing text.
  ///
  /// Example:
  /// / 180 s
  final String? trailingText;

  /// Value text style.
  final TextStyle? valueStyle;

  /// Optional bottom widget.
  final Widget? bottomChild;

  final double? progressValue;

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultStyle = valueStyle ?? AppTextStyles.inter.ptLargeValueGreen;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /// Header
        Text('$title · $unit', style: AppTextStyles.inter.ptLabel),

        /// Value Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(currentValue, style: defaultStyle),

            const SizedBox(width: Sizes.size4),

            Text(trailingText ?? unit, style: AppTextStyles.liberationMono.ptValueUnit),
          ],
        ),

        /// Spec Text
        Text(
          '$specLabel '
          '$specValue',
          style: AppTextStyles.liberationMono.bomTableBodySub,
        ),
        if (progressValue != null)
          LinearProgressIndicator(value: progressValue, color: defaultStyle.color),

        /// Bottom Child
        if (bottomChild != null)
          Padding(
            padding: const EdgeInsets.only(top: Sizes.size8),
            child: bottomChild!,
          ),
      ],
    );
  }
}
