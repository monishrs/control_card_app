import 'package:control_card_prototype/common_lib.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:control_card_prototype/core/widgets/qr_code_view.dart';

/// class to represent the QR scan screen
class QrScanScreen extends StatefulWidget {

  /// constructor for the QR scan screen
  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  bool _isCameraGranted = false;
  late final MobileScannerController _scannerController;


  @override
  void initState() {
    super.initState();
    _scannerController = MobileScannerController(
      formats: const <BarcodeFormat>[BarcodeFormat.qrCode],
    );

    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    final PermissionStatus status = await Permission.camera.request();
    if (status.isGranted) {
      if (mounted) {
        setState(() {
          _isCameraGranted = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.surfaceBg, body: mainWidget());
  }

  Widget mainWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(Sizes.padding24),
            color: AppColors.surfaceBg,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'STAGE 04 - CRIMPING END A - WO-2025-0381',
                            style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1,
                          ),
                          const SizedBox(height: Sizes.padding4),
                          Text(
                            AppLocalizations.of(context)!.scanOperatorBadge,
                            style: AppTextStyles.inter.textStyle28BoldBlack87,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.padding12,
                        vertical: Sizes.padding6,
                      ),
                      decoration: AppDecorations.statusBadge(
                        color: AppColors.warning,
                        radius: Sizes.radius0,
                      ),
                      child: Text('STEP 1 / 3', style: AppTextStyles.inter.textStyle12BoldWhite),
                    ),
                  ],
                ),
                const Spacer(),
                QrCodeView(
                  isCameraGranted: _isCameraGranted,
                  scannerController: _scannerController,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.holdQrInsideFrame,
                      style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1,
                    ),
                    Row(
                      children: <Widget>[
                        OutlinedButton(
                          onPressed: () {},
                          style: AppDecorations.badgeFallbackButton().copyWith(
                            side: WidgetStateProperty.all(
                              const BorderSide(color: AppColors.greyBorder),
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.enterManually,
                            style: AppTextStyles.inter.textStyle12BoldBlack87,
                          ),
                        ),
                        const SizedBox(width: Sizes.padding8),
                        OutlinedButton(
                          onPressed: () {},
                          style: AppDecorations.badgeFallbackButton().copyWith(
                            side: WidgetStateProperty.all(
                              const BorderSide(color: AppColors.greyBorder),
                            ),
                          ),
                          child: Text(AppLocalizations.of(context)!.torch, style: AppTextStyles.inter.textStyle12BoldBlack87),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(width: Sizes.width1, color: AppColors.greyBorder),

        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(Sizes.padding32),
            color: AppColors.colorWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.stageSetupChecklist,
                  style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1,
                ),
                const SizedBox(height: Sizes.padding16),

                Container(
                  padding: const EdgeInsets.all(Sizes.padding16),
                  decoration: AppDecorations.outline(
                    borderColor: AppColors.successBorder,
                    radius: Sizes.radius12,
                    color: AppColors.successLight.withValues(alpha: 0.2),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: Sizes.iconSize32,
                        height: Sizes.iconSize32,
                        decoration: AppDecorations.stepCircle(
                          color: AppColors.successLight,
                          borderColor: AppColors.successBorder,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: Sizes.iconSize16,
                          color: AppColors.success,
                        ),
                      ),
                      const SizedBox(width: Sizes.padding12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '1. OPERATOR - DETECTED',
                              style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1,
                            ),
                            const SizedBox(height: Sizes.padding4),
                            Text('Karthik Iyer', style: AppTextStyles.inter.textStyle14BoldBlack87),
                            const SizedBox(height: Sizes.padding2),
                            Text(
                              'EMP-04217 - Crimping - certified',
                              style: AppTextStyles.inter.textStyle11RegularGrey500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Sizes.padding12),
                Container(
                  padding: const EdgeInsets.all(Sizes.padding16),
                  decoration: AppDecorations.outline(
                    borderColor: AppColors.greyBorder,
                    radius: Sizes.radius12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: Sizes.iconSize32,
                        height: Sizes.iconSize32,
                        decoration: AppDecorations.stepCircle(color: AppColors.greyBorder),
                        alignment: Alignment.center,
                        child: Text('2', style: AppTextStyles.inter.textStyle14BoldBlack87),
                      ),
                      const SizedBox(width: Sizes.padding12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '2. MACHINE - SCANNING',
                              style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1,
                            ),
                            const SizedBox(height: Sizes.padding4),
                            Text(
                              'Scan CRM-03 QR',
                              style: AppTextStyles.inter.textStyle14BoldBlack87,
                            ),
                            const SizedBox(height: Sizes.padding2),
                            Text(
                              'Spec: Crimping machine, CRM series',
                              style: AppTextStyles.inter.textStyle11RegularGrey500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Sizes.padding12),
                Container(
                  padding: const EdgeInsets.all(Sizes.padding16),
                  decoration: AppDecorations.dashedOutline(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: Sizes.iconSize32,
                        height: Sizes.iconSize32,
                        decoration: AppDecorations.stepCircle(borderColor: AppColors.greyBorder),
                        alignment: Alignment.center,
                        child: Text('3', style: AppTextStyles.inter.textStyle14BoldGrey),
                      ),
                      const SizedBox(width: Sizes.padding12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '3. JIG - WAITING',
                              style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1,
                            ),
                            const SizedBox(height: Sizes.padding4),
                            Text(
                              'Scan jig CJ-2207',
                              style: AppTextStyles.inter.textStyle14BoldBlack87,
                            ),
                            const SizedBox(height: Sizes.padding2),
                            Text(
                              'Defined by tooling master',
                              style: AppTextStyles.inter.textStyle11RegularGrey500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(Sizes.padding20),
                  decoration: AppDecorations.outline(
                    borderColor: AppColors.greyBorder,
                    radius: Sizes.radius12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'WORK ORDER CONTEXT',
                        style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1,
                      ),
                      const SizedBox(height: Sizes.padding20),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'WO',
                                  style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1,
                                ),
                                const SizedBox(height: Sizes.padding4),
                                Text(
                                  'WO-2025-0381',
                                  style: AppTextStyles.inter.textStyle12BoldBlack87,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'LOT',
                                  style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1,
                                ),
                                const SizedBox(height: Sizes.padding4),
                                Text('6N105', style: AppTextStyles.inter.textStyle12BoldBlack87),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Sizes.padding16),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'PART',
                                  style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1,
                                ),
                                const SizedBox(height: Sizes.padding4),
                                Text('BHF-RH', style: AppTextStyles.inter.textStyle12BoldBlack87),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'STAGE',
                                  style: AppTextStyles.inter.textStyle10BoldGrey500Spacing1,
                                ),
                                const SizedBox(height: Sizes.padding4),
                                Text('04 / 09', style: AppTextStyles.inter.textStyle12BoldBlack87),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
