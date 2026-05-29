import 'package:control_card_prototype/common_lib.dart';
import 'package:go_router/go_router.dart';
import 'package:control_card_prototype/presentation/work_orders/models/work_order.dart';

class StageSetupScreen extends StatefulWidget {

  const StageSetupScreen({
    super.key,
    required this.workOrder,
    required this.stage,
  });
  final WorkOrder workOrder;
  final DetailedStage stage;

  @override
  State<StageSetupScreen> createState() => _StageSetupScreenState();
}

class _StageSetupScreenState extends State<StageSetupScreen> {
  int _targetCutCount = 200;
  bool _isCutCountVerified = false;

  final List<int> _presets = <int>[50, 100, 150, 200, 250, 300];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.stageBg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildHeader(context, l10n),
          _buildPhaseStepper(context, l10n),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Left Panel - Main tasks and checklist
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: AppDecorations.stageSetupLeftPanel(),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.padding32,
                        vertical: Sizes.padding24,
                      ),
                      children: <Widget>[
                        _buildPhaseProgressHeader(l10n),
                        const SizedBox(height: Sizes.height16),
                        _buildConfirmSectionHeader(l10n),
                        const SizedBox(height: Sizes.height16),
                        _buildChecklistItems(l10n),
                        const SizedBox(height: Sizes.height24),
                        _buildTargetCutCountSection(l10n),
                      ],
                    ),
                  ),
                ),
                // Right Panel - Gate status and Note
                SizedBox(
                  width: 360,
                  child: Container(
                    color: AppColors.colorWhite,
                    padding: const EdgeInsets.all(Sizes.padding24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          l10n.gateStatus,
                          style: AppTextStyles
                              .liberationMono
                              .textStyle10BoldGrey500Spacing1,
                        ),
                        const SizedBox(height: Sizes.height16),
                        _buildGateStatusItem(
                          stepNumber: '1',
                          title: l10n.jigSetupDone,
                          subtitle: 'Rajesh S. - TL - 08:38',
                          isDone: true,
                          showStamp: true,
                        ),
                        const Divider(
                          height: Sizes.height32,
                          color: AppColors.stageDividerLight,                        ),
                        _buildGateStatusItem(
                          stepNumber: '2',
                          title: _isCutCountVerified
                              ? l10n.quantitySetupDone
                              : l10n.quantitySetupInProgress,
                          subtitle: _isCutCountVerified
                              ? l10n.verified3of3
                              : l10n.verified2of3,
                          isActive: !_isCutCountVerified,
                          isDone: _isCutCountVerified,
                        ),
                        const Divider(
                          height: Sizes.height32,
                          color: AppColors.stageDividerLight,                        ),
                        _buildGateStatusItem(
                          stepNumber: '3',
                          title: l10n.qualitySetupLocked,
                          subtitle: l10n.awaitingQtyDone,
                          isLocked: true,
                        ),
                        const Spacer(),
                        _buildWarningNoteCard(l10n),
                        const SizedBox(height: Sizes.height24),
                        _buildActionButtons(context, l10n),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
          // Back Button
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
          // Metadata breadcrumb & Screen title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'WO ${widget.workOrder.id} \u2022 STAGE ${widget.stage.id} \u2022 ${widget.stage.isOffline ? l10n.offline.toUpperCase() : l10n.online} \u2022 ${widget.stage.name.toUpperCase()}',
                  style: AppTextStyles
                      .liberationMono
                      .textStyle10BoldGrey500Spacing1,
                ),
                const SizedBox(height: Sizes.height4),
                Text(
                  l10n.stageSetup,
                  style: AppTextStyles.inter.textStyle24BoldBlack87,
                ),
              ],
            ),
          ),
          // Right metadata / status badges
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                l10n.setup2of3Qty,
                style:
                    AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
              ),
              const SizedBox(height: Sizes.height6),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.padding10,
                  vertical: Sizes.padding4,
                ),
                decoration: AppDecorations.stageSetupBadge(
                  color: AppColors.stageLocked,
                ),
                child: Text(
                  l10n.stageLocked,
                  style: AppTextStyles
                      .liberationMono
                      .textStyle10BoldWhiteSpacing05,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────
  // Phase Progress Stepper Bar
  // ──────────────────────────────────────────
  Widget _buildPhaseStepper(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(Sizes.padding24),
      decoration: AppDecorations.stageSetupHeader(),
      child: Row(
        children: <Widget>[
          // Phase 1 Card (DONE)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding16,
                vertical: Sizes.padding12,
              ),
              decoration: AppDecorations.stageSetupPhaseCard(
                color: AppColors.stageCardGreenBg,                borderColor: AppColors.stageDone,
                borderWidth: 1.5,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 32,
                    height: 32,
                    decoration: AppDecorations.stageSetupCircleIndicator(
                      color:AppColors.stageDone,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: Sizes.iconSize18,
                      color: AppColors.colorWhite,
                    ),
                  ),
                  const SizedBox(width: Sizes.width12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          l10n.phase1,
                          style: AppTextStyles
                              .liberationMono
                              .textStyle8BoldGrey500Spacing1,
                        ),
                        const SizedBox(height: Sizes.height2),
                        Text(
                          l10n.jigSetup,
                          style: AppTextStyles.inter.textStyle12w600Black87,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.padding6,
                      vertical: Sizes.padding2,
                    ),
                    decoration: AppDecorations.stageSetupDoneBadge(),
                    child: Text(
                      l10n.statusDone,
                      style: AppTextStyles.liberationMono.textStyle10BoldGreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: Sizes.width16),
          // Phase 2 Card (IN PROGRESS)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding16,
                vertical: Sizes.padding12,
              ),
              decoration: AppDecorations.stageSetupPhaseCard(
                color: AppColors.colorWhite,
                borderColor: AppColors.stageProgress,
                borderWidth: 2.0,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: Sizes.width32,
                    height: Sizes.height32,
                    decoration: AppDecorations.stageSetupCircleIndicator(
                      color: AppColors.stageProgress,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style:
                            AppTextStyles.liberationMono.textStyle12BoldWhite,
                      ),
                    ),
                  ),
                  const SizedBox(width: Sizes.width12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          l10n.phase2,
                          style: AppTextStyles
                              .liberationMono
                              .textStyle8BoldGrey500Spacing1,
                        ),
                        const SizedBox(height: Sizes.height2),
                        Text(
                          l10n.quantitySetup,
                          style: AppTextStyles.inter.textStyle12w600Black87,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: Sizes.width16),
          // Phase 3 Card (LOCKED)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding16,
                vertical: Sizes.padding12,
              ),
              decoration: AppDecorations.stageSetupPhaseCard(
                color: AppColors.stageGreyBg,
                borderColor: AppColors.stageLightBorder,
                borderWidth: 1.0,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: Sizes.width32,
                    height: Sizes.height32,
                    decoration: AppDecorations.stageSetupCircleIndicator(
                      color: AppColors.grey300Color,
                    ),
                    child: Center(
                      child: Text(
                        '3',
                        style: AppTextStyles
                            .liberationMono
                            .textStyle12BoldGrey600Spacing1,
                      ),
                    ),
                  ),
                  const SizedBox(width: Sizes.width12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          l10n.phase3,
                          style: AppTextStyles
                              .liberationMono
                              .textStyle8BoldGrey500Spacing1,
                        ),
                        const SizedBox(height: Sizes.height2),
                        Text(
                          l10n.qualitySetup,
                          style: AppTextStyles.inter.textStyle12w600Black87
                              .copyWith(color: AppColors.grey500Color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────
  // Phase 2 Metadata Sub-header
  // ──────────────────────────────────────────
  Widget _buildPhaseProgressHeader(AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          l10n.phase2of3QuantitySetup,
          style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            l10n.viewJigSetup,
            style: AppTextStyles.liberationMono.textStyle10BoldBlue,
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmSectionHeader(AppLocalizations l10n) {
    return Text(
      l10n.confirmRawInputs,
      style: AppTextStyles.inter.textStyle20BoldBlack87,
    );
  }

  // ──────────────────────────────────────────
  // Checklist Items Builder
  // ──────────────────────────────────────────
  Widget _buildChecklistItems(AppLocalizations l10n) {
    return Column(
      children: <Widget>[
        // Hose roll length (Verified)
        _buildChecklistItem(
          title: l10n.hoseRollLength,
          subtitle: l10n.wifiScale,
          specText: '885 \u00b13 mm',
          isVerified: true,
          l10n: l10n,
        ),
        const SizedBox(height: Sizes.height12),
        // Cut count (Interactive)
        _buildChecklistItem(
          title: l10n.cutCount,
          subtitle: l10n.counter,
          specText: '$_targetCutCount ${l10n.pcsTarget}',
          isVerified: _isCutCountVerified,
          isInteractive: true,
          onActionPressed: () {
            setState(() {
              _isCutCountVerified = true;
            });
          },
          l10n: l10n,
        ),
        const SizedBox(height: Sizes.height12),
        // Hose stamp (Verified)
        _buildChecklistItem(
          title: l10n.hoseStamp,
          subtitle: l10n.picture,
          specText: 'DOT GB16897 NVC 05/26',
          isVerified: true,
          l10n: l10n,
        ),
      ],
    );
  }

  Widget _buildChecklistItem({
    required String title,
    required String subtitle,
    required String specText,
    required bool isVerified,
    required AppLocalizations l10n,
    bool isInteractive = false,
    VoidCallback? onActionPressed,
  }) {
    return Container(
      decoration: AppDecorations.stageSetupChecklistItem(
        isVerified: isVerified,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding16,
        vertical: Sizes.padding16,
      ),
      child: Row(
        children: <Widget>[
          // Icon Container
          Container(
            padding: const EdgeInsets.all(Sizes.padding4),
            decoration: AppDecorations.stageSetupChecklistIconBg(
              isVerified: isVerified,
            ),
            child: Icon(
              isVerified ? Icons.check : Icons.priority_high,
              size: Sizes.iconSize16,
              color: isVerified
                  ? AppColors.stageDone
                  : AppColors.stageLocked,
            ),
          ),
          const SizedBox(width: Sizes.width16),
          // Checklist item text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: AppTextStyles.inter.textStyle14BoldBlack87),
                const SizedBox(height: Sizes.height2),
                Text(
                  subtitle,
                  style: AppTextStyles.liberationMono.textStyle10RegularGrey600,
                ),
              ],
            ),
          ),
          // Spec / Value layout
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                l10n.specValue,
                style:
                    AppTextStyles.liberationMono.textStyle8BoldGrey500Spacing1,
              ),
              const SizedBox(height: Sizes.height2),
              Text(
                specText,
                style: AppTextStyles.liberationMono.textStyle14BoldBlack87,
              ),
            ],
          ),
          const SizedBox(width: Sizes.width16),
          // Badge or Interactive Button
          if (isVerified)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.padding8,
                vertical: Sizes.padding4,
              ),
              decoration: AppDecorations.stageSetupDoneBadge(),
              child: Text(
                l10n.verified,
                style: AppTextStyles.liberationMono.textStyle10BoldGreen,
              ),
            )
          else if (isInteractive)
            ElevatedButton(
              onPressed: onActionPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
                foregroundColor: AppColors.colorWhite,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Sizes.radius4),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.padding12,
                  vertical: Sizes.padding10,
                ),
              ),
              child: Text(
                l10n.qrCapture,
                style:
                    AppTextStyles.liberationMono.textStyle10BoldWhiteSpacing05,
              ),
            ),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────
  // Target Cut Count & Presets Grid Component
  // ──────────────────────────────────────────
  Widget _buildTargetCutCountSection(AppLocalizations l10n) {
    final bool matchesDefault = _targetCutCount == 200;
    return Container(
      decoration: AppDecorations.stageSetupSectionContainer(),
      padding: const EdgeInsets.all(Sizes.padding24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    l10n.targetCutCount,
                    style: AppTextStyles
                        .liberationMono
                        .textStyle10BoldGrey500Spacing1,
                  ),
                  const SizedBox(height: Sizes.height4),
                  Text(
                    l10n.tapPresetNoTyping,
                    style: AppTextStyles.inter.textStyle14BoldGrey,
                  ),
                ],
              ),
              Text(
                '$_targetCutCount',
                style: AppTextStyles.inter.textStyle32BoldBlack87,
              ),
            ],
          ),
          const SizedBox(height: Sizes.height16),
          // Presets horizontal row
          Row(
            children: <Widget>[
              ..._presets.map((int preset) {
                final bool isSelected = _targetCutCount == preset;
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: Sizes.margin6),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _targetCutCount = preset;
                        });
                      },
                      child: Container(
                        height: Sizes.height48,                        decoration: AppDecorations.stageSetupPresetButton(
                          isSelected: isSelected,
                        ),
                        child: Center(
                          child: Text(
                            '$preset',
                            style: isSelected
                                ? AppTextStyles.inter.textStyle14Bold.copyWith(
                                    color: AppColors.colorWhite,
                                  )
                                : AppTextStyles.inter.textStyle14BoldBlack87,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              // Minus Button
              Container(
                margin: const EdgeInsets.only(right: Sizes.margin6),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (_targetCutCount > 0) _targetCutCount--;
                    });
                  },
                  child: Container(
                    width: Sizes.width48,
                    height: Sizes.height48,
                    decoration: AppDecorations.stageSetupPresetAdjustButton(),
                    child: const Icon(
                      Icons.remove,
                      size: Sizes.iconSize20,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
              // Plus Button
              InkWell(
                onTap: () {
                  setState(() {
                    _targetCutCount++;
                  });
                },
                child: Container(
                  width: Sizes.width48,
                  height: Sizes.height48,
                  decoration: AppDecorations.stageSetupPresetAdjustButton(),
                  child: const Icon(
                    Icons.add,
                    size: Sizes.iconSize20,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Sizes.height16),
          Text(
            matchesDefault ? l10n.presetMatchesWoQty : l10n.customTargetSet,
            style: AppTextStyles.liberationMono.textStyle10RegularGrey500,
          ),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────
  // Gate Status Sidebar Step Item
  // ──────────────────────────────────────────
  Widget _buildGateStatusItem({
    required String stepNumber,
    required String title,
    required String subtitle,
    bool isDone = false,
    bool isActive = false,
    bool isLocked = false,
    bool showStamp = false,
  }) {
    Color stepColor = AppColors.grey400Color;
    if (isDone) stepColor = AppColors.stageDone;
    if (isActive) stepColor =AppColors.stageProgress;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Number indicator
        Container(
          width: Sizes.width28,
          height: Sizes.height28,
          decoration: AppDecorations.stageSetupGateStatusCircle(
            bgColor: isDone
                ? AppColors.stageSuccessBg
                : isActive
                ? AppColors.stageLightBlue
                : AppColors.stageGreyBg,
            borderColor: stepColor,
          ),
          child: Center(
            child: isDone
                ? const Icon(
                    Icons.check,
                    size: Sizes.iconSize14,
                    color: AppColors.stageDone,
                  )
                : Text(
                    stepNumber,
                    style: AppTextStyles.liberationMono.textStyle10Bold
                        .copyWith(color: stepColor),
                  ),
          ),
        ),
        const SizedBox(width: Sizes.width12),
        // Step details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: AppTextStyles.inter.textStyle12BoldBlack87.copyWith(
                  color: isLocked
                      ? AppColors.grey400Color
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: Sizes.height2),
              Text(
                subtitle,
                style: AppTextStyles.liberationMono.textStyle10RegularGrey500,
              ),
            ],
          ),
        ),
        // Stamp badge (for TL signed state)
        if (showStamp)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.padding6,
              vertical: Sizes.padding2,
            ),
            decoration: AppDecorations.stageSetupDoneBadge(),
            child: Text(
              AppLocalizations.of(context)!.signed,
              style: AppTextStyles.liberationMono.textStyle8BoldGreen,
            ),
          ),
      ],
    );
  }

  // ──────────────────────────────────────────
  // Note Card
  // ──────────────────────────────────────────
  Widget _buildWarningNoteCard(AppLocalizations l10n) {
    return Container(
      decoration: AppDecorations.stageSetupWarningNote(),
      padding: const EdgeInsets.all(Sizes.padding12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(
                Icons.info_outline,
                size: Sizes.iconSize16,
                color: AppColors.warningOrange,
              ),
              const SizedBox(width: Sizes.width6),
              Text(
                l10n.note,
                style: AppTextStyles.inter.textStyle12BoldBlack87.copyWith(
                  color: AppColors.warningOrange,
                ),
              ),
            ],
          ),
          const SizedBox(height: Sizes.height6),
          Text(
            l10n.processTasksNote,
            style: AppTextStyles.inter.textStyle11RegularGrey600.copyWith(
              color: AppColors.warningOrange,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────
  // Sticky Action Buttons
  // ──────────────────────────────────────────
  Widget _buildActionButtons(BuildContext context, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Save & Pause Button
        OutlinedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.qtySetupSaved),
                backgroundColor:AppColors.stageProgress,
              ),
            );
          },
          style: AppDecorations.defaultOutlinedButton().copyWith(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: Sizes.padding16),
            ),
          ),
          child: Text(
            l10n.saveAndPause,
            style: AppTextStyles.inter.textStyle14BoldBlack87,
          ),
        ),
        const SizedBox(height: Sizes.height12),
        // Submit Button
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.qtySetupSubmitted),
                backgroundColor: AppColors.stageDone,
              ),
            );
            context.push(
              RouteNames.qualitySetupScreen,
              extra: {
                'workOrder': widget.workOrder,
                'stage': widget.stage,
              },
            );
          },
          style: AppDecorations.primaryGreenButton().copyWith(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: Sizes.padding16),
            ),
          ),
          child: Text(
            l10n.submitQuantityStartQuality,
            style: AppTextStyles.inter.textStyle14Bold.copyWith(
              color: AppColors.colorWhite,
            ),
          ),
        ),
      ],
    );
  }
}
