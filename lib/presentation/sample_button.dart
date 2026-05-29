import 'package:flutter/material.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/utils/action_bar.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/widgets/app_button.dart';
import 'package:control_card_prototype/core/widgets/app_tab_bar.dart';
import 'package:control_card_prototype/core/widgets/color_chip_button.dart';
import 'package:control_card_prototype/core/widgets/number_stepper.dart';
import 'package:control_card_prototype/core/widgets/pill_group.dart';
import 'package:control_card_prototype/core/widgets/row_action_button.dart';
import 'package:control_card_prototype/core/widgets/segment_toggle.dart';
import 'package:control_card_prototype/core/widgets/status_badge.dart';

class ButtonShowcasePage extends StatefulWidget {
  const ButtonShowcasePage({super.key});

  @override
  State<ButtonShowcasePage> createState() => _ButtonShowcasePageState();
}

class _ButtonShowcasePageState extends State<ButtonShowcasePage> {
  bool _loading = false;
  int _colorSelected = 0;

  final List<Color> _swatchColors = <Color>[
    AppColors.primaryLight,
    AppColors.danger,
    AppColors.warning,
    AppColors.info,
    AppColors.subTitleColor,
  ];

  void _handleSubmit() async {
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _loading = false);
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontSize: 11,
        letterSpacing: 0.5,
        color: AppColors.subTitleColor,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          l10n.buttonWidgets,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 0.5, color: AppColors.greyBorder),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ── Primary ────────────────────────
            _label(l10n.primaryLabel),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                AppButton(
                  label: l10n.darkPrimary,
                  icon: Icons.check,
                  variant: BtnVariant.primary,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.confirm,
                  icon: Icons.check,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.signOff,
                  icon: Icons.draw_outlined,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.submit,
                  icon: Icons.upload_outlined,
                  loading: _loading,
                  onPressed: _handleSubmit,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Outlined ──────────────────────
            _label(l10n.outlinedLabel),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                AppButton(
                  label: l10n.greenOutline,
                  icon: Icons.check,
                  variant: BtnVariant.primaryOutline,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.redOutline,
                  icon: Icons.close,
                  variant: BtnVariant.dangerOutline,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Danger ─────────────────────────
            _label(l10n.dangerLabel),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                AppButton(
                  label: l10n.reject,
                  icon: Icons.close,
                  variant: BtnVariant.danger,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.flagIssue,
                  icon: Icons.warning_amber_outlined,
                  variant: BtnVariant.danger,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.cancelStage,
                  icon: Icons.block,
                  variant: BtnVariant.danger,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Warning ────────────────────────
            _label(l10n.warningLabel),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                AppButton(
                  label: l10n.hold,
                  icon: Icons.pause_circle_outline,
                  variant: BtnVariant.warning,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.rescan,
                  icon: Icons.refresh,
                  variant: BtnVariant.warning,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.pendingQc,
                  icon: Icons.access_time_outlined,
                  variant: BtnVariant.warning,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Secondary / ghost / info ───────
            _label(l10n.secondaryLabel),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                AppButton(
                  label: l10n.back,
                  icon: Icons.arrow_back,
                  variant: BtnVariant.secondary,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.edit,
                  icon: Icons.edit_outlined,
                  variant: BtnVariant.secondary,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.more,
                  icon: Icons.more_horiz,
                  variant: BtnVariant.ghost,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.scanBarcode,
                  icon: Icons.barcode_reader,
                  variant: BtnVariant.info,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Success ────────────────────────
            _label(l10n.successLabel),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                AppButton(
                  label: l10n.passed,
                  icon: Icons.check_circle_outline,
                  variant: BtnVariant.success,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.approve,
                  icon: Icons.thumb_up_outlined,
                  variant: BtnVariant.success,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Offline ────────────────────────
            _label(l10n.offlineModeLabel),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                AppButton(
                  label: l10n.continueOffline,
                  icon: Icons.cloud_off,
                  variant: BtnVariant.offline,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.syncWhenOnline,
                  icon: Icons.sync,
                  variant: BtnVariant.offline,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Sizes ──────────────────────────
            _label(l10n.sizesLabel),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                AppButton(
                  label: 'XL',
                  icon: Icons.check,
                  size: BtnSize.xl,
                  onPressed: () {},
                ),
                AppButton(
                  label: 'L',
                  icon: Icons.check,
                  size: BtnSize.lg,
                  onPressed: () {},
                ),
                AppButton(label: 'M', icon: Icons.check, onPressed: () {}),
                AppButton(
                  label: 'S',
                  icon: Icons.check,
                  size: BtnSize.sm,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Icon-only ──────────────────────
            _label(l10n.iconOnlyLabel),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                AppButton(
                  label: l10n.confirm,
                  icon: Icons.check,
                  iconOnly: true,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.reject,
                  icon: Icons.close,
                  iconOnly: true,
                  variant: BtnVariant.danger,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.edit,
                  icon: Icons.edit_outlined,
                  iconOnly: true,
                  variant: BtnVariant.secondary,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.hold,
                  icon: Icons.pause_circle_outline,
                  iconOnly: true,
                  variant: BtnVariant.warning,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.more,
                  icon: Icons.more_vert,
                  iconOnly: true,
                  variant: BtnVariant.ghost,
                  onPressed: () {},
                ),
                AppButton(
                  label: l10n.offline,
                  icon: Icons.cloud_off,
                  iconOnly: true,
                  variant: BtnVariant.offline,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Row action buttons ─────────────
            _label(l10n.rowActionButtonsLabel),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                RowActionButton(
                  icon: Icons.visibility_outlined,
                  tooltip: l10n.tooltipView,
                  onTap: () {},
                ),
                RowActionButton(
                  icon: Icons.edit_outlined,
                  tooltip: l10n.tooltipEdit,
                  onTap: () {},
                ),
                RowActionButton(
                  icon: Icons.delete_outline,
                  color: AppColors.danger,
                  tooltip: l10n.tooltipDelete,
                  onTap: () {},
                ),
                RowActionButton(
                  icon: Icons.print_outlined,
                  tooltip: l10n.tooltipPrint,
                  onTap: () {},
                ),
                RowActionButton(
                  icon: Icons.download_outlined,
                  tooltip: l10n.tooltipDownload,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Color chip swatches ────────────
            _label(l10n.colorChipLabel),
            Row(
              children: List.generate(
                _swatchColors.length,
                (int i) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ColorChipButton(
                    color: _swatchColors[i],
                    isSelected: _colorSelected == i,
                    onTap: () => setState(() => _colorSelected = i),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ── Number stepper ─────────────────
            _label(l10n.numberStepperLabel),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: <Widget>[
                NumberStepper(initialValue: 5, onChanged: (_) {}),
                NumberStepper(step: 5, onChanged: (_) {}),
              ],
            ),
            const SizedBox(height: 20),

            // ── Tab bar ────────────────────────
            _label(l10n.tabBarLabel),
            AppTabBar(
              tabs: <String>[l10n.overview, l10n.details, l10n.history, l10n.qc],
              onChanged: (_) {},
            ),
            const SizedBox(height: 20),

            // ── Segmented toggle ───────────────
            _label(l10n.segmentedToggleLabel),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: <Widget>[
                SegmentedToggle(
                  options: <String>[l10n.pass, l10n.fail, l10n.hold],
                  onChanged: (_) {},
                ),
                SegmentedToggle(
                  options: <String>[l10n.accept, l10n.rework, l10n.scrap],
                  activeColor: AppColors.danger,
                  onChanged: (_) {},
                ),
                SegmentedToggle(
                  options: <String>[l10n.ok, l10n.ng, l10n.qc],
                  activeColor: AppColors.qCColor,
                  onChanged: (_) {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Pill group ─────────────────────
            _label(l10n.pillGroupLabel),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: <Widget>[
                PillGroup(
                  options: <String>[l10n.inbound, l10n.outbound],
                  onChanged: (_) {},
                ),
                PillGroup(
                  options: <String>[l10n.am, l10n.pm, l10n.night],
                  onChanged: (_) {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Status badges ──────────────────
            _label(l10n.statusBadgesLabel),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: <Widget>[
                StatusBadge(
                  label: l10n.passed,
                  variant: BadgeVariant.success,
                  icon: Icons.check,
                ),
                StatusBadge(
                  label: l10n.failed,
                  variant: BadgeVariant.danger,
                  icon: Icons.close,
                ),
                StatusBadge(
                  label: l10n.onHold,
                  variant: BadgeVariant.warning,
                  icon: Icons.access_time_outlined,
                ),
                StatusBadge(
                  label: l10n.inProgress,
                  variant: BadgeVariant.info,
                  icon: Icons.refresh,
                ),
                StatusBadge(label: l10n.offline, variant: BadgeVariant.neutral),
                StatusBadge(label: l10n.revised, variant: BadgeVariant.revised),
                StatusBadge(
                  label: l10n.ok,
                  variant: BadgeVariant.ok,
                  icon: Icons.check_circle_outline,
                ),
                StatusBadge(
                  label: l10n.ng,
                  variant: BadgeVariant.ng,
                  icon: Icons.cancel_outlined,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Disabled ───────────────────────
            _label(l10n.disabledStateLabel),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                AppButton(label: l10n.confirm, icon: Icons.check),
                AppButton(
                  label: l10n.reject,
                  icon: Icons.close,
                  variant: BtnVariant.danger,
                ),
                AppButton(
                  label: l10n.outlinedLabel,
                  icon: Icons.check,
                  variant: BtnVariant.primaryOutline,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Action bars ────────────────────
            _label(l10n.actionBarsLabel),
            Column(
              children: <Widget>[
                ActionBar(
                  title: l10n.qcCheckTitle,
                  actions: <Widget>[
                    AppButton(
                      label: l10n.reject,
                      icon: Icons.close,
                      variant: BtnVariant.danger,
                      size: BtnSize.sm,
                      onPressed: () {},
                    ),
                    AppButton(
                      label: l10n.pass,
                      icon: Icons.check,
                      size: BtnSize.sm,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ActionBar(
                  title: l10n.palletStagingTitle,
                  actions: <Widget>[
                    AppButton(
                      label: l10n.hold,
                      icon: Icons.pause_circle_outline,
                      variant: BtnVariant.warning,
                      size: BtnSize.sm,
                      onPressed: () {},
                    ),
                    AppButton(
                      label: l10n.next,
                      icon: Icons.arrow_forward,
                      size: BtnSize.sm,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ActionBar(
                  title: l10n.signOffTitle,
                  actions: <Widget>[
                    AppButton(
                      label: l10n.print,
                      icon: Icons.print_outlined,
                      variant: BtnVariant.ghost,
                      size: BtnSize.sm,
                      onPressed: () {},
                    ),
                    AppButton(
                      label: l10n.signOff,
                      icon: Icons.draw_outlined,
                      size: BtnSize.sm,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Full-width CTAs ────────────────
            _label(l10n.fullWidthCTAsLabel),
            AppButton(
              label: l10n.confirmProceed,
              icon: Icons.check,
              size: BtnSize.lg,
              fullWidth: true,
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            AppButton(
              label: l10n.outlinedConfirm,
              icon: Icons.check,
              size: BtnSize.lg,
              variant: BtnVariant.primaryOutline,
              fullWidth: true,
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            AppButton(
              label: l10n.goBack,
              icon: Icons.arrow_back,
              size: BtnSize.lg,
              variant: BtnVariant.secondary,
              fullWidth: true,
              onPressed: () {},
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
