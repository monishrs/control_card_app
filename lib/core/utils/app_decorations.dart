import 'package:flutter/material.dart';
import 'package:control_card_prototype/core/utils/app_colors.dart';
import 'package:control_card_prototype/core/utils/sizes.dart';
import 'package:control_card_prototype/core/resources/app_text_styles.dart';

/// A class that houses reusable decorations (BoxDecorations, TextDecorations, Borders, etc.)
/// and integrates them with [Sizes] to eliminate hardcoded style values.
class AppDecorations {
  AppDecorations._();

  // ── Text Decorations ─────────────────────────

  /// Underline text decoration
  static const TextDecoration underline = TextDecoration.underline;

  /// Strikethrough text decoration
  static const TextDecoration lineThrough = TextDecoration.lineThrough;

  /// Overline text decoration
  static const TextDecoration overline = TextDecoration.overline;

  /// No text decoration
  static const TextDecoration none = TextDecoration.none;

  /// Helper to return a TextStyle with an underline decoration
  static TextStyle underlined(TextStyle base) =>
      base.copyWith(decoration: underline);

  /// Helper to return a TextStyle with a strikethrough decoration
  static TextStyle struckThrough(TextStyle base) =>
      base.copyWith(decoration: lineThrough);

  /// Helper to return a TextStyle with no decoration
  static TextStyle noDecoration(TextStyle base) =>
      base.copyWith(decoration: none);

  // ── Box Decorations ──────────────────────────

  /// Standard outline box decoration with customizable properties.
  static BoxDecoration outline({
    Color borderColor = AppColors.greyBorder,
    double borderWidth = Sizes.width05,
    double radius = Sizes.radius0,
    Color color = AppColors.colorWhite,
  }) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Decoration for status badge background
  static BoxDecoration statusBadge({
    required Color color,
    double radius = Sizes.radius100,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Decoration for segmented toggle background
  static BoxDecoration segmentedToggleBg({
    Color color = AppColors.neutralBg,
    Color borderColor = AppColors.greyBorder,
    double borderWidth = Sizes.width05,
    double radius = Sizes.radius9,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor, width: borderWidth),
    );
  }

  /// Decoration for segmented toggle active option
  static BoxDecoration segmentedToggleActive({
    required Color activeColor,
    double radius = Sizes.radius6,
  }) {
    return BoxDecoration(
      color: activeColor,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Decoration for pill group toggle container
  static BoxDecoration pillGroupBg({
    Color borderColor = AppColors.greyBorder,
    double borderWidth = Sizes.width05,
    double radius = Sizes.radius8,
  }) {
    return BoxDecoration(
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Decoration for active items in a pill group
  static BoxDecoration pillGroupActive({
    required bool isFirst,
    required bool isLast,
    required Color activeColor,
    double radius = Sizes.radius7,
  }) {
    return BoxDecoration(
      color: activeColor,
      borderRadius: BorderRadius.horizontal(
        left: isFirst ? Radius.circular(radius) : Radius.zero,
        right: isLast ? Radius.circular(radius) : Radius.zero,
      ),
    );
  }

  /// Decoration for individual pill group items
  static BoxDecoration pillGroupItem({
    required bool isActive,
    required bool isFirst,
    required bool isLast,
  }) {
    return BoxDecoration(
      color: isActive ? AppColors.primaryLight : Colors.transparent,
      borderRadius: BorderRadius.horizontal(
        left: isFirst ? const Radius.circular(Sizes.radius7) : Radius.zero,
        right: isLast ? const Radius.circular(Sizes.radius7) : Radius.zero,
      ),
      border: isLast
          ? null
          : const Border(
              right: BorderSide(
                color: AppColors.greyBorder,
                width: Sizes.width05,
              ),
            ),
    );
  }

  /// Decoration for row action button
  static BoxDecoration rowActionButton({
    Color color = AppColors.colorWhite,
    Color borderColor = AppColors.greyBorder,
    double borderWidth = Sizes.width05,
    double radius = Sizes.radius6,
  }) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  // ── Action Bar and Steppers ──────────────────────────────

  /// Decoration for action bar
  static BoxDecoration actionBar({
    Color color = AppColors.neutralBg,
    Color borderColor = AppColors.greyBorder,
    double borderWidth = Sizes.width05,
    double radius = Sizes.radius12,
  }) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Decoration for Number Stepper value container
  static BoxDecoration numberStepperValue() {
    return const BoxDecoration(
      border: Border.symmetric(
        vertical: BorderSide(color: AppColors.greyBorder, width: Sizes.width05),
      ),
    );
  }

  // ── Tabs ─────────────────────────────────────────────────

  /// Border decoration for tab container
  static BoxDecoration tabContainer({
    Color color = AppColors.greyBorder,
    double width = Sizes.width05,
  }) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(color: color, width: width),
      ),
    );
  }

  /// Border decoration for active tab indicator
  static BoxDecoration tabIndicator({
    required Color color,
    double width = Sizes.size2,
  }) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(color: color, width: width),
      ),
    );
  }

  /// active round border
  static BoxDecoration activeRoundDecoration({
    Color color = AppColors.greenColor,
  }) {
    return BoxDecoration(color: color, shape: BoxShape.circle);
  }

  /// side nav bar decoration
  static BoxDecoration sideNavBarOuter({bool isSelected = false}) {
    return BoxDecoration(
      color: isSelected ? AppColors.greyF0F1EC : AppColors.colorWhite,
      border: Border(
        bottom: const BorderSide(color: AppColors.divider),
        right: isSelected
            ? BorderSide.none
            : const BorderSide(color: AppColors.divider),
      ),
    );
  }

  /// side nav bar decoration
  static BoxDecoration sideNavBarInner({Color? color}) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: AppColors.black, width: Sizes.width1P5),
    );
  }

  /// side nav bar decoration
  static BoxDecoration badgeDecoration({Color? color = AppColors.redColor}) {
    return BoxDecoration(color: color);
  }

  /// Decoration for the control card logo
  static BoxDecoration controlCardLogo({
    Color color = AppColors.black,
    double radius = Sizes.padding20,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Decoration for the sign-in card
  static BoxDecoration signInCard({
    Color color = AppColors.textWhite,
    Color borderColor = AppColors.greyBorder,
    double borderWidth = Sizes.width2,
    double radius = Sizes.padding16,
  }) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Decoration for the QR scanner background
  static BoxDecoration qrScannerBg({
    Color color = AppColors.infoLight,
    double radius = Sizes.padding16,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: AppColors.greyD1D5DB),
    );
  }

  /// Decoration for the QR scanner icon background
  static BoxDecoration qrScannerIconBg({
    Color color = AppColors.textWhite,
    Color borderColor = AppColors.newRollDarkBg,
    double borderWidth = Sizes.width2,
    double radius = Sizes.padding12,
  }) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Decoration for the QR scanner container
  static BoxDecoration qrScannerContainer() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.lightGrey, width: Sizes.width1),
    );
  }

  /// Decoration for the QR scanner corner brackets
  static BoxDecoration qrCornerBracket({
    bool top = false,
    bool bottom = false,
    bool left = false,
    bool right = false,
  }) {
    return BoxDecoration(
      border: Border(
        top: top ? const BorderSide(width: Sizes.width4) : BorderSide.none,
        bottom: bottom ? const BorderSide(width: Sizes.width4) : BorderSide.none,
        left: left ? const BorderSide(width: Sizes.width4) : BorderSide.none,
        right: right ? const BorderSide(width: Sizes.width4) : BorderSide.none,
      ),
    );
  }

  /// Decoration for checklist step circles
  static BoxDecoration stepCircle({
    Color? color,
    Color? borderColor,
  }) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      border: borderColor != null ? Border.all(color: borderColor) : null,
    );
  }

  /// Decoration for a dashed outline container
  static BoxDecoration dashedOutline({
    Color borderColor = AppColors.greyBorder,
    double radius = Sizes.radius12,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor, style: BorderStyle.solid), // In reality dashed
    );
  }

  /// Style for badge fallback outlined button
  static ButtonStyle badgeFallbackButton() {
    return OutlinedButton.styleFrom(
      foregroundColor: AppColors.black,
      side: const BorderSide(color: AppColors.black, width: Sizes.width2),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding16,
        vertical: Sizes.padding10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.padding0),
      ),
    );
  }

  /// Decoration for the logged-in card
  static BoxDecoration loggedInCard({
    Color color = AppColors.successLight,
    Color borderColor = AppColors.darkGreenColor,
    double borderWidth = Sizes.width1,
    double radius = Sizes.padding8,
  }) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Decoration with transparent color
  static BoxDecoration transparent() {
    return const BoxDecoration(color: Colors.transparent);
  }

  // ── Core Utilities ─────────────────────────────────────────

  // ── Buttons ──────────────────────────────────────────────

  /// Decoration for AppButton
  static BoxDecoration appButton({Color? borderColor}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(Sizes.radius0),
      border: borderColor != null ? Border.all(color: borderColor) : null,
    );
  }

  // ── BOM Page Decorations ─────────────────────────────────

  /// Decoration for the top header section in the BOM page.
  static BoxDecoration bomAppBarHeader() {
    return const BoxDecoration(
      color: AppColors.greyF8F7F4,
      border: Border(bottom: BorderSide(color: AppColors.greyBorder)),
    );
  }

  /// Decoration for the top header section in the BOM page.
  static BoxDecoration bomHeader() {
    return const BoxDecoration(
      color: AppColors.greyF0F1EC,
      border: Border(bottom: BorderSide(color: AppColors.greyBorder)),
    );
  }

  /// Decoration for the back button inside the BOM header.
  static BoxDecoration bomBackButton() {
    return BoxDecoration(
      border: Border.all(color: AppColors.black),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for the yellow highlighted picked count in the BOM header.
  static BoxDecoration bomPickedCount() {
    return BoxDecoration(
      color: AppColors.warning,
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for the Work Order number container in the BOM info card.
  static BoxDecoration bomWoNoContainer() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.black, width: Sizes.width2),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for the STORE tag/button in the BOM info card.
  static BoxDecoration bomStoreButton() {
    return BoxDecoration(
      border: Border.all(color: AppColors.textPrimary, width: Sizes.width2),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for the main BOM table container.
  static BoxDecoration bomTableContainer() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  /// Decoration for the header row of the BOM table.
  static BoxDecoration bomTableHeader() {
    return const BoxDecoration(
      color: AppColors.surfaceBg,
      border: Border(bottom: BorderSide(color: AppColors.greyBorder)),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Sizes.radius8),
        topRight: Radius.circular(Sizes.radius8),
      ),
    );
  }

  /// Decoration for individual rows in the BOM table.
  /// Applies a distinct left border if the item is currently being picked.
  static BoxDecoration bomTableRow({
    required bool isPickingNow,
    required Color bgColor,
  }) {
    return BoxDecoration(
      color: bgColor,
      border: Border(
        bottom: const BorderSide(color: AppColors.greyBorder),
        left: isPickingNow
            ? const BorderSide(color: AppColors.info, width: Sizes.width4)
            : BorderSide.none,
      ),
    );
  }

  /// Decoration for the "PICKED" status badge in the BOM table.
  static BoxDecoration bomStatusPicked() {
    return BoxDecoration(
      border: Border.all(color: AppColors.success),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for the "PENDING" status badge in the BOM table.
  static BoxDecoration bomStatusPending() {
    return BoxDecoration(
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for the side panel container on the right side of the BOM page.
  static BoxDecoration bomRightPanel() {
    return const BoxDecoration(
      border: Border(left: BorderSide(color: AppColors.greyBorder)),
    );
  }

  /// Decoration for the "PICKING NOW" section inside the BOM right panel.
  static BoxDecoration bomPickingNowSection() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder),
    );
  }

  /// Decoration for the camera viewfinder placeholder background.
  static BoxDecoration bomCameraPlaceholder() {
    return BoxDecoration(
      color: AppColors.neutralBg,
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  /// Decoration for the camera viewfinder placeholder border.
  static BoxDecoration bomCameraPlaceholderBorder() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(Sizes.radius8),
      border: Border.all(color: AppColors.greyBorder, width: Sizes.width2),
    );
  }

  /// Decoration for the uncompleted background of the progress bar in the BOM right panel.
  static BoxDecoration bomProgressBarBg() {
    return BoxDecoration(
      color: AppColors.greyBorder,
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for the completed (filled) portion of the progress bar in the BOM right panel.
  static BoxDecoration bomProgressBarFill() {
    return const BoxDecoration(
      color: AppColors.primaryLight,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Sizes.radius4),
        bottomLeft: Radius.circular(Sizes.radius4),
      ),
    );
  }

  /// Decoration for the completed (filled) portion of the progress bar in the BOM right panel.
  static BoxDecoration bomDangerProgressBarFill() {
    return const BoxDecoration(
      color: AppColors.danger,

    );
  }


  /// Decoration for the red error banner displayed on scanning the wrong item.
  static BoxDecoration bomErrorBanner() {
    return BoxDecoration(
      color: AppColors.dangerLight,
      border: Border.all(color: AppColors.danger),
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  // ── Work Order List Panel Decorations ──────────────────

  /// Decoration for the filter tabs container
  static BoxDecoration filterTabsContainer() {
    return const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: AppColors.greyBorder, width: Sizes.size1),
      ),
    );
  }

  /// Decoration for individual filter chips
  static BoxDecoration filterChip({required bool isSelected}) {
    return BoxDecoration(
      color: isSelected ? AppColors.primary : Colors.white,
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  // ── Work Order Details Panel Decorations ─────────────────

  /// Decoration for status badge in details panel
  static BoxDecoration detailsStatusBadge({
    required String status,
    double radius = Sizes.radius2,
  }) {
    return BoxDecoration(
      color: status == 'RUNNING'
          ? AppColors.stageLiveGreen
          : AppColors.stageLocked,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Decoration for priority badge in details panel
  static BoxDecoration detailsPriorityBadge() {
    return BoxDecoration(
      color: AppColors.detailsPriorityRed,
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Decoration for the stats row container in details panel
  static BoxDecoration detailsStatsContainer() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder, width: Sizes.size1),
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  // ── Work Order Header Decorations ────────────────────────

  /// Decoration for instruction badge in header section
  static BoxDecoration headerInstructionBadge() {
    return BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Decoration for sub-list containers (Hose Rolls, Recent NG)
  static BoxDecoration detailsListContainer() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for items in sub-lists
  static BoxDecoration detailsListItemBorder() {
    return const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: AppColors.detailsDivider, style: BorderStyle.solid),
      ),
    );
  }

  /// Decoration for roll ID badge
  static BoxDecoration detailsRollIdBadge() {
    return BoxDecoration(
      border: Border.all(color: AppColors.success),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  // ── Work Order Card Decorations ──────────────────────────

  /// Decoration for priority badge in card
  static BoxDecoration cardPriorityBadge() {
    return BoxDecoration(
      color: const Color(0xFFD32F2F),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Decoration for status badge in card
  static BoxDecoration cardStatusBadge({required Color statusColor}) {
    return BoxDecoration(
      border: Border.all(color: statusColor, width: Sizes.width1P5),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  // ── Stage Details Decorations ──────────────────────────

  /// Decoration for main header of Stage Details screen
  static BoxDecoration stageDetailsHeader() {
    return const BoxDecoration(
      color: AppColors.stageHeaderBg,
      border: Border(bottom: BorderSide(color: AppColors.greyBorder)),
    );
  }

  /// Decoration for the back button in Stage Details header
  static BoxDecoration stageDetailsBackButton() {
    return BoxDecoration(
      border: Border.all(color: Colors.black12),
      borderRadius: BorderRadius.circular(Sizes.radius4),
      color: AppColors.colorWhite,
    );
  }

  // ── Stage List Panel Decorations ───────────────────────

  /// Decoration for the main Stage List Panel
  static BoxDecoration stageListPanel() {
    return const BoxDecoration(
      color: AppColors.colorWhite,
      border: Border(right: BorderSide(color: AppColors.greyBorder)),
    );
  }

  /// Decoration for the header inside Stage List Panel
  static BoxDecoration stageListHeader() {
    return const BoxDecoration(
      border: Border(bottom: BorderSide(color: AppColors.greyBorder)),
    );
  }

  /// Decoration for the active stage circle icon
  static BoxDecoration stageActiveCircle() {
    return BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: AppColors.primary, width: Sizes.width2),
    );
  }

  /// Decoration for OFFLINE tag
  static BoxDecoration stageOfflineTag() {
    return BoxDecoration(
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Decoration for GATE tag
  static BoxDecoration stageGateTag() {
    return BoxDecoration(
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Decoration for KAKOTORA tag
  static BoxDecoration stageKakotoraTag() {
    return BoxDecoration(
      border: Border.all(color: AppColors.pinkBorder),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  // ── Control Points Panel Decorations ───────────────────

  /// Decoration for the green online circle indicator
  static BoxDecoration onlineCircleIndicator() {
    return const BoxDecoration(
      color: AppColors.success,
      shape: BoxShape.circle,
    );
  }

  /// Decoration for requirement cards
  static BoxDecoration requirementCard({required bool isWarning}) {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(
        color: isWarning ? AppColors.warning : AppColors.success,
      ),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for requirement card icon
  static BoxDecoration requirementCardIcon({required bool isWarning}) {
    return BoxDecoration(
      color: isWarning ? AppColors.warning : AppColors.success,
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for control points table container
  static BoxDecoration controlPointsTableContainer() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for control points row
  static BoxDecoration controlPointsRow({required bool isLast}) {
    return BoxDecoration(
      border: isLast
          ? null
          : const Border(bottom: BorderSide(color: AppColors.greyBorder)),
    );
  }

  /// Decoration for KAK tag in control points
  static BoxDecoration controlPointKakTag() {
    return BoxDecoration(
      border: Border.all(color: AppColors.danger),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Decoration for OK tag in control points
  static BoxDecoration controlPointOkTag() {
    return BoxDecoration(
      border: Border.all(color: AppColors.success),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Decoration for NG tag in control points
  static BoxDecoration controlPointNgTag({required bool hasNg}) {
    return BoxDecoration(
      border: Border.all(
        color: hasNg ? AppColors.danger : AppColors.greyBorder,
      ),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  // ── Login Screen Decorations ───────────────────────────

  /// Decoration for avatar circle in logged in card
  static BoxDecoration loginAvatarCircle() {
    return BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: AppColors.okColor, width: Sizes.width1),
    );
  }

  /// Decoration for employee ID badge
  static BoxDecoration loginEmployeeIdBadge() {
    return BoxDecoration(
      color: AppColors.okColor,
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for system info container
  static BoxDecoration loginSystemInfoContainer() {
    return BoxDecoration(
      color: AppColors.neutralBg,
      borderRadius: BorderRadius.circular(Sizes.padding8),
    );
  }

  // ── Alert Screen Decorations ───────────────────────────

  /// Style for alert header outlined button
  static ButtonStyle alertHeaderOutlinedButton() {
    return OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.greyBorder, width: Sizes.width1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.radius4)),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.padding16, vertical: Sizes.padding16),
      backgroundColor: AppColors.colorWhite,
      foregroundColor: AppColors.textPrimary,
      textStyle: AppTextStyles.inter.textStyle12BoldBlack87,
    );
  }

  /// Style for alert bottom action outlined button
  static ButtonStyle alertBottomOutlinedButton({double verticalPadding = Sizes.padding16}) {
    return OutlinedButton.styleFrom(
      backgroundColor: AppColors.colorWhite,
      side: const BorderSide(color: AppColors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.radius2)),
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
    );
  }

  /// Style for alert bottom action elevated button
  static ButtonStyle alertBottomElevatedButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.danger,
      foregroundColor: AppColors.colorWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.radius2)),
      padding: const EdgeInsets.symmetric(vertical: Sizes.padding16),
      elevation: 0,
    );
  }

  /// Decoration for alert tabs
  static BoxDecoration alertTab({required bool isSelected}) {
    return BoxDecoration(
      color: isSelected ? AppColors.black : AppColors.colorWhite,
      border: Border.all(color: isSelected ? AppColors.black : AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Decoration for alert list item
  static BoxDecoration alertListItem({required bool isSelected}) {
    return BoxDecoration(
      color: isSelected ? AppColors.newRollBg : AppColors.colorWhite,
      border: const Border(
        bottom: BorderSide(color: AppColors.greyBorder),
      ),
    );
  }

  /// Decoration for alert list item tag
  static BoxDecoration alertTag({required Color color}) {
    return BoxDecoration(
      border: Border.all(color: color, width: Sizes.width1),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Decoration for reading item box
  static BoxDecoration readingItemBox({required Color color, required Color bgColor}) {
    return BoxDecoration(
      color: bgColor,
      border: Border.all(color: color, width: Sizes.width1),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for readings box container
  static BoxDecoration readingsBox() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for roster card
  static BoxDecoration loginRosterCard({required bool isYou}) {
    return BoxDecoration(
      color: isYou ? AppColors.neutralBg : AppColors.textWhite,
      border: Border.all(
        color: isYou ? AppColors.info : AppColors.greyBorder,
        width: Sizes.width1,
      ),
      borderRadius: BorderRadius.circular(Sizes.padding8),
    );
  }

  // ── Stage Setup Page Decorations ─────────────────────────

  /// Decoration for Left Panel - Main tasks and checklist
  static BoxDecoration stageSetupLeftPanel() {
    return const BoxDecoration(
      border: Border(right: BorderSide(color: Color(0xFFE0E0E0))),
    );
  }

  /// Decoration for main header of Stage Setup screen
  static BoxDecoration stageSetupHeader() {
    return const BoxDecoration(
      color: AppColors.colorWhite,
      border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
    );
  }

  /// Decoration for the back button in Stage Setup header
  static BoxDecoration stageSetupBackButton() {
    return BoxDecoration(
      border: Border.all(color: Colors.black12),
      borderRadius: BorderRadius.circular(Sizes.radius4),
      color: AppColors.colorWhite,
    );
  }

  /// Decoration for generic badges in Stage Setup screen
  static BoxDecoration stageSetupBadge({required Color color}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for the stepper phase cards in Stage Setup screen
  static BoxDecoration stageSetupPhaseCard({
    required Color color,
    required Color borderColor,
    double borderWidth = 1.0,
  }) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  /// Circular active indicator decoration
  static BoxDecoration stageSetupCircleIndicator({required Color color}) {
    return BoxDecoration(color: color, shape: BoxShape.circle);
  }

  /// Decoration for the DONE badge on phase stepper
  static BoxDecoration stageSetupDoneBadge() {
    return BoxDecoration(
      border: Border.all(color: AppColors.stageLiveGreen),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Border and shadow decoration for a checklist item
  static BoxDecoration stageSetupChecklistItem({required bool isVerified}) {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border(
        left: BorderSide(
          color: isVerified ? AppColors.stageLiveGreen : AppColors.stageLocked,
          width: 4.0,
        ),
      ),
      boxShadow: const <BoxShadow>[
        BoxShadow(color: AppColors.grey300Color, blurRadius: 2.0, offset: Offset(0, 1)),
      ],
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(Sizes.radius4),
        bottomRight: Radius.circular(Sizes.radius4),
      ),
    );
  }

  /// Icon container background for checklist item
  static BoxDecoration stageSetupChecklistIconBg({required bool isVerified}) {
    return BoxDecoration(
      color: isVerified ? AppColors.stageSuccessBg : AppColors.stageWarningLight,
      borderRadius: BorderRadius.circular(Sizes.radius4),
      border: Border.all(
        color: isVerified ? AppColors.stageLiveGreen : AppColors.stageLocked,
      ),
    );
  }

  /// Outline section container for Target Cut Count
  static BoxDecoration stageSetupSectionContainer() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.stageDivider),
      borderRadius: BorderRadius.circular(Sizes.radius6),
    );
  }

  /// Decoration for preset count button inside Target Cut Count
  static BoxDecoration stageSetupPresetButton({required bool isSelected}) {
    return BoxDecoration(
      color: isSelected ? AppColors.histogramBlue : Colors.white,
      border: Border.all(
        color: isSelected ? AppColors.histogramBlue : AppColors.stageGreyBorder,
      ),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for minus/plus adjustment buttons inside Target Cut Count
  static BoxDecoration stageSetupPresetAdjustButton() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.stageGreyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Circular number/check badge for gate status steps
  static BoxDecoration stageSetupGateStatusCircle({
    required Color bgColor,
    required Color borderColor,
  }) {
    return BoxDecoration(
      color: bgColor,
      shape: BoxShape.circle,
      border: Border.all(color: borderColor, width: 2.0),
    );
  }

  /// Warning / Note card decoration in gate status sidebar
  static BoxDecoration stageSetupWarningNote() {
    return BoxDecoration(
      color: AppColors.stageWarningNoteBg,
      border: Border.all(color: AppColors.stageWarningNoteBorder),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  // ──────────────────────────────────────────
  // Quality Setup Decorations
  // ──────────────────────────────────────────

  /// Decoration for the left panel in Quality Setup
  static BoxDecoration qualitySetupLeftPanel() {
    return BoxDecoration(
      color: const Color(0xFFF9F9F9),
      border: Border(
        right: BorderSide(color: AppColors.greyBorder, width: Sizes.width1),
      ),
    );
  }

  /// Decoration for control point item card
  static BoxDecoration qualitySetupControlPointCard() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for Vernier inputs
  static BoxDecoration qualitySetupInputBox({
    bool isActive = false,
    bool isOk = true,
  }) {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(
        color: isActive
            ? (isOk ? AppColors.stageLiveGreen : AppColors.danger)
            : AppColors.greyBorder,
        width: isActive ? 2.0 : 1.0,
      ),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Decoration for Live Vernier Header
  static BoxDecoration qualitySetupLiveHeader() {
    return BoxDecoration(
      color: const Color(0xFF1A1D20),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(Sizes.radius4),
        topRight: Radius.circular(Sizes.radius4),
      ),
    );
  }

  /// Decoration for Live Vernier Body
  static BoxDecoration qualitySetupLiveBody() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: const Border(
        left: BorderSide(color: AppColors.greyBorder),
        right: BorderSide(color: AppColors.greyBorder),
        bottom: BorderSide(color: AppColors.greyBorder),
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(Sizes.radius4),
        bottomRight: Radius.circular(Sizes.radius4),
      ),
    );
  }

  /// Decoration for First-off gate
  static BoxDecoration qualitySetupFirstOffGate() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: const Border(
        left: BorderSide(color: Color(0xFFD97706), width: 4.0),
      ),
      boxShadow: const [
        BoxShadow(
          color: AppColors.grey300Color,
          blurRadius: Sizes.radius2,
          offset: Offset(0, 1),
        ),
      ],
    );
  }

  /// Decoration for Stage Log
  static BoxDecoration qualitySetupStageLog() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder),
    );
  }

  // ── Button Styles ──────────────────────────────────────────

  /// Primary Green Button Style
  static ButtonStyle primaryGreenButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.stageLiveGreen,
      foregroundColor: AppColors.colorWhite,
      disabledBackgroundColor: AppColors.disabledGrey300,
      disabledForegroundColor: AppColors.disabledGrey500,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding24,
        vertical: Sizes.padding16,
      ),
    );
  }

  /// Default Outlined Button Style
  static ButtonStyle defaultOutlinedButton() {
    return OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.outlineGrey),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding24,
        vertical: Sizes.padding16,
      ),
    );
  }

  /// Danger Outlined Button Style (e.g., Raise Breakdown)
  static ButtonStyle dangerOutlinedButton() {
    return OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.danger),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding24,
        vertical: Sizes.padding20,
      ),
    );
  }

  /// Dark Outlined Button Style (e.g., Pause)
  static ButtonStyle darkOutlinedButton() {
    return OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.textPrimary,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding24,
        vertical: Sizes.padding20,
      ),
    );
  }

  /// Dark Elevated Button Style (e.g., Call QC)
  static ButtonStyle darkElevatedButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: AppColors.colorWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding16,
      ),
      elevation: 0,
    );
  }

  /// Quality Setup status badge
  static BoxDecoration qualitySetupStatusBadge({
    required bool isOk,
  }) {
    return BoxDecoration(
      color: isOk
          ? AppColors.stageSuccessBg
          : AppColors.stageDangerBg,
      borderRadius: BorderRadius.circular(Sizes.radius4),
      border: Border.all(
        color: isOk
            ? AppColors.stageLiveGreen
            : AppColors.danger,
      ),
    );
  }

  /// Quality Setup danger tag
  static BoxDecoration qualitySetupDangerTag() {
    return BoxDecoration(
      color: AppColors.stageDangerBg,
      borderRadius: BorderRadius.circular(Sizes.radius2),
      border: Border.all(color: AppColors.danger),
    );
  }

  /// Quality Setup warning tag
  static BoxDecoration qualitySetupWarningTag() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      borderRadius: BorderRadius.circular(Sizes.radius2),
      border: Border.all(color: AppColors.stageLocked),
    );
  }

  /// Histogram bar decoration
  static BoxDecoration qualitySetupHistogramBar({
    required bool isHighlight,
  }) {
    return BoxDecoration(
      color: isHighlight
          ? AppColors.histogramBlue
          : AppColors.histogramLightBlue,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(Sizes.radius2),
        topRight: Radius.circular(Sizes.radius2),
      ),
    );
  }

  /// Counter minus button
  static BoxDecoration qualitySetupCounterMinus({
    required bool isOk,
  }) {
    return BoxDecoration(
      border: Border.all(
        color: isOk
            ? AppColors.stageLiveGreen
            : AppColors.danger,
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(Sizes.radius4),
        bottomLeft: Radius.circular(Sizes.radius4),
      ),
    );
  }

  /// Counter plus button
  static BoxDecoration qualitySetupCounterPlus({
    required bool isOk,
  }) {
    return BoxDecoration(
      color: isOk
          ? AppColors.stageLiveGreen
          : AppColors.danger,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(Sizes.radius4),
        bottomRight: Radius.circular(Sizes.radius4),
      ),
    );
  }

  /// Counter center value box
  static BoxDecoration qualitySetupCounterValue({
    required bool isOk,
  }) {
    return BoxDecoration(
      border: Border.symmetric(
        horizontal: BorderSide(
          color: isOk
              ? AppColors.stageLiveGreen
              : AppColors.danger,
        ),
      ),
    );
  }

  /// Quality setup small status dot
  static BoxDecoration qualitySetupStatusDot({
    required Color color,
  }) {
    return BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    );
  }

  /// Quality setup bordered tag
  static BoxDecoration qualitySetupBorderedTag({
    required Color borderColor,
    Color backgroundColor = AppColors.colorWhite,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(Sizes.radius2),
      border: Border.all(color: borderColor),
    );
  }
  /// Quality setup danger card
  static BoxDecoration qualitySetupDangerCard() {
    return BoxDecoration(
      color: AppColors.stageDangerBg,
      borderRadius: BorderRadius.circular(Sizes.radius4),
      border: Border.all(color: AppColors.danger),
    );
  }
  /// Quality setup bottom bar
  static BoxDecoration qualitySetupBottomBar() {
    return const BoxDecoration(
      color: AppColors.colorWhite,
      border: Border(
        top: BorderSide(color: AppColors.greyBorder),
      ),
    );
  }
  /// Quality setup log indicator dot
  static BoxDecoration qualitySetupLogDot({
    required bool isGreen,
  }) {
    return BoxDecoration(
      color: isGreen
          ? AppColors.stageLiveGreen
          : AppColors.textPrimary,
      shape: BoxShape.circle,
    );
  }
  /// Quality setup last reading status card
  static BoxDecoration qualitySetupReadingStatus({
    required bool isOk,
  }) {
    return BoxDecoration(
      color: isOk
          ? AppColors.stageSuccessBg
          : AppColors.stageDangerBg,
      borderRadius: BorderRadius.circular(Sizes.radius4),
      border: Border.all(
        color: isOk
            ? AppColors.stageLiveGreen
            : AppColors.danger,
      ),
    );
  }

  // ── Pressure Test Page Decorations ─────────────────────────────────

  /// Background for the main dark graph area header.
  static BoxDecoration ptGraphHeader() {
    return const BoxDecoration(color: AppColors.black);
  }

  /// Container for the main graph panel.
  static BoxDecoration ptGraphContainer() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder),
    );
  }

  /// Decoration for "VISUAL OK" or "SOAP CLEAR" badges.
  static BoxDecoration ptStatusBadge({required bool isSolid, required Color color}) {
    return BoxDecoration(
      color: isSolid ? color : AppColors.colorWhite,
      border: Border.all(color: color, width: Sizes.width2),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Container for the STAGE TALLY and LAST 8 PIECES panel.
  static BoxDecoration ptSidePanelContainer() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  /// Container for the bottom action bar.
  static BoxDecoration ptBottomBar() {
    return const BoxDecoration(
      color: AppColors.colorWhite,
      border: Border(top: BorderSide(color: AppColors.greyBorder)),
    );
  }

  // ── Final Inspection Page Decorations ─────────────────────────────────

  /// Card with red left border for Leakage Confirmation.
  static BoxDecoration fiLeakageCard() {
    return const BoxDecoration(
      color: AppColors.colorWhite,
      border: Border(
        top: BorderSide(color: AppColors.greyBorder),
        right: BorderSide(color: AppColors.greyBorder),
        bottom: BorderSide(color: AppColors.greyBorder),
        left: BorderSide(color: AppColors.danger, width: Sizes.width4),
      ),
      // borderRadius: BorderRadius.circular(Sizes.radius4), // Left border might override left radius if not careful
    );
  }

  /// General outlined card.
  static BoxDecoration fiOutlineCard() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Info block background (grey).
  static BoxDecoration fiInfoBlock() {
    return BoxDecoration(
      color: AppColors.greyF0F1EC,
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  /// Bundle box (Solid).
  static BoxDecoration fiBundleSolid({required Color bgColor, required Color borderColor}) {
    return BoxDecoration(
      color: bgColor,
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  /// Bundle box (Dashed).
  /// Note: standard BoxDecoration doesn't support dashed borders directly,
  /// but we will use a solid border here and fall back to external packages or custom painters if needed.
  static BoxDecoration fiBundleDashed() {
    return BoxDecoration(
      color: AppColors.greyF8F7F4,
      border: Border.all(color: AppColors.greyBorder, style: BorderStyle.solid), // Simulating dash
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  /// Tag mockup container.
  static BoxDecoration fiTagContainer() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.black, width: Sizes.width2),
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  /// Tag panel wrapping background.
  static BoxDecoration fiTagPanel() {
    return const BoxDecoration(
      color: AppColors.colorWhite,
      border: Border(
        top: BorderSide(color: AppColors.greyBorder),
        bottom: BorderSide(color: AppColors.greyBorder),
        right: BorderSide(color: AppColors.greyBorder),
        left: BorderSide(color: AppColors.newRollDarkBg, width: Sizes.width4),
      ),
    );
  }

  // ── Offline Process Screen Decorations ─────────────────────

  /// Offline process header
  static BoxDecoration offlineProcessHeader() {
    return const BoxDecoration(
      color: AppColors.colorWhite,
    );
  }

  /// Offline process back button
  static BoxDecoration offlineProcessBackButton() {
    return BoxDecoration(
      border: Border.all(color: AppColors.stageGreyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius4),
      color: AppColors.colorWhite,
    );
  }

  /// Offline completed badge
  static BoxDecoration offlineCompletedBadge() {
    return BoxDecoration(
      color: AppColors.offlineSuccessBg,
      border: Border.all(
        color: AppColors.stageLiveGreen,
        width: Sizes.width1P5,
      ),
      borderRadius: BorderRadius.circular(Sizes.radius4),
    );
  }

  /// Offline progress segment
  static BoxDecoration offlineProgressSegment({
    required Color color,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Offline completed card
  static BoxDecoration offlineCompletedCard() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(
        color: AppColors.stageLiveGreen,
        width: Sizes.width1P5,
      ),
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  /// Offline active card
  static BoxDecoration offlineActiveCard() {
    return BoxDecoration(
      color: AppColors.offlineActiveBg,
      border: Border.all(
        color: AppColors.offlineActiveBlue,
        width: Sizes.width2,
      ),
      borderRadius: BorderRadius.circular(Sizes.radius8),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: AppColors.offlineActiveBlue.withValues(alpha: 0.08),
          blurRadius: Sizes.radius4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  /// Offline upcoming card
  static BoxDecoration offlineUpcomingCard() {
    return BoxDecoration(
      color: AppColors.colorWhite.withValues(alpha: 0.5),
      border: Border.all(
        color: AppColors.greyBorder,
        width: Sizes.width1,
      ),
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  /// Offline completed step circle
  static BoxDecoration offlineCompletedStepCircle() {
    return const BoxDecoration(
      color: AppColors.successDark,
      shape: BoxShape.circle,
    );
  }

  /// Offline active step circle
  static BoxDecoration offlineActiveStepCircle() {
    return const BoxDecoration(
      color: AppColors.offlineActiveBlue,
      shape: BoxShape.circle,
    );
  }

  /// Offline upcoming step circle
  static BoxDecoration offlineUpcomingStepCircle() {
    return BoxDecoration(
      color: Colors.transparent,
      shape: BoxShape.circle,
      border: Border.all(
        color: AppColors.grey400,
        width: Sizes.width1,
      ),
    );
  }

  /// Offline active dot
  static BoxDecoration offlineActiveDot() {
    return const BoxDecoration(
      color: AppColors.offlineActiveBlue,
      shape: BoxShape.circle,
    );
  }

  /// Offline control points badge
  static BoxDecoration offlineCtrlPointsBadge() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Offline kako badge
  static BoxDecoration offlineKakoBadge() {
    return BoxDecoration(
      color: AppColors.offlineKakoBg,
      border: Border.all(color: AppColors.offlineKakoBorder),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Offline live badge
  static BoxDecoration offlineLiveBadge() {
    return BoxDecoration(
      color: AppColors.offlineSuccessBg,
      border: Border.all(color: AppColors.stageLiveGreen),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Offline footer container
  static BoxDecoration offlineFooterContainer() {
    return const BoxDecoration();
  }

  /// Offline primary action button
  static ButtonStyle offlinePrimaryButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.colorWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding16,
        vertical: Sizes.padding16,
      ),
      elevation: 0,
    );
  }

  /// Offline outlined action button
  static ButtonStyle offlineOutlinedButton() {
    return OutlinedButton.styleFrom(
      side: const BorderSide(
        color: AppColors.textPrimary,
        width: Sizes.width1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.padding10,
      ),
      backgroundColor: AppColors.colorWhite,
    );
  }

  /// Offline disabled outlined button
  static ButtonStyle offlineDisabledButton() {
    return OutlinedButton.styleFrom(
      side: const BorderSide(
        color: AppColors.stageGreyBorder,
        width: Sizes.width1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.padding10,
      ),
    );
  }

  /// Offline danger button
  static ButtonStyle offlineDangerButton() {
    return OutlinedButton.styleFrom(
      foregroundColor: AppColors.redColor,
      side: const BorderSide(
        color: AppColors.offlineKakoBorder,
        width: Sizes.width1P5,
      ),
      backgroundColor: AppColors.offlineDangerLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding20,
        vertical: Sizes.padding16,
      ),
    );
  }

  /// Offline print button
  static ButtonStyle offlinePrintButton() {
    return OutlinedButton.styleFrom(
      foregroundColor: AppColors.textPrimary,
      side: const BorderSide(
        color: AppColors.textPrimary,
        width: Sizes.width1P5,
      ),
      backgroundColor: AppColors.colorWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding20,
        vertical: Sizes.padding16,
      ),
    );
  }

  /// Offline QR button style
  static ButtonStyle offlineQrButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.colorWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding16,
        vertical: Sizes.padding16,
      ),
      elevation: 0,
    );
  }

  /// Offline card completed decoration
  static BoxDecoration offlineCardCompleted() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(
        color: AppColors.stageLiveGreen,
        width: Sizes.width1P5,
      ),
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  /// Offline card active decoration
  static BoxDecoration offlineCardActive() {
    return BoxDecoration(
      color: AppColors.offlineActiveBg,
      border: Border.all(
        color: AppColors.offlineActiveBlue,
        width: Sizes.width2,
      ),
      borderRadius: BorderRadius.circular(Sizes.radius8),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: AppColors.offlineActiveBlue.withValues(alpha: 0.08),
          blurRadius: Sizes.radius4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  /// Offline card upcoming decoration
  static BoxDecoration offlineCardUpcoming() {
    return BoxDecoration(
      color: AppColors.colorWhite.withValues(alpha: 0.5),
      border: Border.all(
        color: AppColors.greyBorder,
        width: Sizes.width1,
      ),
      borderRadius: BorderRadius.circular(Sizes.radius8),
    );
  }

  /// Offline completed circle
  static BoxDecoration offlineCompletedCircle() {
    return const BoxDecoration(
      color: AppColors.successDark,
      shape: BoxShape.circle,
    );
  }

  /// Offline active circle
  static BoxDecoration offlineActiveCircle() {
    return const BoxDecoration(
      color: AppColors.offlineActiveBlue,
      shape: BoxShape.circle,
    );
  }

  /// Offline upcoming circle
  static BoxDecoration offlineUpcomingCircle() {
    return BoxDecoration(
      color: Colors.transparent,
      shape: BoxShape.circle,
      border: Border.all(
        color: AppColors.grey400,
        width: Sizes.width1,
      ),
    );
  }

  /// Offline active status dot
  static BoxDecoration offlineStatusDot() {
    return const BoxDecoration(
      color: AppColors.offlineActiveBlue,
      shape: BoxShape.circle,
    );
  }

  /// Offline ctrl points tag
  static BoxDecoration offlineCtrlTag() {
    return BoxDecoration(
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Offline kako tag
  static BoxDecoration offlineKakoTag() {
    return BoxDecoration(
      color: AppColors.offlineKakoBg,
      border: Border.all(color: AppColors.offlineKakoBorder),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Offline live tag
  static BoxDecoration offlineLiveTag() {
    return BoxDecoration(
      color: AppColors.offlineSuccessBg,
      border: Border.all(color: AppColors.stageLiveGreen),
      borderRadius: BorderRadius.circular(Sizes.radius2),
    );
  }

  /// Offline completed step button
  static ButtonStyle offlineCompletedStepButton() {
    return OutlinedButton.styleFrom(
      side: const BorderSide(
        color: AppColors.textPrimary,
        width: Sizes.width1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.padding10,
      ),
      backgroundColor: AppColors.colorWhite,
    );
  }

  /// Offline active step button
  static ButtonStyle offlineActiveStepButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.colorWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.padding10,
      ),
      elevation: 0,
    );
  }

  /// Offline locked step button
  static ButtonStyle offlineLockedStepButton() {
    return OutlinedButton.styleFrom(
      side: const BorderSide(
        color: AppColors.stageGreyBorder,
        width: Sizes.width1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.padding10,
      ),
      backgroundColor: AppColors.colorWhite,
    );
  }


  /// Offline footer breakdown button
  static ButtonStyle offlineFooterBreakdownButton() {
    return OutlinedButton.styleFrom(
      foregroundColor: AppColors.redColor,
      side: const BorderSide(
        color: AppColors.offlineKakoBorder,
        width: Sizes.width1P5,
      ),
      backgroundColor: AppColors.offlineDangerLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding20,
        vertical: Sizes.padding16,
      ),
    );
  }

  /// Offline footer print button
  static ButtonStyle offlineFooterPrintButton() {
    return OutlinedButton.styleFrom(
      foregroundColor: AppColors.textPrimary,
      side: const BorderSide(
        color: AppColors.textPrimary,
        width: Sizes.width1P5,
      ),
      backgroundColor: AppColors.colorWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.radius4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding20,
        vertical: Sizes.padding16,
      ),
    );
  }

  /// Stage list item background
  static BoxDecoration stageListItem({
    required bool isActive,
  }) {
    return BoxDecoration(
      color: isActive
          ? AppColors.offlineActiveBg
          : AppColors.colorWhite,
    );
  }

  /// Stage list divider
  static BoxDecoration stageListDivider() {
    return const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.stageGreyBorder,
          width: Sizes.width1,
        ),
      ),
    );
  }

  /// Stage completed icon decoration
  static BoxDecoration stageCompletedIconBg() {
    return const BoxDecoration(
      color: AppColors.stageLiveGreen,
      shape: BoxShape.circle,
    );
  }

  /// Stage inactive circle decoration
  static BoxDecoration stageInactiveCircle() {
    return BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: AppColors.grey400,
        width: Sizes.width1,
      ),
    );
  }

  /// Kakotora star icon background
  static BoxDecoration stageKakotoraIconBg() {
    return const BoxDecoration(
      color: AppColors.pinkBorder,
      shape: BoxShape.circle,
    );
  }
}
