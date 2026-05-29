import 'package:control_card_prototype/common_lib.dart';
import 'package:go_router/go_router.dart';
import 'package:control_card_prototype/presentation/work_orders/models/work_order.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';

class QualitySetupScreen extends StatefulWidget {
  final WorkOrder workOrder;
  final DetailedStage stage;

  const QualitySetupScreen({
    super.key,
    required this.workOrder,
    required this.stage,
  });

  @override
  State<QualitySetupScreen> createState() => _QualitySetupScreenState();
}

class _QualitySetupScreenState extends State<QualitySetupScreen> {
  // Mock data for inputs
  final List<String> _vernierReadings = [
    '9.02',
    '9.01',
    '9.03',
    '8.99',
    '9.02',
  ];
  int _cp2OkCount = 38;
  int _cp2NgCount = 1;
  int _cp3OkCount = 0;
  int _cp3NgCount = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.stageBg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildHeader(context, l10n),
          _buildRequirementsRow(l10n),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: AppDecorations.qualitySetupLeftPanel(),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.padding32,
                        vertical: Sizes.padding24,
                      ),
                      children: <Widget>[
                        _buildCp1WifiVernier(l10n),
                        const SizedBox(height: Sizes.height16),
                        _buildCp2OkNgCounter(l10n),
                        const SizedBox(height: Sizes.height16),
                        _buildCp3OkNgCounter(l10n),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Sizes.width360,
                  child: Container(
                    color: AppColors.qualityPanelBg,
                    padding: const EdgeInsets.all(Sizes.padding16),
                    child: ListView(
                      children: <Widget>[
                        _buildLiveVernierWidget(l10n),
                        const SizedBox(height: Sizes.height16),
                        _buildFirstOffGateWidget(l10n),
                        const SizedBox(height: Sizes.height16),
                        _buildStageLogWidget(l10n),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildBottomBar(context, l10n),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────
  // Header Component
  // ──────────────────────────────────────────
  Widget _buildHeader(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding24,
        vertical: Sizes.padding16,
      ),
      decoration: AppDecorations.stageSetupHeader(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () => context.pop(),
            child: Container(
              padding: const EdgeInsets.all(Sizes.padding8),
              decoration: AppDecorations.stageSetupBackButton(),
              child: const Icon(
                Icons.chevron_left,
                size: Sizes.iconSize24,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: Sizes.width16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'WO ${widget.workOrder.id} \u2022 STAGE ${widget.stage.id} / ${widget.workOrder.totalStages.toString().padLeft(2, '0')} \u2022 ${widget.stage.isOffline ? l10n.offline.toUpperCase() : l10n.online}',
                  style: AppTextStyles
                      .liberationMono
                      .textStyle10BoldGrey500Spacing1,
                ),
                const SizedBox(height: Sizes.height4),
                Text(
                  widget.stage.name,
                  style: AppTextStyles.inter.textStyle24BoldBlack87,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.padding10,
                  vertical: Sizes.padding4,
                ),
                decoration: AppDecorations.stageSetupBadge(
                  color: AppColors.stageLiveGreen,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: Sizes.width6,
                      height: Sizes.height6,
                      decoration: AppDecorations.qualitySetupStatusDot(
                        color: AppColors.colorWhite,
                      ),
                    ),
                    const SizedBox(width: Sizes.width6),
                    Text(
                      l10n.live,
                      style: AppTextStyles
                          .liberationMono
                          .textStyle10BoldWhiteSpacing05,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Sizes.width16),
              Text(
                l10n.sessionLockedYou,
                style:
                    AppTextStyles.liberationMono.textStyle10BoldGrey600Spacing1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────
  // Requirements Row
  // ──────────────────────────────────────────
  Widget _buildRequirementsRow(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding24,
        vertical: Sizes.padding16,
      ),
      color: AppColors.qualityRequirementsBg,
      child: Row(
        children: <Widget>[
          _buildRequirementCard(
            title: l10n.machine,
            value: 'CRM-03',
            isDone: true,
          ),
          const SizedBox(width: Sizes.width12),
          _buildRequirementCard(title: l10n.jig, value: 'CJ-2207', isDone: true),
          const SizedBox(width: Sizes.width12),
          _buildRequirementCard(title: l10n.roll, value: 'R-04', isDone: true),
          const SizedBox(width: Sizes.width12),
          _buildRequirementCard(
            title: l10n.operator,
            value: 'EMP-04217',
            isDone: true,
          ),
          const SizedBox(width: Sizes.width12),
          _buildRequirementCard(
            title: l10n.firstOff,
            value: l10n.pendingTl,
            isDone: false,
            isWarning: true,
          ),
          const SizedBox(width: Sizes.width12),
          _buildRequirementCard(title: l10n.master, value: 'Rev 14', isDone: true),
        ],
      ),
    );
  }

  Widget _buildRequirementCard({
    required String title,
    required String value,
    required bool isDone,
    bool isWarning = false,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(Sizes.padding12),
        decoration: AppDecorations.requirementCard(isWarning: isWarning),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(Sizes.padding4),
              decoration: AppDecorations.requirementCardIcon(
                isWarning: isWarning,
              ),
              child: Icon(
                isDone
                    ? Icons.check
                    : (isWarning ? Icons.priority_high : Icons.access_time),
                size: Sizes.iconSize16,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: Sizes.width8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: AppTextStyles
                        .liberationMono
                        .textStyle8BoldGrey500Spacing1,
                  ),
                  const SizedBox(height: Sizes.height2),
                  Text(
                    value,
                    style: AppTextStyles.inter.textStyle12BoldBlack87.copyWith(
                      color: isWarning
                          ? AppColors.stageLocked
                          : AppColors.textPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ──────────────────────────────────────────
  // Control Points Lists
  // ──────────────────────────────────────────
  Widget _buildCp1WifiVernier(AppLocalizations l10n) {
    return Container(
      decoration: AppDecorations.qualitySetupControlPointCard(),
      padding: const EdgeInsets.all(Sizes.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildCpHeaderRow(
            cpId: 'CP-01',
            title: l10n.crimpingDiameterEndA,
            lastReading: '9.02 ${l10n.mm}',
            lastReadingTime: '08:47:12',
            isOk: true,
            l10n: l10n,
          ),
          const SizedBox(height: Sizes.height12),
          _buildCpSpecsRow(
            standard: '9.00 \u00b1 0.05 ${l10n.mm}',
            method: l10n.digitalVernier,
            sample: 'n = 5',
            l10n: l10n,
          ),
          const SizedBox(height: Sizes.height24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                l10n.wifiVernier5Samples,
                style:
                    AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: Sizes.width6,
                    height: Sizes.height6,
                    decoration: AppDecorations.qualitySetupStatusDot(
                      color: AppColors.stageLiveGreen,
                    ),
                  ),
                  const SizedBox(width: Sizes.width4),
                  Text(
                    l10n.inTolerance,
                    style: AppTextStyles.liberationMono.textStyle10BoldGreen,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: Sizes.height12),
          Row(
            children: _vernierReadings.map((reading) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: Sizes.margin8),
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.padding12,
                  ),
                  decoration: AppDecorations.qualitySetupInputBox(
                    isActive: true,
                    isOk: true,
                  ),
                  child: Center(
                    child: Text(
                      reading,
                      style: AppTextStyles.inter.textStyle16BoldGreen,
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

  Widget _buildCp2OkNgCounter(AppLocalizations l10n) {
    return Container(
      decoration: AppDecorations.qualitySetupControlPointCard(),
      padding: const EdgeInsets.all(Sizes.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildCpHeaderRow(
            cpId: 'CP-02',
            title: l10n.insertionMarkVisible,
            lastReading: l10n.ok,
            lastReadingTime: '08:47:12',
            isOk: true,
            l10n: l10n,
          ),
          const SizedBox(height: Sizes.height12),
          _buildCpSpecsRow(
            standard: l10n.withinPaintLine,
            method: l10n.visually,
            sample: 'n = 5',
            l10n: l10n,
          ),
          const SizedBox(height: Sizes.height24),
          Row(
            children: <Widget>[
              Expanded(
                child: _buildCounterWidget(
                  label: '${l10n.ok} \u2022 97%',
                  count: _cp2OkCount,
                  isOk: true,
                  onMinus: () => setState(() {
                    if (_cp2OkCount > 0) _cp2OkCount--;
                  }),
                  onPlus: () => setState(() {
                    _cp2OkCount++;
                  }),
                ),
              ),
              const SizedBox(width: Sizes.width16),
              Expanded(
                child: _buildCounterWidget(
                  label: '${l10n.ng} \u2022 ${l10n.taken} 39',
                  count: _cp2NgCount,
                  isOk: false,
                  onMinus: () => setState(() {
                    if (_cp2NgCount > 0) _cp2NgCount--;
                  }),
                  onPlus: () => setState(() {
                    _cp2NgCount++;
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCp3OkNgCounter(AppLocalizations l10n) {
    return Container(
      decoration: AppDecorations.qualitySetupControlPointCard(),
      padding: const EdgeInsets.all(Sizes.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'CP-03',
                    style: AppTextStyles.liberationMono.textStyle12BoldGrey500,
                  ),
                  const SizedBox(width: Sizes.width16),
                  Text(
                    l10n.crimpingAppearanceCracks,
                    style: AppTextStyles.inter.textStyle16BoldBlack87,
                  ),
                  const SizedBox(width: Sizes.width12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.padding6,
                      vertical: Sizes.padding4,
                    ),
                    decoration: AppDecorations.qualitySetupDangerTag(),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.star,
                          size: Sizes.iconSize10,
                          color: AppColors.danger,
                        ),
                        const SizedBox(width: Sizes.width4),
                        Text(
                          l10n.kakotora,
                          style:
                              AppTextStyles.liberationMono.textStyle10BoldRed,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: Sizes.width8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.padding6,
                      vertical: Sizes.padding4,
                    ),
                    decoration: AppDecorations.qualitySetupWarningTag(),
                    child: Text(
                      l10n.photoReq,
                      style: AppTextStyles.liberationMono.textStyle10Bold
                          .copyWith(color: AppColors.stageLocked),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.padding12,
                  vertical: Sizes.padding8,
                ),
                decoration: AppDecorations.qualitySetupDangerCard(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      l10n.lastReading,
                      style: AppTextStyles
                          .liberationMono
                          .textStyle8BoldGrey500Spacing1,
                    ),
                    const SizedBox(height: Sizes.height2),
                    Text(l10n.ng, style: AppTextStyles.inter.textStyle16BoldRed),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCpHeaderRow({
    required String cpId,
    required String title,
    required String lastReading,
    required String lastReadingTime,
    required bool isOk,
    required AppLocalizations l10n,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              cpId,
              style: AppTextStyles.liberationMono.textStyle12BoldGrey500,
            ),
            const SizedBox(width: Sizes.width16),
            Text(title, style: AppTextStyles.inter.textStyle16BoldBlack87),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.padding12,
            vertical: Sizes.padding8,
          ),
          decoration: AppDecorations.qualitySetupReadingStatus(
            isOk: isOk,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                l10n.lastReading,
                style:
                    AppTextStyles.liberationMono.textStyle8BoldGrey500Spacing1,
              ),
              const SizedBox(height: Sizes.height2),
              Text(
                lastReading,
                style: isOk
                    ? AppTextStyles.inter.textStyle16BoldGreen
                    : AppTextStyles.inter.textStyle16BoldRed,
              ),
              Text(
                lastReadingTime,
                style: AppTextStyles.liberationMono.textStyle10RegularGrey500,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCpSpecsRow({
    required String standard,
    required String method,
    required String sample,
    required AppLocalizations l10n,
  }) {
    return Row(
      children: <Widget>[
        const SizedBox(width: Sizes.width48), // Indent past CP-ID
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                l10n.standard,
                style:
                    AppTextStyles.liberationMono.textStyle8BoldGrey500Spacing1,
              ),
              const SizedBox(height: Sizes.height4),
              Text(
                standard,
                style: AppTextStyles.liberationMono.textStyle12BoldBlack87,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                l10n.method,
                style:
                    AppTextStyles.liberationMono.textStyle8BoldGrey500Spacing1,
              ),
              const SizedBox(height: Sizes.height4),
              Text(
                method,
                style: AppTextStyles.liberationMono.textStyle12BoldBlack87,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                l10n.sample,
                style:
                    AppTextStyles.liberationMono.textStyle8BoldGrey500Spacing1,
              ),
              const SizedBox(height: Sizes.height4),
              Text(
                sample,
                style: AppTextStyles.liberationMono.textStyle12BoldBlack87,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCounterWidget({
    required String label,
    required int count,
    required bool isOk,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
        ),
        const SizedBox(height: Sizes.height8),
        Row(
          children: <Widget>[
            InkWell(
              onTap: onMinus,
              child: Container(
                width: Sizes.width48,
                height: Sizes.height48,
                decoration: AppDecorations.qualitySetupCounterPlus(
                  isOk: isOk,
                ),
                child: Center(
                  child: Icon(
                    Icons.remove,
                    color: isOk ? const Color(0xFF1E8E3E) : AppColors.danger,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: Sizes.height48,
                decoration: AppDecorations.qualitySetupCounterValue(
                  isOk: isOk,
                ),
                child: Center(
                  child: Text(
                    '$count',
                    style: isOk
                        ? AppTextStyles.inter.textStyle24BoldGreen
                        : AppTextStyles.inter.textStyle24BoldRed,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: onPlus,
              child: Container(
                width: Sizes.width48,
                height: Sizes.height48,
                decoration: AppDecorations.qualitySetupCounterMinus(
                  isOk: isOk,
                ),
                child: const Center(
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ──────────────────────────────────────────
  // Right Panel Components
  // ──────────────────────────────────────────
  Widget _buildLiveVernierWidget(AppLocalizations l10n) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.padding16,
            vertical: Sizes.padding12,
          ),
          decoration: AppDecorations.qualitySetupLiveHeader(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                l10n.liveVernier,
                style:
                    AppTextStyles.liberationMono.textStyle10BoldWhiteSpacing05,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: Sizes.width6,
                    height: Sizes.height6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1E8E3E),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: Sizes.width4),
                  Text(
                    l10n.wifi,
                    style: AppTextStyles
                        .liberationMono
                        .textStyle10BoldWhiteSpacing05,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(Sizes.padding16),
          decoration: AppDecorations.qualitySetupLiveBody(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text('9.02', style: AppTextStyles.inter.textStyle48BoldGreen),
                  const SizedBox(width: Sizes.width8),
                  Text(
                    l10n.mm,
                    style:
                        AppTextStyles.liberationMono.textStyle14RegularGrey500,
                  ),
                ],
              ),
              const SizedBox(height: Sizes.height8),
              Text(
                '${l10n.spec} 9.00 \u00b10.05 \u2022 ${l10n.withinTol}',
                style:
                    AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
              ),
              const SizedBox(height: Sizes.height24),
              // Mock Histogram
              SizedBox(
                height: Sizes.height40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    _buildHistogramBar(0.2),
                    _buildHistogramBar(0.3),
                    _buildHistogramBar(0.4),
                    _buildHistogramBar(0.5),
                    _buildHistogramBar(1.0, isHighlight: true),
                    _buildHistogramBar(0.9),
                    _buildHistogramBar(0.6),
                    _buildHistogramBar(0.4),
                    _buildHistogramBar(0.2),
                    _buildHistogramBar(0.1),
                  ],
                ),
              ),
              const SizedBox(height: Sizes.height4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '8.95',
                    style:
                        AppTextStyles.liberationMono.textStyle10RegularGrey500,
                  ),
                  Text(
                    '9.00',
                    style:
                        AppTextStyles.liberationMono.textStyle10RegularGrey500,
                  ),
                  Text(
                    '9.05',
                    style:
                        AppTextStyles.liberationMono.textStyle10RegularGrey500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistogramBar(double factor, {bool isHighlight = false}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Sizes.margin2),
        height: Sizes.height40 * factor,
        decoration: AppDecorations.qualitySetupHistogramBar(
          isHighlight: isHighlight,
        ),
      ),
    );
  }

  Widget _buildFirstOffGateWidget(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(Sizes.padding16),
      decoration: AppDecorations.qualitySetupFirstOffGate(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.firstOffGate,
            style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
          ),
          const SizedBox(height: Sizes.height8),
          Text(
            l10n.awaitingTlQc,
            style: AppTextStyles.inter.textStyle16BoldBlack87,
          ),
          const SizedBox(height: Sizes.height16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: Sizes.width8,
                    height: Sizes.height8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1E8E3E),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: Sizes.width8),
                  Text(
                    'TL Rajesh',
                    style: AppTextStyles.inter.textStyle14RegularBlack87,
                  ),
                ],
              ),
              Text(
                l10n.signed,
                style: AppTextStyles.liberationMono.textStyle10BoldGreen,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: Sizes.padding12),
            child: Divider(
              color: AppColors.greyBorder,
              height: 1,
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: Sizes.width8,
                    height: Sizes.height8,
                    decoration: const BoxDecoration(
                      color: AppColors.stageLocked,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: Sizes.width8),
                  Text(
                    'QC Priya',
                    style: AppTextStyles.inter.textStyle14RegularBlack87,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: AppDecorations.darkElevatedButton(),
                child: Text(
                  l10n.callQc,
                  style: AppTextStyles.inter.textStyle12BoldWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStageLogWidget(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(Sizes.padding16),
      decoration: AppDecorations.qualitySetupStageLog(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.stageLog,
            style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
          ),
          const SizedBox(height: Sizes.height16),
          _buildLogItem('08:47', 'Vernier reading 9.02', true),
          _buildLogItem('08:46', 'Vernier reading 8.99', true),
          _buildLogItem('08:45', 'Vernier reading 9.03', true),
          _buildLogItem('08:43', 'Jig scanned - CJ-2207', false),
          _buildLogItem('08:42', 'Stage opened - session lock', false),
        ],
      ),
    );
  }

  Widget _buildLogItem(String time, String message, bool isGreen) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Sizes.padding8),
      child: Row(
        children: <Widget>[
          Text(
            time,
            style: AppTextStyles.liberationMono.textStyle10RegularGrey500,
          ),
          const SizedBox(width: Sizes.width16),
          Container(
            width: Sizes.width6,
            height: Sizes.height6,
            decoration: AppDecorations.qualitySetupLogDot(
              isGreen: isGreen,
            ),
          ),
          const SizedBox(width: Sizes.width8),
          Text(message, style: AppTextStyles.inter.textStyle12RegularBlack87),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────
  // Bottom Action Bar
  // ──────────────────────────────────────────
  Widget _buildBottomBar(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding24,
        vertical: Sizes.padding16,
      ),
      decoration: const BoxDecoration(
        color: AppColors.colorWhite,
        border: Border(top: BorderSide(color: AppColors.greyBorder)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('3 / 3', style: AppTextStyles.inter.textStyle14BoldBlack87),
              const SizedBox(width: Sizes.width8),
              Text(
                l10n.controlPointsLabel,
                style: AppTextStyles.inter.textStyle14RegularBlack87,
              ),
              Text(
                l10n.firstOffPending,
                style: AppTextStyles.inter.textStyle14Bold.copyWith(
                  color: AppColors.stageLocked,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              OutlinedButton(
                onPressed: () {},
                style: AppDecorations.dangerOutlinedButton(),
                child: Text(
                  l10n.raiseBreakdown,
                  style: AppTextStyles.inter.textStyle14BoldRed,
                ),
              ),
              const SizedBox(width: Sizes.width12),
              OutlinedButton(
                onPressed: () {},
                style: AppDecorations.darkOutlinedButton(),
                child: Text(
                  l10n.pause,
                  style: AppTextStyles.inter.textStyle14BoldBlack87,
                ),
              ),
              const SizedBox(width: Sizes.width12),
              ElevatedButton(
                onPressed: () {},
                style: AppDecorations.primaryGreenButton().copyWith(
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: Sizes.padding24,
                      vertical: Sizes.padding20,
                    ),
                  ),
                ),
                child: Text(
                  l10n.submitStage04,
                  style: AppTextStyles.inter.textStyle14BoldWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
