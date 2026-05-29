import 'package:control_card_prototype/common_lib.dart';

/// A utility class for managing reusable text styles
/// with different font families across the application.
class AppTextStyles {
  /// Private constructor to restrict direct instantiation
  /// and ensure predefined font styles are used.
  const AppTextStyles._(this.family);

  /// Holds the font family name.
  final String family;

  // ──────────────────────────────────────────
  // Predefined Font Families
  // ──────────────────────────────────────────

  /// Inter font family style.
  static AppTextStyles inter = AppTextStyles._(AppFont.inter.family);

  /// JetBrains Mono font family style.
  static AppTextStyles jetBrainsMono = AppTextStyles._(
    AppFont.jetBrainsMono.family,
  );

  /// JetBrains Mono font family style.
  static AppTextStyles liberationMono = AppTextStyles._(
    AppFont.liberian.family,
  );

  /// Hanken Grotesk font family style.
  static AppTextStyles hankenGrotesk = AppTextStyles._(
    AppFont.hankenGrotesk.family,
  );

  // ──────────────────────────────────────────
  // Font Weight Styles
  // ──────────────────────────────────────────

  /// Returns a custom TextStyle with the bound font family.
  TextStyle style({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  /// Returns a light weight text style (FontWeight.w300).
  TextStyle get light =>
      TextStyle(fontFamily: family, fontWeight: FontWeight.w300);

  // ──────────────────────────────────────────
  // Design System Typography Getters
  // ──────────────────────────────────────────

  // Size 8
  /// Text style for textStyle8BoldGrey500Spacing1.
  TextStyle get textStyle8BoldGrey500Spacing1 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize8,
    fontWeight: FontWeight.bold,
    color: Colors.grey[500],
    letterSpacing: 1.0,
  );
  /// Text style for textStyle8BoldPink.
  TextStyle get textStyle8BoldPink => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize8,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFF48FB1),
  );
  /// Text style for textStyle8BoldGreen.
  TextStyle get textStyle8BoldGreen => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize8,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1E8E3E),
  );
  /// Text style for textStyle8BoldRed.
  TextStyle get textStyle8BoldRed => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize8,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFD32F2F),
  );

  // Size 10
  /// Text style for textStyle10BoldWhite.
  TextStyle get textStyle10BoldWhite => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  /// Text style for textStyle10BoldWhiteSpacing05.
  TextStyle get textStyle10BoldWhiteSpacing05 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.5,
  );
  /// Text style for textStyle10BoldGrey500Spacing05.
  TextStyle get textStyle10BoldGrey500Spacing05 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
    color: Colors.grey[500],
    letterSpacing: 0.5,
  );
  /// Text style for textStyle10BoldGrey500Spacing1.
  TextStyle get textStyle10BoldGrey500Spacing1 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
    color: Colors.grey[500],
    letterSpacing: 1.0,
  );
  /// Text style for textStyle10BoldGrey600Spacing05.
  TextStyle get textStyle10BoldGrey600Spacing05 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
    color: Colors.grey[600],
    letterSpacing: 0.5,
  );
  /// Text style for textStyle10BoldGrey600Spacing1.
  TextStyle get textStyle10BoldGrey600Spacing1 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
    color: Colors.grey[600],
    letterSpacing: 1.0,
  );
  /// Text style for textStyle10BoldBlueDark.
  TextStyle get textStyle10BoldBlueDark => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1F3A5F),
  );
  /// Text style for textStyle10BoldBlue.
  TextStyle get textStyle10BoldBlue => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1565C0),
  );
  /// Text style for textStyle10BoldGrey600.
  TextStyle get textStyle10BoldGrey600 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
    color: Colors.grey[600],
  );
  /// Text style for textStyle10BoldGrey500.
  TextStyle get textStyle10BoldGrey500 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
    color: Colors.grey[500],
  );
  /// Text style for textStyle10BoldGreen.
  TextStyle get textStyle10BoldGreen => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1E8E3E),
  );
  /// Text style for textStyle10BoldRed.
  TextStyle get textStyle10BoldRed => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFD32F2F),
  );
  /// Text style for textStyle10Bold.
  TextStyle get textStyle10Bold => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    fontWeight: FontWeight.bold,
  );
  /// Text style for textStyle10RegularGrey500.
  TextStyle get textStyle10RegularGrey500 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    color: Colors.grey[500],
  );
  /// Text style for textStyle10RegularGrey500Spacing05.
  TextStyle get textStyle10RegularGrey500Spacing05 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    color: Colors.grey[500],
    letterSpacing: 0.5,
  );
  /// Text style for textStyle10RegularGrey600.
  TextStyle get textStyle10RegularGrey600 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize10,
    color: Colors.grey[600],
  );

  // Size 11
  /// Text style for textStyle11RegularGrey500.
  TextStyle get textStyle11RegularGrey500 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize11,
    color: Colors.grey[500],
  );
  /// Text style for textStyle11RegularGrey600.
  TextStyle get textStyle11RegularGrey600 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize11,
    color: Colors.grey[600],
  );
  /// Text style for textStyle11BoldGreen.
  TextStyle get textStyle11BoldGreen => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize11,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1E8E3E),
  );
  /// Text style for textStyle11BoldOrange.
  TextStyle get textStyle11BoldOrange => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize11,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFD97706),
  );
  /// Text style for textStyle11Bold.
  TextStyle get textStyle11Bold => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize11,
    fontWeight: FontWeight.bold,
  );

  // Size 12
  /// Text style for textStyle12Bold.
  TextStyle get textStyle12Bold => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.bold,
  );
  /// Text style for textStyle12BoldBlack87.
  TextStyle get textStyle12BoldBlack87 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );
  /// Text style for textStyle12BoldWhite.
  TextStyle get textStyle12BoldWhite => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  /// Text style for textStyle12BoldRed.
  TextStyle get textStyle12BoldRed => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFD32F2F),
  );
  /// Text style for textStyle12w600Black87.
  TextStyle get textStyle12w600Black87 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );
  TextStyle get textStyle12BoldGrey500 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.bold,
    color: Colors.grey[500],
  );
  /// Text style for textStyle12BoldGrey500Spacing1.
  TextStyle get textStyle12BoldGrey500Spacing1 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.bold,
    color: Colors.grey[500],
    letterSpacing: 1.0,
  );
  /// Text style for textStyle12BoldGrey600Spacing1.
  TextStyle get textStyle12BoldGrey600Spacing1 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.bold,
    color: Colors.grey[600],
    letterSpacing: 1.0,
  );
  /// Text style for textStyle12BoldGrey600Spacing12.
  TextStyle get textStyle12BoldGrey600Spacing12 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.w600,
    color: Colors.grey[600],
    letterSpacing: 1.2,
  );
  /// Text style for textStyle12BoldGreen.
  TextStyle get textStyle12BoldGreen => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1E8E3E),
  );
  /// Text style for textStyle12RegularGrey500.
  TextStyle get textStyle12RegularGrey500 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    color: Colors.grey[500],
  );
  /// Text style for textStyle12RegularGrey600.
  TextStyle get textStyle12RegularTextAlert => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    color: AppColors.textAlert,
  );
  TextStyle get textStyle12BoldDanger => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    color: AppColors.danger,
    fontWeight: FontWeight.bold,
  );
  TextStyle get textStyle12RegularGrey600 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    color: Colors.grey[600],
  );
  /// Text style for textStyle12BoldGrey600Spacing1Raw.
  TextStyle get textStyle12BoldGrey600Spacing1Raw => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.w600,
    color: Colors.grey[600],
    letterSpacing: 1.0,
  );
  /// Text style for textStyle12BoldBlackSpacing01.
  TextStyle get textStyle12BoldBlackSpacing01 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
    letterSpacing: 0.1,
  );

  // Size 13
  /// Text style for textStyle13BoldBlack87.
  TextStyle get textStyle13BoldBlack87 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize13,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );
  /// Text style for textStyle13w600Black87.
  TextStyle get textStyle13w600Black87 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize13,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  // Size 14
  /// Text style for textStyle14Bold.
  TextStyle get textStyle14Bold => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize14,
    fontWeight: FontWeight.bold,
  );
  /// Text style for textStyle14BoldBlack87.
  TextStyle get textStyle14BoldBlack87 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize14,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );
  /// Text style for textStyle14BoldGreen.
  TextStyle get textStyle14BoldGreen => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize14,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1E8E3E),
  );
  /// Text style for textStyle14BoldGrey.
  TextStyle get textStyle14BoldGrey => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize14,
    fontWeight: FontWeight.bold,
    color: Colors.grey[500],
  );
  /// Text style for textStyle14w600.
  TextStyle get textStyle14w600 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize14,
    fontWeight: FontWeight.w600,
  );

  // Size 12
  TextStyle get textStyle12RegularBlack87 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize12,
    color: Colors.black87,
  );

  // Size 14
  TextStyle get textStyle14RegularBlack87 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize14,
    color: Colors.black87,
  );
  TextStyle get textStyle14RegularGrey500 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize14,
    color: Colors.grey[500],
  );
  TextStyle get textStyle14BoldRed => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize14,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFD32F2F),
  );

  // Size 16
  TextStyle get textStyle16BoldBlack87 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize16,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );
  TextStyle get textStyle16BoldRed => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize16,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFD32F2F),
  );
  TextStyle get textStyle16BoldGreen => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize16,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1E8E3E),
  );

  // Size 24
  TextStyle get textStyle24BoldGreen => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize24,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1E8E3E),
  );
  TextStyle get textStyle24BoldRed => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize24,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFD32F2F),
  );

  // Size 32
  TextStyle get textStyle32BoldBlack87 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize32,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  // Size 48
  TextStyle get textStyle48BoldGreen => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize48,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1E8E3E),
  );

  // Restored Sizes (18, 20, 24, 28)
  // Size 18
  /// Text style for textStyle18Bold.
  TextStyle get textStyle18Bold => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize18,
    fontWeight: FontWeight.bold,
  );

  // Size 20
  /// Text style for textStyle20BoldBlack87.
  TextStyle get textStyle20BoldBlack87 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize20,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );
  /// Text style for textStyle20BoldGreen.
  TextStyle get textStyle20BoldGreen => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize20,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1E8E3E),
  );
  /// Text style for textStyle20BoldRed.
  TextStyle get textStyle20BoldRed => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize20,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFD32F2F),
  );

  // Size 24
  /// Text style for textStyle24Bold.
  TextStyle get textStyle24Bold => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize24,
    fontWeight: FontWeight.bold,
  );
  /// Text style for textStyle24BoldBlack87.
  TextStyle get textStyle24BoldBlack87 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize24,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  // Size 28
  /// Text style for textStyle28Bold.
  TextStyle get textStyle28Bold => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize28,
    fontWeight: FontWeight.bold,
  );
  /// Text style for textStyle28BoldBlack87.
  TextStyle get textStyle28BoldBlack87 => TextStyle(
    fontFamily: family,
    fontSize: Sizes.textSize28,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );



  // Legacy Getters (kept for backwards compatibility)
  /// Text style for textStyle10w500SecondaryLS1.
  TextStyle get textStyle10w500SecondaryLS1 => TextStyle(
    fontFamily: family,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 1.0,
  );
  /// Text style for textStyle11greyLS1_2.
  TextStyle get textStyle11greyLS1_2 => TextStyle(
    fontFamily: family,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 1.2,
  );
  /// Text style for textStyle14BoldWhite.
  TextStyle get textStyle14BoldWhite => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
    fontSize: Sizes.textSize14,
  );
  /// Text style for textStyle11BoldWhite.
  TextStyle get textStyle11BoldWhite => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
    fontSize: Sizes.textSize11,
  );
  /// Text style for textStyle14BoldTextHeader.
  TextStyle get textStyle14BoldTextHeader => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.textHeader,
    fontSize: Sizes.textSize14,
  );
  /// Text style for textStyle14BoldGreyLegacy.
  TextStyle get textStyle14BoldGreyLegacy => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontSize: Sizes.textSize14,
  );
  /// Text style for textStyle12RegularGrey41Spacing.
  TextStyle get textStyle12RegularGrey41Spacing => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w400,
    color: AppColors.grey41,
    fontSize: Sizes.textSize14,
    letterSpacing: Sizes.textSpacing02,
  );
  /// Text style for textStyle11RegularGrey41.
  TextStyle get textStyle11RegularGrey41 => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w400,
    color: AppColors.grey41,
    fontSize: Sizes.textSize11,
  );
  /// Text style for textStyle12BoldBlackSpacing.
  TextStyle get textStyle12BoldBlackSpacing => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: Sizes.textSize14,
    letterSpacing: Sizes.textSpacing01,
  );
  /// Text style for textStyle11BoldBlackSpacing.
  TextStyle get textStyle11BoldBlackSpacing => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: Sizes.textSize11,
  );

  // ── BOM Page Styles ──────────────────────────────────────────

  /// Typography style for the main titles in the BOM page (e.g. WO numbers).
  TextStyle get bomHeaderTitle => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontSize: Sizes.textSize20,
  );

  /// Typography style for labels in the BOM page (e.g. 'PART', 'ASSY LOT').
  TextStyle get bomLabelText => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    fontSize: Sizes.textSize10,
    letterSpacing: 1.2,
  );

  /// Typography style for the values corresponding to labels in the BOM info card.
  TextStyle get bomValueText => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontSize: Sizes.textSize14,
  );

  /// Typography style for the table header columns in the BOM table.
  TextStyle get bomTableHead => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    fontSize: Sizes.textSize10,
    letterSpacing: 1.2,
  );

  /// Typography style for the main text in the BOM table rows.
  TextStyle get bomTableBodyMain => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontSize: Sizes.textSize13,
  );

  /// Typography style for the subtext (secondary info) in the BOM table rows.
  TextStyle get bomTableBodySub => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    fontSize: Sizes.textSize10,
  );

  /// Typography style for the large percentage text in the BOM right panel.
  TextStyle get bomProgressText => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontSize: Sizes.textSize24,
  );
  /// Text style for textStyle12black.
  TextStyle get textStyle12black => TextStyle(
    fontFamily: family,
    fontSize: 12,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );
  /// Text style for textStyle12white.
  TextStyle get textStyle12white => TextStyle(
    fontFamily: family,
    fontSize: 12,
    color: AppColors.colorWhite,
    fontWeight: FontWeight.w500,
  );
  /// Text style for textStyle12grey.
  TextStyle get textStyle12grey => TextStyle(
    fontFamily: family,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
  /// Text style for textStyle12greyLS1_2.
  TextStyle get textStyle12greyLS1_2 => TextStyle(
    fontFamily: family,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 1.2,
  );
  /// Text style for textStyle14grey.
  TextStyle get textStyle14grey =>
      TextStyle(fontFamily: family, fontSize: 14, color: AppColors.textAlert);
  /// Text style for textStyle14black.
  TextStyle get textStyle14black => TextStyle(
    fontFamily: family,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  /// Text style for textStyle14darkBlue.
  TextStyle get textStyle14darkBlue => TextStyle(
    fontFamily: family,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.newRollDarkBg,
  );
  /// Text style for textStyle18darkBlue.
  TextStyle get textStyle18darkBlue => TextStyle(
    fontFamily: family,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.newRollDarkBg,
  );
  /// Text style for textStyle20Black.
  TextStyle get textStyle20Black => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppColors.black,
  );
  /// Text style for textStyle30BoldWhite.
  TextStyle get textStyle30BoldWhite => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w600,
    fontSize: 30,
    color: AppColors.textWhite,
  );
  /// Text style for textStyle40.
  TextStyle get textStyle40 =>
      TextStyle(fontFamily: family, fontSize: 40, fontWeight: FontWeight.w600);
  /// Text style for textStyle12BoldWhiteLegacy.
  TextStyle get textStyle12BoldWhiteLegacy =>
      TextStyle(fontFamily: family, fontWeight: FontWeight.w300);

  // ── Pressure Test Page Styles ──────────────────────────────────────────

  /// Large green value text for pressure readings (e.g., "15.4")
  TextStyle get ptLargeValueGreen => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w800,
    color: AppColors.success,
    fontSize: Sizes.textSize48,
  );

  /// Large black value text for hold time (e.g., "28")
  TextStyle get ptLargeValueBlack => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w800,
    color: AppColors.black,
    fontSize: Sizes.textSize48,
  );

  /// Subscript/Unit text for large values (e.g., "MPa", "/ 36s")
  TextStyle get ptValueUnit => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    fontSize: Sizes.textSize14,
  );

  /// Label text for pressure test data points (e.g., "PRESSURE", "HOLD TIME")
  TextStyle get ptLabel => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    fontSize: Sizes.textSize10,
    letterSpacing: 1.2,
  );

  /// Label for the dark header (e.g., "MACHINE PT-02")
  TextStyle get ptDarkHeader => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w600,
    color: AppColors.colorWhite,
    fontSize: Sizes.textSize12,
    letterSpacing: 1.5,
  );

  /// Large tally values (e.g. "98")
  TextStyle get ptTallyValueBlack => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: 24,
  );

  /// Small table data text (e.g. "15.4 MPa")
  TextStyle get ptTableData => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: Sizes.textSize12,
  );

  // ── Final Inspection Page Styles ──────────────────────────────────────────

  /// Bold Header for cards (e.g., "Leakage confirmation marking")
  TextStyle get fiCardHeader => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: Sizes.textSize14,
  );

  /// Sub-text for cards (e.g., "Blue mark on any one fitting...")
  TextStyle get fiCardSub => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    fontSize: Sizes.textSize12,
  );

  /// Mono styled text for values (e.g., "25-105-0042")
  TextStyle get fiMonoValue => TextStyle(
    fontFamily: AppFont.jetBrainsMono.family,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: Sizes.textSize18,
  );

  /// Huge bundle number (e.g., "#1")
  TextStyle get fiBundleNumber => TextStyle(
    fontFamily: family,
    fontWeight: FontWeight.w800,
    color: AppColors.success,
    fontSize: 28,
  );

  /// Tag mockup typography (small mono)
  TextStyle get fiTagSmallMono => TextStyle(
    fontFamily: AppFont.jetBrainsMono.family,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontSize: Sizes.textSize8,
    letterSpacing: 2.0,
  );

  /// 14px bold black text style
  TextStyle get textStyle14BoldBlack {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }
}
