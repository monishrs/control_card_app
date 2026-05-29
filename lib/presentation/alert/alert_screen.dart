import 'package:control_card_prototype/common_lib.dart';
import 'package:control_card_prototype/core/utils/app_decorations.dart';
import 'package:control_card_prototype/core/utils/utils.dart';

/// class for the alert screen
class AlertScreen extends StatefulWidget {

  /// constructor for the alert screen
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  int _selectedAlertIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBg,
      body: Column(
        children: <Widget>[
          _buildHeader(),
          const Divider(height: Sizes.height1, thickness: Sizes.width1, color: AppColors.greyBorder),
           _buildTabs(),
          const Divider(height: Sizes.height1, thickness: Sizes.width1, color: AppColors.greyBorder),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildAlertsList(),
                const VerticalDivider(width: Sizes.width0, thickness: Sizes.width1, color: AppColors.greyBorder),
                _buildDetailsPanel(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.padding24, vertical: Sizes.padding12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('LIVE FEED · LINE 03 · LAST 24H', style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1),
              const SizedBox(height: Sizes.padding4),
              Text(AppLocalizations.of(context)!.navAlerts, style: AppTextStyles.inter.textStyle24BoldBlack87),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.padding8, vertical: Sizes.padding4),
                decoration: AppDecorations.statusBadge(color: AppColors.danger, radius: Sizes.radius0),
                child: Text('3 NEW', style: AppTextStyles.inter.textStyle10BoldWhiteSpacing05),
              ),
              const SizedBox(width: Sizes.padding16),
              OutlinedButton(
                onPressed: () {},
                style: AppDecorations.alertHeaderOutlinedButton(),
                child: Text(AppLocalizations.of(context)!.markAllRead),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      color: AppColors.surfaceBg,
      padding: const EdgeInsets.symmetric(horizontal: Sizes.padding24, vertical: Sizes.padding12),
      child: Row(
        children: <Widget>[
          _buildTabItem('ALL', '24', true),
          const SizedBox(width: Sizes.padding8),
          _buildTabItem('NG', '3', false),
          const SizedBox(width: Sizes.padding8),
          _buildTabItem('SIGN-OFF', '2', false),
          const SizedBox(width: Sizes.padding8),
          _buildTabItem('BREAKDOWN', '1', false),
          const SizedBox(width: Sizes.padding8),
          _buildTabItem('MASTER', '4', false),
          const SizedBox(width: Sizes.padding8),
          _buildTabItem('COMPLETION', '14', false),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, String count, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.padding8, vertical: Sizes.padding6),
      decoration: AppDecorations.alertTab(isSelected: isSelected),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            label,
            style: isSelected
                ? AppTextStyles.inter.textStyle10BoldWhiteSpacing05
                : AppTextStyles.inter.textStyle10BoldGrey600Spacing1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.padding4),
            child: Text(
              '·',
              style: isSelected
                  ? AppTextStyles.inter.textStyle10BoldWhite
                  : AppTextStyles.inter.textStyle10BoldGrey500,
            ),
          ),
          Text(
            count,
            style: isSelected
                ? AppTextStyles.inter.textStyle10BoldWhite
                : AppTextStyles.inter.textStyle10BoldGrey600,
          ),
        ],
      ),
    );
  }

  Widget _buildAlertsList() {
    return SizedBox(
      width: getMaxWidth(context) * 0.3,
      child: Container(
        color: AppColors.colorWhite,
        child: ListView(
          children: <Widget>[
            _buildAlertListItem(
              index: 0,
              tagLabel: 'NG LIMIT EXCEEDED',
              tagColor: AppColors.danger,
              time: '2m',
              title: 'Crimping Ø out-of-tolerance x3',
              subtitle: 'WO-2025-0381 · Stage 04 · Crimping End A',
            ),
            _buildAlertListItem(
              index: 1,
              tagLabel: 'FIRST-OFF PENDING',
              tagColor: AppColors.warningDark,
              time: '3m',
              title: 'QC sign-off needed · Crimping A',
              subtitle: 'WO-2025-0381 · Stage 04',
            ),
            _buildAlertListItem(
              index: 2,
              tagLabel: 'MASTER REVISED',
              tagColor: AppColors.textSecondary,
              time: '14m',
              title: 'Hose tolerance B-15015 → rev 14',
              subtitle: 'Affects 4 active WOs · 381, 382, 384, 385',
            ),
            _buildAlertListItem(
              index: 3,
              tagLabel: 'BREAKDOWN RAISED',
              tagColor: AppColors.danger,
              time: '22m',
              title: 'Bending machine BND-01 down',
              subtitle: 'Line 03 · raised by Suresh',
            ),
            _buildAlertListItem(
              index: 4,
              tagLabel: 'WO COMPLETED',
              tagColor: AppColors.success,
              time: '1h',
              title: 'WO-2025-0379 finished',
              subtitle: '180 OK · 2 NG · ready for WH transfer',
            ),
            _buildAlertListItem(
              index: 5,
              tagLabel: 'SHIFT HANDOVER',
              tagColor: AppColors.textSecondary,
              time: '1h',
              title: 'Shift B starts in 7h 18m',
              subtitle: '4 WOs will carry over · 1 in first-off',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertListItem({
    required int index,
    required String tagLabel,
    required Color tagColor,
    required String time,
    required String title,
    required String subtitle,
  }) {
    bool isSelected = _selectedAlertIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedAlertIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.padding24, vertical: Sizes.padding20),
        decoration: AppDecorations.alertListItem(isSelected: isSelected),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.padding6, vertical: Sizes.padding4),
                  decoration: AppDecorations.alertTag(color: tagColor),
                  child: Text(
                    tagLabel,
                    style: AppTextStyles.inter.style(
                      fontSize: Sizes.textSize10,
                      fontWeight: FontWeight.bold,
                      color: tagColor,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Text(
                  time,
                  style: AppTextStyles.inter.textStyle10RegularGrey500,
                ),
              ],
            ),
            const SizedBox(height: Sizes.padding12),
            Text(
              title,
              style: AppTextStyles.inter.textStyle14BoldBlack87,
            ),
            const SizedBox(height: Sizes.padding4),
            Text(
              subtitle,
              style: AppTextStyles.jetBrainsMono.style(
                fontSize: Sizes.textSize11,
                color: AppColors.subTitleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsPanel() {
    if (_selectedAlertIndex != 0) {
      return const SizedBox();
    }
    return Expanded(
      child: Container(
        color: AppColors.neutralBg,
        padding: const EdgeInsets.all(Sizes.padding12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.padding8, vertical: Sizes.padding4),
                  decoration: AppDecorations.statusBadge(color: AppColors.danger, radius: Sizes.radius0),
                  child: Text('NG LIMIT EXCEEDED · STAGE 04', style: AppTextStyles.liberationMono.textStyle10BoldWhiteSpacing05),
                )
              ],
            ),
            const SizedBox(height: Sizes.height4),
            Text(
              'Crimping Ø out-of-tolerance · 3 consecutive',
              style: AppTextStyles.inter.textStyle24BoldBlack87,
            ),
            const SizedBox(height: Sizes.height4),
            Text(
              'WO-2025-0381 · Stage 04 · Crimping End A · 2 min ago',
              style: AppTextStyles.liberationMono.textStyle12BoldGrey500Spacing1),
            const SizedBox(height: Sizes.height10),
            _buildReadingsBox(),
            const SizedBox(height: Sizes.padding24),
            _buildActionItemsBox(),
            const Spacer(),
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildReadingsBox() {
    return Container(
      decoration: AppDecorations.readingsBox(),
      padding: const EdgeInsets.all(Sizes.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('READINGS · LAST 5', style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1),
              ],
          ),
          const SizedBox(height: Sizes.padding16),
          Row(
            children: <Widget>[
              _buildReadingItem('9.02', AppColors.success,  AppColors.successLight),
              const SizedBox(width: Sizes.padding12),
              _buildReadingItem('9.04', AppColors.success, AppColors.successLight),
              const SizedBox(width: Sizes.padding12),
              _buildReadingItem('9.07', AppColors.danger, AppColors.dangerLight),
              const SizedBox(width: Sizes.padding12),
              _buildReadingItem('9.07', AppColors.danger, AppColors.dangerLight),
              const SizedBox(width: Sizes.padding12),
              _buildReadingItem('9.08', AppColors.danger, AppColors.dangerLight),
            ],
          ),
          const SizedBox(height: Sizes.height10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Spec: 9.00 ±0.05 (8.95 → 9.05)',
                style: AppTextStyles.jetBrainsMono.textStyle12RegularTextAlert,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Trend: ',
                    style: AppTextStyles.jetBrainsMono.textStyle12RegularTextAlert,
                  ),
                  Text(
                    '+0.06 ↑',
                    style: AppTextStyles.jetBrainsMono.textStyle12BoldDanger,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReadingItem(String value, Color color, Color bgColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Sizes.padding16),
        decoration: AppDecorations.readingItemBox(color: color, bgColor: bgColor),
        alignment: Alignment.center,
        child: Text(
          value,
          style: AppTextStyles.jetBrainsMono.textStyle18Bold.copyWith(color: color),
        ),
      ),
    );
  }

  Widget _buildActionItemsBox() {
    return Container(
      decoration: AppDecorations.readingsBox(),
      padding: const EdgeInsets.all(Sizes.padding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('LIKELY CAUSE', style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.padding8),
                child: Text('·', style: AppTextStyles.inter.textStyle10BoldGrey500),
              ),
              Text('SUGGESTED ACTIONS', style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1),
            ],
          ),
          const SizedBox(height: Sizes.padding16),
          _buildBulletItem('Crimp jig wear — recommend swap to CJ-2207-R backup'),
          const SizedBox(height: Sizes.padding10),
          _buildBulletItem('Re-calibrate WiFi vernier (last cal · 3 days ago)'),
          const SizedBox(height: Sizes.padding10),
          _buildBulletItem('Inspect last 12 pieces visually — quarantine if needed'),
        ],
      ),
    );
  }

  Widget _buildBulletItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: Sizes.padding8, right: Sizes.padding12),
          child: CircleAvatar(
            backgroundColor: AppColors.black,
            radius: Sizes.radius2,
          ),
        ),
        Expanded(
          child: RichText(
            text: _parseBoldText(text),
          ),
        ),
      ],
    );
  }

  TextSpan _parseBoldText(String text) {
    List<TextSpan> spans = <TextSpan>[];
    if (text.contains('CJ-2207-R')) {
      List<String> parts = text.split('CJ-2207-R');
      spans.add(TextSpan(text: parts[0], style: AppTextStyles.inter.textStyle13w600Black87));
      spans.add(TextSpan(text: 'CJ-2207-R', style: AppTextStyles.inter.textStyle13BoldBlack87));
      spans.add(TextSpan(text: parts[1], style: AppTextStyles.inter.textStyle13w600Black87));
    } else {
      spans.add(TextSpan(text: text, style: AppTextStyles.inter.textStyle13w600Black87));
    }
    return TextSpan(children: spans);
  }

  Widget _buildBottomActions() {
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: AppDecorations.alertBottomElevatedButton(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(AppLocalizations.of(context)!.openStage4, style: AppTextStyles.inter.textStyle14BoldWhite),
                const Icon(Icons.arrow_forward, size: Sizes.size16),
              ],
            ),
          ),
        ),
        const SizedBox(width: Sizes.padding16),
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: AppDecorations.alertBottomOutlinedButton(),
              child: Text(AppLocalizations.of(context)!.quarantinePieces, textAlign: TextAlign.center, style: AppTextStyles.inter.textStyle14BoldBlack87),
          ),
        ),
        const SizedBox(width: Sizes.padding16),
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: AppDecorations.alertBottomOutlinedButton(),
            child: Text(AppLocalizations.of(context)!.qcSupervisor, textAlign: TextAlign.center, style: AppTextStyles.inter.textStyle14BoldBlack87),
          ),
        ),
        const SizedBox(width: Sizes.padding16),
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: AppDecorations.alertBottomOutlinedButton(verticalPadding: Sizes.padding24),
            child: Text(AppLocalizations.of(context)!.acknowledge, style: AppTextStyles.inter.textStyle14BoldBlack87),
          ),
        ),
      ],
    );
  }
}
