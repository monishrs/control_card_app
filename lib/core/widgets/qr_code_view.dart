import 'package:control_card_prototype/common_lib.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:control_card_prototype/core/utils/utils.dart';

/// widget for the QR code view
class QrCodeView extends StatefulWidget {

  /// constructor for the QR code view
  const QrCodeView({
    super.key,
    required this.isCameraGranted,
    required this.scannerController,
  });

  /// is camera permission granted
  final bool isCameraGranted;

  /// scanner controller
  final MobileScannerController scannerController;

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: Sizes.width300 - Sizes.size24).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: Sizes.width300,
            height: Sizes.width300,
            decoration: AppDecorations.qrScannerContainer(),
            child: widget.isCameraGranted
                ? MobileScanner(
                    controller: widget.scannerController,
                    onDetect: (BarcodeCapture capture) {},
                  )
                : const GridPaper(
                    color: AppColors.lightGrey,
                    interval: Sizes.size20,
                    subdivisions: 1,
                  ),
          ),
          if (!widget.isCameraGranted) const Icon(Icons.qr_code_2, size: Sizes.size200),
          Positioned(
            top: -Sizes.padding2,
            left: -Sizes.padding2,
            child: Container(
              width: Sizes.size40,
              height: Sizes.size40,
              decoration: AppDecorations.qrCornerBracket(top: true, left: true),
            ),
          ),
          Positioned(
            top: -Sizes.padding2,
            right: -Sizes.padding2,
            child: Container(
              width: Sizes.size40,
              height: Sizes.size40,
              decoration: AppDecorations.qrCornerBracket(top: true, right: true),
            ),
          ),
          Positioned(
            bottom: -Sizes.padding2,
            left: -Sizes.padding2,
            child: Container(
              width: Sizes.size40,
              height: Sizes.size40,
              decoration: AppDecorations.qrCornerBracket(bottom: true, left: true),
            ),
          ),
          Positioned(
            bottom: -Sizes.padding2,
            right: -Sizes.padding2,
            child: Container(
              width: Sizes.size40,
              height: Sizes.size40,
              decoration: AppDecorations.qrCornerBracket(bottom: true, right: true),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget? child) {
              return Positioned(
                top: _animation.value,
                child: child!,
              );
            },
            child: Container(
              width: Sizes.width300,
              height: Sizes.size24,
              color: AppColors.success.withValues(alpha: 0.6),
              alignment: Alignment.center,
              child: Container(
                width: getMaxWidth(context),
                height: Sizes.height2,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
