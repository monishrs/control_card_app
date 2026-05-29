import 'package:control_card_prototype/common_lib.dart';
import 'package:go_router/go_router.dart';
import '../work_orders/models/work_order.dart';

/// Data model representing a single offline step in the process.
class OfflineStepData {
  /// Constructor for [OfflineStepData].
  OfflineStepData({
    required this.id,
    required this.label,
    required this.name,
    required this.ctrlPoints,
    required this.assigneeTime,
    required this.specInfo,
    required this.status,
    this.hasKakotora = false,
    this.isLive = false,
  });

  /// The step ID.
  final String id;
  
  /// The short label (e.g. HC, CK).
  final String label;
  
  /// The name of the process step.
  final String name;
  
  /// Number of control points.
  final int ctrlPoints;
  
  /// Assignee and timestamp text.
  final String assigneeTime;
  
  /// Spec and target information.
  final String specInfo;
  
  /// Step status (done, active, upcoming).
  final String status;
  
  /// Whether this step has a Kakotora alert.
  final bool hasKakotora;
  
  /// Whether this step is currently live.
  final bool isLive;
}

/// A screen showing an overview of all offline processes of a work order.
class OfflineProcessesScreen extends StatelessWidget {
  /// Constructor for [OfflineProcessesScreen].
  const OfflineProcessesScreen({super.key, required this.workOrder});

  /// The associated work order.
  final WorkOrder workOrder;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context)!;

    final List<OfflineStepData> steps = <OfflineStepData>[
      OfflineStepData(
        id: '01',
        label: 'HC',
        name: 'Hose Cutting',
        ctrlPoints: 4,
        assigneeTime: '08:42 · Karthik',
        specInfo: 'n=200',
        status: 'done',
      ),
      OfflineStepData(
        id: '02',
        label: 'PC',
        name: 'Protector Cutting',
        ctrlPoints: 3,
        assigneeTime: '08:56 · Vikram',
        specInfo: 'n=200',
        status: 'done',
      ),
      OfflineStepData(
        id: '03',
        label: 'FB',
        name: 'Fitting Bending',
        ctrlPoints: 7,
        assigneeTime: '09:14 · Suresh',
        specInfo: "30°±2' / 20°±2'",
        status: 'done',
        hasKakotora: true,
      ),
      OfflineStepData(
        id: '04',
        label: 'LS',
        name: 'Mfg Lot Stamping',
        ctrlPoints: 4,
        assigneeTime: '09:30 · Suresh',
        specInfo: 'NII YMDD',
        status: 'done',
      ),
      OfflineStepData(
        id: '05',
        label: 'CK',
        name: 'Caulking',
        ctrlPoints: 3,
        assigneeTime: '09:42 · Karthik',
        specInfo: 'n=145',
        status: 'active',
        isLive: true,
      ),
      OfflineStepData(
        id: '06',
        label: 'HS',
        name: 'Heat Shrinkage',
        ctrlPoints: 2,
        assigneeTime: loc.awaitingPreviousStep,
        specInfo: '-',
        status: 'upcoming',
      ),
      OfflineStepData(
        id: '07',
        label: 'PB',
        name: 'Pipe Bending',
        ctrlPoints: 5,
        assigneeTime: loc.awaitingPreviousStep,
        specInfo: '-',
        status: 'upcoming',
      ),
      OfflineStepData(
        id: '08',
        label: 'AB',
        name: 'Advance Bonding',
        ctrlPoints: 4,
        assigneeTime: loc.awaitingPreviousStep,
        specInfo: '-',
        status: 'upcoming',
        hasKakotora: true,
      ),
      OfflineStepData(
        id: '09',
        label: 'MC',
        name: 'Middle Crimping',
        ctrlPoints: 6,
        assigneeTime: loc.awaitingPreviousStep,
        specInfo: 'Ø 9.80 ±0.05',
        status: 'upcoming',
        hasKakotora: true,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.stageHeaderBg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // 1. HEADER SECTION
            _buildHeader(context, loc),
            
            // Divider
            const Divider(height: Sizes.height1, color: AppColors.greyBorder),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.padding24,
                  vertical: Sizes.padding16,
                ),
                children: <Widget>[
                  // 2. OFFLINE PROGRESS SECTION
                  _buildProgressSection(loc),
                  
                  const SizedBox(height: Sizes.height20),

                  // 3. 3x3 GRID OF STEP CARDS
                  _buildGridSection(context, loc, steps),

                  const SizedBox(height: Sizes.height20),

                  // 4. FOOTER INFO & BUTTONS
                  _buildFooterSection(context, loc),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, AppLocalizations loc) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding24,
        vertical: Sizes.padding16,
      ),
      child: Row(
        children: <Widget>[
          // Back Button
          InkWell(
            onTap: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go(RouteNames.workDetailsScreen);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(Sizes.padding8),
              decoration: AppDecorations.offlineProcessBackButton(),
              child: const Icon(
                Icons.chevron_left,
                size: Sizes.iconSize24,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: Sizes.width16),
          
          // WO Metadata and Page Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'WO ${workOrder.id} • OFFLINE • KIT-1 • SETUP COMPLETE',
                  style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
                ),
                const SizedBox(height: Sizes.height4),
                Text(
                  loc.offlineProcesses,
                  style: AppTextStyles.inter.textStyle24BoldBlack87,
                ),
              ],
            ),
          ),

          // Right Header Badges & Action Buttons
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.padding12,
              vertical: Sizes.padding6,
            ),
            decoration: AppDecorations.offlineCompletedBadge(),
            child: Text(
              loc.fourOfNineDone,
              style: AppTextStyles.liberationMono.textStyle10BoldGreen,
            ),
          ),
          const SizedBox(width: Sizes.width12),
          ElevatedButton(
            onPressed: () {},
            style: AppDecorations.offlineQrButton(),
            child: Text(
              loc.qrBoxTag,
              style: AppTextStyles.inter.style(
                fontSize: Sizes.textSize12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection(AppLocalizations loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              loc.offlineProgressSteps,
              style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1,
            ),
            Text(
              loc.onSchedulePercent,
              style: AppTextStyles.liberationMono.textStyle10BoldGreen,
            ),
          ],
        ),
        const SizedBox(height: Sizes.height8),
        
        // 9-segment progress bar
        Row(
          children: List<Widget>.generate(9, (int index) {
            Color segmentColor;
            if (index < 4) {
              segmentColor = AppColors.stageDone; // Completed
            } else if (index == 4) {
              segmentColor = AppColors.offlineActiveBlue;
            } else {
              segmentColor = AppColors.grey300; // Upcoming
            }

            return Expanded(
              child: Container(
                height: Sizes.height8,
                margin: EdgeInsets.only(
                  right: index < 8 ? Sizes.margin4 : Sizes.margin0,
                ),
                decoration: AppDecorations.offlineProgressSegment(
                  color: segmentColor,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildGridSection(
    BuildContext context,
    AppLocalizations loc,
    List<OfflineStepData> steps,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: Sizes.margin16,
        mainAxisSpacing: Sizes.margin16,
        childAspectRatio: 1.8,
      ),
      itemCount: steps.length,
      itemBuilder: (BuildContext context, int index) {
        final OfflineStepData step = steps[index];
        return _buildStepCard(context, loc, step);
      },
    );
  }

  Widget _buildStepCard(
    BuildContext context,
    AppLocalizations loc,
    OfflineStepData step,
  ) {
    final bool isDone = step.status == 'done';
    final bool isActive = step.status == 'active';
    
    // Card Decoration styling
    BoxDecoration cardDecoration;
    if (isDone) {
      cardDecoration = AppDecorations.offlineCardCompleted();
    } else if (isActive) {
      cardDecoration = AppDecorations.offlineCardActive();
    } else {
      cardDecoration = AppDecorations.offlineCardUpcoming();
    }

    // Circular Step Code decoration
    Widget stepLabelIcon;
    if (isDone) {
      stepLabelIcon = Container(
        width: Sizes.size32,
        height: Sizes.size32,
        decoration: AppDecorations.offlineCompletedCircle(),
        alignment: Alignment.center,
        child: Text(
          step.label,
          style: AppTextStyles.inter.style(
            fontSize: Sizes.textSize11,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    } else if (isActive) {
      stepLabelIcon = Container(
        width: Sizes.size32,
        height: Sizes.size32,
        decoration: AppDecorations.offlineActiveCircle(),
        alignment: Alignment.center,
        child: Text(
          step.label,
          style: AppTextStyles.inter.style(
            fontSize: Sizes.textSize11,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    } else {
      stepLabelIcon = Container(
        width: Sizes.size32,
        height: Sizes.size32,
        decoration: AppDecorations.offlineUpcomingCircle(),
        alignment: Alignment.center,
        child: Text(
          step.label,
          style: AppTextStyles.inter.style(
            fontSize: Sizes.textSize11,
            fontWeight: FontWeight.bold,
            color: AppColors.grey400,
          ),
        ),
      );
    }

    // Top Right Icon (Status Check or Dot)
    final Widget topRightStatus;
    if (isDone) {
      topRightStatus = const Icon(
        Icons.check_circle,
        color: AppColors.stageLiveGreen,
        size: Sizes.iconSize20,
      );
    } else if (isActive) {
      topRightStatus = Container(
        width: Sizes.size10,
        height: Sizes.size10,
        decoration: AppDecorations.offlineStatusDot(),
      );
    } else {
      topRightStatus = const SizedBox.shrink();
    }

    return Container(
      decoration: cardDecoration,
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding16,
        vertical: Sizes.padding12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Header Row inside Card
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              stepLabelIcon,
              const SizedBox(width: Sizes.width12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'STEP ${step.id}',
                      style: AppTextStyles.liberationMono.textStyle10BoldGrey500Spacing1.copyWith(
                        color: isDone || isActive ? AppColors.grey500Color : AppColors.grey400,
                      ),
                    ),
                    const SizedBox(height: Sizes.height2),
                    Text(
                      step.name,
                      style: AppTextStyles.inter.style(
                        fontSize: Sizes.textSize14,
                        fontWeight: FontWeight.bold,
                        color: isDone || isActive ? AppColors.textPrimary : AppColors.grey400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              topRightStatus,
            ],
          ),
          
          const SizedBox(height: Sizes.height12),
          
          // Badges Row
          Opacity(
            opacity: isDone || isActive ? 1.0 : 0.4,
            child: Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.padding6,
                    vertical: Sizes.padding2,
                  ),
                  decoration: AppDecorations.offlineCtrlTag(),
                  child: Text(
                    '${step.ctrlPoints} CTRL PTS',
                    style: AppTextStyles.liberationMono.textStyle10BoldGrey600Spacing05.copyWith(
                      color: AppColors.textHeader,
                    ),
                  ),
                ),
                if (step.hasKakotora) ...<Widget>[
                  const SizedBox(width: Sizes.width6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.padding6,
                      vertical: Sizes.padding2,
                    ),
                    decoration: AppDecorations.offlineKakoTag(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(
                          Icons.star,
                          size: Sizes.iconSize10,
                          color: AppColors.danger,
                        ),
                        const SizedBox(width: Sizes.width2),
                        Text(
                          'KAKO',
                          style: AppTextStyles.liberationMono.textStyle8BoldRed.copyWith(
                            color: AppColors.danger,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (step.isLive) ...<Widget>[
                  const SizedBox(width: Sizes.width6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.padding6,
                      vertical: Sizes.padding2,
                    ),
                    decoration: AppDecorations.offlineLiveTag(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(
                          Icons.circle,
                          size: Sizes.iconSize8,
                          color: AppColors.stageLiveGreen,
                        ),
                        const SizedBox(width: Sizes.width4),
                        Text(
                          'LIVE',
                          style: AppTextStyles.liberationMono.textStyle10BoldGreen,
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          const SizedBox(height: Sizes.height12),

          // Metadata row (Assignee and Spec info)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                step.assigneeTime,
                style: AppTextStyles.liberationMono.textStyle12RegularGrey600.copyWith(
                  color: isDone || isActive ? Colors.grey[600] : AppColors.grey400,
                ),
              ),
              Text(
                step.specInfo,
                style: AppTextStyles.liberationMono.textStyle12BoldBlackSpacing.copyWith(
                  color: isDone || isActive ? AppColors.textPrimary : AppColors.grey400,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Bottom Action Button
          SizedBox(
            width: double.infinity,
            child: _buildCardActionButton(context, loc, step),
          ),
        ],
      ),
    );
  }

  Widget _buildCardActionButton(
    BuildContext context,
    AppLocalizations loc,
    OfflineStepData step,
  )
  {
    if (step.status == 'done') {
      return OutlinedButton(
        onPressed: () {},
        style: AppDecorations.offlineCompletedStepButton(),
        child: Text(
          loc.viewEntries,
          style: AppTextStyles.inter.style(
            fontSize: Sizes.textSize12,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      );
    } else if (step.status == 'active') {
      return ElevatedButton(
        onPressed: () {
          final DetailedStage detailedStage = workOrder.detailedStages.firstWhere(
            (DetailedStage s) => s.id == '05',
            orElse: () => workOrder.detailedStages.first,
          );
          context.push(
            RouteNames.stageSetupScreen,
            extra: <String, Object>{'workOrder': workOrder, 'stage': detailedStage},
          );
        },
        style: AppDecorations.offlineActiveStepButton(),
        child: Text(
          loc.continueButton,
          style: AppTextStyles.inter.style(
            fontSize: Sizes.textSize12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: null, // Disabled
        style: AppDecorations.offlineLockedStepButton(),
        child: Text(
          loc.locked,
          style: AppTextStyles.inter.style(
            fontSize: Sizes.textSize12,
            fontWeight: FontWeight.bold,
            color: AppColors.grey400,
          ),
        ),
      );
    }
  }

  Widget _buildFooterSection(BuildContext context, AppLocalizations loc) {
    return Container(
      padding: const EdgeInsets.only(top: Sizes.padding16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Left informational rich text
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.inter.style(
                  fontSize: Sizes.textSize12,
                  color: AppColors.textPrimary,
                  height: 1.4,
                ),
                children: const <TextSpan>[
                  TextSpan(text: 'When all 9 offline done: '),
                  TextSpan(
                    text: 'scan pallet → kit ready → online assembly ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: 'activates.'),
                ],
              ),
            ),
          ),

          // Action Buttons
          OutlinedButton(
            onPressed: () {},
            style: AppDecorations.offlineFooterBreakdownButton(),
            child: Text(
              loc.raiseBreakdown,
              style: AppTextStyles.inter.style(
                fontSize: Sizes.textSize12,
                fontWeight: FontWeight.bold,
                color: AppColors.redColor,
              ),
            ),
          ),
          const SizedBox(width: Sizes.width12),
          OutlinedButton(
            onPressed: () {},
            style: AppDecorations.offlineFooterPrintButton(),
            child: Text(
              loc.printProcessTag,
              style: AppTextStyles.inter.style(
                fontSize: Sizes.textSize12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
