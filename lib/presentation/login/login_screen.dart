import 'package:control_card_prototype/common_lib.dart';
import 'package:control_card_prototype/core/utils/dotted_border.dart';
import 'package:control_card_prototype/core/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

/// class to represent Login screen
class LoginScreen extends StatefulWidget {
  /// constructor for LoginScreen
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool showManualSignIn = false;
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  Future<void> _handleQrScannerTap() async {
    final PermissionStatus status = await Permission.camera.request();
    if (status.isGranted) {
      final ImagePicker picker = ImagePicker();
      try {
        await picker.pickImage(source: ImageSource.camera);
      } catch (e) {
        debugPrint('Camera error: $e');
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Camera permission is required to scan badges.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: mainWidget()));
  }

  Widget mainWidget() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.padding24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              controlCardWidget(),
              const SizedBox(width: Sizes.width20),
              SizedBox(
                width: getMaxWidth(context) * 0.4,
                child: signInCardWidget(),
              ),
              const SizedBox(width: Sizes.width20),
              Expanded(child: _rightPanelWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Widget controlCardWidget() {
    return SizedBox(
      width: getMaxWidth(context) * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: Sizes.height80,
                width: Sizes.width80,
                decoration: AppDecorations.controlCardLogo(),
                child: Center(
                  child: Text(
                    'CC',
                    style: AppTextStyles.inter.textStyle30BoldWhite,
                  ),
                ),
              ),
              const SizedBox(width: Sizes.width20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.controlCard,
                    style: AppTextStyles.inter.textStyle20Black,
                  ),
                  Text(
                    '${AppLocalizations.of(context)!.brakeHoseQc}  v2.4.1',
                    style: AppTextStyles.inter.textStyle12grey,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: Sizes.height20),
          Text(
            AppLocalizations.of(context)!.signInToStartYourShift,
            style: AppTextStyles.inter.textStyle40,
          ),
          const SizedBox(height: Sizes.height20),
          Text(
            AppLocalizations.of(context)!.tapQROrEnterEmployeeID,
            style: AppTextStyles.inter.textStyle14grey,
          ),
          const SizedBox(height: Sizes.height30),
          infoTableWidget(),
        ],
      ),
    );
  }

  Widget infoTableWidget() {
    return Column(
      children: <Widget>[
        _infoRow('STATION', 'TBL-03'),
        _infoRow('LINE', 'Yamato · Line 03'),
        _infoRow('PRODUCT', 'Brake Hose Assembly'),
        _infoRow('SHIFT', 'A · 08:00–16:30'),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.padding12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(label, style: AppTextStyles.inter.textStyle12greyLS1_2),
              Text(value, style: AppTextStyles.inter.textStyle14black),
            ],
          ),
        ),
        const Divider(
          thickness: Sizes.width1,
          color: AppColors.greyBorder,
          height: Sizes.height1,
        ),
      ],
    );
  }

  Widget signInCardWidget() {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        decoration: AppDecorations.signInCard(),
        padding: const EdgeInsets.all(Sizes.padding24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _cardHeader(),
            const SizedBox(height: Sizes.height20),
            _qrScannerArea(),
            const SizedBox(height: Sizes.height16),
            _lastScanBanner(),
            const SizedBox(height: Sizes.height20),
            _badgeFallbackRow(),
            if (showManualSignIn) ...<Widget>[
              const SizedBox(height: Sizes.height20),
              TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.userId,
                  hintStyle: AppTextStyles.inter.textStyle14grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.radius8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: Sizes.padding16,
                    vertical: Sizes.padding12,
                  ),
                ),
              ),
              const SizedBox(height: Sizes.height16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.password,
                  hintStyle: AppTextStyles.inter.textStyle14grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.radius8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: Sizes.padding16,
                    vertical: Sizes.padding12,
                  ),
                ),
              ),
              const SizedBox(height: Sizes.height16),
              AppButton(
                label: AppLocalizations.of(context)!.signIn,
                onPressed: () {
                  context.go(RouteNames.workDetailsScreen);
                },
                size: BtnSize.lg,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _cardHeader() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${AppLocalizations.of(context)!.signInBold} · STATION TBL-03',
              style: AppTextStyles.inter.textStyle11greyLS1_2,
            ),
            StreamBuilder<dynamic>(
              stream: Stream<dynamic>.periodic(const Duration(seconds: 1)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                final DateTime now = DateTime.now();
                final String timeStr = formatTimeHHmm(now);
                final String dateStr = formatDateDDMMMYY(now);
                return Text(
                  '$timeStr · $dateStr',
                  style: AppTextStyles.inter.textStyle11greyLS1_2,
                );
              },
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  Widget _qrScannerArea() {
    return CustomPaint(
      painter: DottedBorder(
        color: AppColors.newRollDarkBg,
        strokeWidth: Sizes.width4,
        gap: Sizes.width6,
        radius: Sizes.padding16,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.padding32,
          horizontal: Sizes.padding16,
        ),
        decoration: AppDecorations.qrScannerBg(),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: _handleQrScannerTap,
              child: AnimatedBuilder(
                animation: _bounceAnimation,
                builder: (BuildContext context, Widget? child) {
                  return Transform.scale(
                    scale: _bounceAnimation.value,
                    child: child,
                  );
                },
                child: Container(
                  width: Sizes.width100,
                  height: Sizes.height100,
                  decoration: AppDecorations.qrScannerIconBg(),
                  child: const Icon(
                    Icons.qr_code,
                    color: AppColors.newRollDarkBg,
                    size: Sizes.size40,
                  ),
                ),
              ),
            ),
            const SizedBox(height: Sizes.height16),
            Text(
              AppLocalizations.of(context)!.tapYourBadge,
              style: AppTextStyles.inter.textStyle18darkBlue,
            ),
            const SizedBox(height: Sizes.height6),
            Text(
              AppLocalizations.of(context)!.holdQRCode,
              textAlign: TextAlign.center,
              style: AppTextStyles.inter.textStyle11greyLS1_2,
            ),
            const SizedBox(height: Sizes.height14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: Sizes.radius4,
                  backgroundColor: AppColors.newRollDarkBg,
                ),
                const SizedBox(width: Sizes.width6),
                Text(
                  AppLocalizations.of(context)!.readyWaitingForScan,
                  style: AppTextStyles.inter.textStyle14darkBlue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _badgeFallbackRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.badgeNotWorking,
          style: AppTextStyles.inter.textStyle12grey,
        ),
        OutlinedButton(
          onPressed: () {
            setState(() {
              showManualSignIn = !showManualSignIn;
            });
          },
          style: AppDecorations.badgeFallbackButton(),
          child: Text(
            AppLocalizations.of(context)!.typeEmployeeIDInstead,
            style: AppTextStyles.inter.textStyle12black,
          ),
        ),
      ],
    );
  }

  Widget _lastScanBanner() {
    return Container(
      decoration: AppDecorations.loggedInCard(),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding16,
        vertical: Sizes.padding12,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: Sizes.width40,
            height: Sizes.height40,
            decoration: AppDecorations.loginAvatarCircle(),
            child: Center(
              child: Text(
                'PP',
                style: AppTextStyles.inter.textStyle14black.copyWith(
                  color: AppColors.darkGreenColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: Sizes.width12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'LAST SCAN · 8 SEC AGO',
                  style: AppTextStyles.inter.textStyle11greyLS1_2,
                ),
                const SizedBox(height: Sizes.height4),
                Text(
                  'Peter Parker · Crimping',
                  style: AppTextStyles.inter.textStyle14black,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.padding8,
              vertical: Sizes.padding4,
            ),
            decoration: AppDecorations.loginEmployeeIdBadge(),
            child: Text(
              'EMP-04217',
              style: AppTextStyles.inter.textStyle12white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _rightPanelWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'STATION ROSTER · TODAY',
          style: AppTextStyles.inter.textStyle11greyLS1_2,
        ),
        const SizedBox(height: Sizes.height16),
        _rosterCard('Tony Stark', 'TL', '07:58', AppColors.success),
        const SizedBox(height: Sizes.height8),
        _rosterCard('Steve Roger', 'OP · Bending', '08:02', AppColors.success),
        const SizedBox(height: Sizes.height8),
        _rosterCard('Thor Odin', 'OP · Protector', '08:04', AppColors.success),
        const SizedBox(height: Sizes.height8),
        _rosterCard(
          'Peter Parker',
          'OP · Crimping',
          '—',
          AppColors.textSecondary,
          isYou: true,
        ),
        const SizedBox(height: Sizes.height8),
        _rosterCard('Stephen Strange', 'QC', '08:35', AppColors.success),
        const SizedBox(height: Sizes.height8),
        _rosterCard('Bruce Banner', 'Approver', '—', AppColors.textSecondary),
        const SizedBox(height: Sizes.height24),
        Container(
          padding: const EdgeInsets.all(Sizes.padding16),
          decoration: AppDecorations.loginSystemInfoContainer(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('SYSTEM', style: AppTextStyles.inter.textStyle11greyLS1_2),
              const SizedBox(height: Sizes.height12),
              _systemRow('SAP·HANA', 'SYNCED 08:30', AppColors.success),
              const SizedBox(height: Sizes.height8),
              _systemRow('Vernier WiFi', 'PAIRED', AppColors.success),
              const SizedBox(height: Sizes.height8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Master rev14',
                    style: AppTextStyles.inter.textStyle12grey,
                  ),
                  Text(
                    '28-APR-26',
                    style: AppTextStyles.inter.textStyle12black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _rosterCard(
    String name,
    String role,
    String time,
    Color dotColor, {
    bool isYou = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(Sizes.padding12),
      decoration: AppDecorations.loginRosterCard(isYou: isYou),
      child: Row(
        children: <Widget>[
          CircleAvatar(radius: Sizes.radius4, backgroundColor: dotColor),
          const SizedBox(width: Sizes.width12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(name, style: AppTextStyles.inter.textStyle14black),
                    if (isYou) ...<Widget>[
                      const SizedBox(width: Sizes.width4),
                      Text(
                        '(YOU)',
                        style: AppTextStyles.inter.textStyle12grey.copyWith(
                          color: AppColors.info,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
                Text(role, style: AppTextStyles.inter.textStyle12grey),
              ],
            ),
          ),
          Text(time, style: AppTextStyles.inter.textStyle12grey),
        ],
      ),
    );
  }

  Widget _systemRow(String label, String status, Color dotColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(label, style: AppTextStyles.inter.textStyle12grey),
        Row(
          children: <Widget>[
            CircleAvatar(radius: Sizes.radius4, backgroundColor: dotColor),
            const SizedBox(width: Sizes.width6),
            Text(
              status,
              style: AppTextStyles.inter.textStyle12black.copyWith(
                color: dotColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
