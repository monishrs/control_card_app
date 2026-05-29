import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
  ];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'Project'**
  String get app_name;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @response_000.
  ///
  /// In en, this message translates to:
  /// **'Process completed successfully.'**
  String get response_000;

  /// No description provided for @response_001.
  ///
  /// In en, this message translates to:
  /// **'Temporary registration for SNS member was successful.'**
  String get response_001;

  /// No description provided for @response_900.
  ///
  /// In en, this message translates to:
  /// **'Login failed.'**
  String get response_900;

  /// No description provided for @response_901.
  ///
  /// In en, this message translates to:
  /// **'The validity period has expired.'**
  String get response_901;

  /// No description provided for @response_902.
  ///
  /// In en, this message translates to:
  /// **'The data is already registered.'**
  String get response_902;

  /// No description provided for @response_903.
  ///
  /// In en, this message translates to:
  /// **'The specified version of the file was not found.'**
  String get response_903;

  /// No description provided for @response_904.
  ///
  /// In en, this message translates to:
  /// **'Invalid JSON file format.'**
  String get response_904;

  /// No description provided for @response_905.
  ///
  /// In en, this message translates to:
  /// **'You cannot withdraw because there are unfinished orders.'**
  String get response_905;

  /// No description provided for @response_920.
  ///
  /// In en, this message translates to:
  /// **'Invalid or missing input parameters.'**
  String get response_920;

  /// No description provided for @response_921.
  ///
  /// In en, this message translates to:
  /// **'Token expired. Please log in again.'**
  String get response_921;

  /// No description provided for @response_922.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized access.'**
  String get response_922;

  /// No description provided for @response_930.
  ///
  /// In en, this message translates to:
  /// **'Invalid URL. Please check the endpoint.'**
  String get response_930;

  /// No description provided for @response_931.
  ///
  /// In en, this message translates to:
  /// **'No matching data found.'**
  String get response_931;

  /// No description provided for @response_940.
  ///
  /// In en, this message translates to:
  /// **'Invalid request method.'**
  String get response_940;

  /// No description provided for @response_950.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please try again later.'**
  String get response_950;

  /// No description provided for @response_999.
  ///
  /// In en, this message translates to:
  /// **'Unexpected system error occurred. Please contact support.'**
  String get response_999;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again.'**
  String get noInternet;

  /// No description provided for @noTitleAvailable.
  ///
  /// In en, this message translates to:
  /// **'No title available'**
  String get noTitleAvailable;

  /// No description provided for @noArticlesFound.
  ///
  /// In en, this message translates to:
  /// **'No articles found.'**
  String get noArticlesFound;

  /// No description provided for @buttonWidgets.
  ///
  /// In en, this message translates to:
  /// **'Button Widgets'**
  String get buttonWidgets;

  /// No description provided for @primaryLabel.
  ///
  /// In en, this message translates to:
  /// **'Primary — black & green'**
  String get primaryLabel;

  /// No description provided for @outlinedLabel.
  ///
  /// In en, this message translates to:
  /// **'Outlined'**
  String get outlinedLabel;

  /// No description provided for @dangerLabel.
  ///
  /// In en, this message translates to:
  /// **'Danger / reject'**
  String get dangerLabel;

  /// No description provided for @warningLabel.
  ///
  /// In en, this message translates to:
  /// **'Warning / hold'**
  String get warningLabel;

  /// No description provided for @secondaryLabel.
  ///
  /// In en, this message translates to:
  /// **'Secondary / ghost / info'**
  String get secondaryLabel;

  /// No description provided for @successLabel.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get successLabel;

  /// No description provided for @offlineModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Offline mode'**
  String get offlineModeLabel;

  /// No description provided for @sizesLabel.
  ///
  /// In en, this message translates to:
  /// **'Sizes'**
  String get sizesLabel;

  /// No description provided for @iconOnlyLabel.
  ///
  /// In en, this message translates to:
  /// **'Icon-only'**
  String get iconOnlyLabel;

  /// No description provided for @rowActionButtonsLabel.
  ///
  /// In en, this message translates to:
  /// **'Row action buttons'**
  String get rowActionButtonsLabel;

  /// No description provided for @colorChipLabel.
  ///
  /// In en, this message translates to:
  /// **'Color chip / swatch buttons'**
  String get colorChipLabel;

  /// No description provided for @numberStepperLabel.
  ///
  /// In en, this message translates to:
  /// **'Number stepper'**
  String get numberStepperLabel;

  /// No description provided for @tabBarLabel.
  ///
  /// In en, this message translates to:
  /// **'Tab bar (underline)'**
  String get tabBarLabel;

  /// No description provided for @segmentedToggleLabel.
  ///
  /// In en, this message translates to:
  /// **'Segmented toggle'**
  String get segmentedToggleLabel;

  /// No description provided for @pillGroupLabel.
  ///
  /// In en, this message translates to:
  /// **'Pill group toggle'**
  String get pillGroupLabel;

  /// No description provided for @statusBadgesLabel.
  ///
  /// In en, this message translates to:
  /// **'Status badges'**
  String get statusBadgesLabel;

  /// No description provided for @disabledStateLabel.
  ///
  /// In en, this message translates to:
  /// **'Disabled state'**
  String get disabledStateLabel;

  /// No description provided for @actionBarsLabel.
  ///
  /// In en, this message translates to:
  /// **'Action bars'**
  String get actionBarsLabel;

  /// No description provided for @fullWidthCTAsLabel.
  ///
  /// In en, this message translates to:
  /// **'Full-width CTAs'**
  String get fullWidthCTAsLabel;

  /// No description provided for @darkPrimary.
  ///
  /// In en, this message translates to:
  /// **'Dark primary'**
  String get darkPrimary;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @signOff.
  ///
  /// In en, this message translates to:
  /// **'Sign off'**
  String get signOff;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @greenOutline.
  ///
  /// In en, this message translates to:
  /// **'Green outline'**
  String get greenOutline;

  /// No description provided for @redOutline.
  ///
  /// In en, this message translates to:
  /// **'Red outline'**
  String get redOutline;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @flagIssue.
  ///
  /// In en, this message translates to:
  /// **'Flag issue'**
  String get flagIssue;

  /// No description provided for @cancelStage.
  ///
  /// In en, this message translates to:
  /// **'Cancel stage'**
  String get cancelStage;

  /// No description provided for @hold.
  ///
  /// In en, this message translates to:
  /// **'Hold'**
  String get hold;

  /// No description provided for @rescan.
  ///
  /// In en, this message translates to:
  /// **'Re-scan'**
  String get rescan;

  /// No description provided for @pendingQc.
  ///
  /// In en, this message translates to:
  /// **'Pending QC'**
  String get pendingQc;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @scanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan barcode'**
  String get scanBarcode;

  /// No description provided for @passed.
  ///
  /// In en, this message translates to:
  /// **'Passed'**
  String get passed;

  /// No description provided for @approve.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// No description provided for @continueOffline.
  ///
  /// In en, this message translates to:
  /// **'Continue offline'**
  String get continueOffline;

  /// No description provided for @syncWhenOnline.
  ///
  /// In en, this message translates to:
  /// **'Sync when online'**
  String get syncWhenOnline;

  /// No description provided for @tooltipView.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get tooltipView;

  /// No description provided for @tooltipEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get tooltipEdit;

  /// No description provided for @tooltipDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get tooltipDelete;

  /// No description provided for @tooltipPrint.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get tooltipPrint;

  /// No description provided for @tooltipDownload.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get tooltipDownload;

  /// No description provided for @qcCheckTitle.
  ///
  /// In en, this message translates to:
  /// **'QC Check — Item #4821'**
  String get qcCheckTitle;

  /// No description provided for @palletStagingTitle.
  ///
  /// In en, this message translates to:
  /// **'Pallet staging — Zone B'**
  String get palletStagingTitle;

  /// No description provided for @signOffTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign-off — Shift end'**
  String get signOffTitle;

  /// No description provided for @confirmProceed.
  ///
  /// In en, this message translates to:
  /// **'Confirm & proceed'**
  String get confirmProceed;

  /// No description provided for @outlinedConfirm.
  ///
  /// In en, this message translates to:
  /// **'Outlined confirm'**
  String get outlinedConfirm;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBack;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @onHold.
  ///
  /// In en, this message translates to:
  /// **'On hold'**
  String get onHold;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get inProgress;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @revised.
  ///
  /// In en, this message translates to:
  /// **'Revised'**
  String get revised;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @ng.
  ///
  /// In en, this message translates to:
  /// **'NG'**
  String get ng;

  /// No description provided for @print.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get print;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @pass.
  ///
  /// In en, this message translates to:
  /// **'Pass'**
  String get pass;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @qc.
  ///
  /// In en, this message translates to:
  /// **'QC'**
  String get qc;

  /// No description provided for @fail.
  ///
  /// In en, this message translates to:
  /// **'Fail'**
  String get fail;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @rework.
  ///
  /// In en, this message translates to:
  /// **'Rework'**
  String get rework;

  /// No description provided for @scrap.
  ///
  /// In en, this message translates to:
  /// **'Scrap'**
  String get scrap;

  /// No description provided for @inbound.
  ///
  /// In en, this message translates to:
  /// **'Inbound'**
  String get inbound;

  /// No description provided for @outbound.
  ///
  /// In en, this message translates to:
  /// **'Outbound'**
  String get outbound;

  /// No description provided for @am.
  ///
  /// In en, this message translates to:
  /// **'AM'**
  String get am;

  /// No description provided for @pm.
  ///
  /// In en, this message translates to:
  /// **'PM'**
  String get pm;

  /// No description provided for @night.
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get night;

  /// No description provided for @controlCard.
  ///
  /// In en, this message translates to:
  /// **'Control Card'**
  String get controlCard;

  /// No description provided for @brakeHoseQc.
  ///
  /// In en, this message translates to:
  /// **'BRAKE HOSE QC · '**
  String get brakeHoseQc;

  /// No description provided for @signInToStartYourShift.
  ///
  /// In en, this message translates to:
  /// **'Sign in to\nstart your shift.'**
  String get signInToStartYourShift;

  /// No description provided for @tapQROrEnterEmployeeID.
  ///
  /// In en, this message translates to:
  /// **'Tap your QR badge or enter Employee ID. Role\n permissions and stage authorisation load\n automatically from the master.'**
  String get tapQROrEnterEmployeeID;

  /// No description provided for @userId.
  ///
  /// In en, this message translates to:
  /// **'User-ID'**
  String get userId;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signInBold.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN'**
  String get signInBold;

  /// No description provided for @tapYourBadge.
  ///
  /// In en, this message translates to:
  /// **'Tap your badge'**
  String get tapYourBadge;

  /// No description provided for @holdQRCode.
  ///
  /// In en, this message translates to:
  /// **'HOLD QR CODE ON EMPLOYEE ID OVER THE READER'**
  String get holdQRCode;

  /// No description provided for @readyWaitingForScan.
  ///
  /// In en, this message translates to:
  /// **'READY · WAITING FOR SCAN'**
  String get readyWaitingForScan;

  /// No description provided for @badgeNotWorking.
  ///
  /// In en, this message translates to:
  /// **'Badge not working?'**
  String get badgeNotWorking;

  /// No description provided for @typeEmployeeIDInstead.
  ///
  /// In en, this message translates to:
  /// **'Type Employee ID instead'**
  String get typeEmployeeIDInstead;

  /// No description provided for @planned.
  ///
  /// In en, this message translates to:
  /// **'PLANNED'**
  String get planned;

  /// No description provided for @taken.
  ///
  /// In en, this message translates to:
  /// **'TAKEN'**
  String get taken;

  /// No description provided for @lot.
  ///
  /// In en, this message translates to:
  /// **'LOT'**
  String get lot;

  /// No description provided for @assy.
  ///
  /// In en, this message translates to:
  /// **'ASSY'**
  String get assy;

  /// No description provided for @bomRev.
  ///
  /// In en, this message translates to:
  /// **'BOM REV'**
  String get bomRev;

  /// No description provided for @stages.
  ///
  /// In en, this message translates to:
  /// **'STAGES'**
  String get stages;

  /// No description provided for @offlineOnline.
  ///
  /// In en, this message translates to:
  /// **'OFFLINE -> ONLINE'**
  String get offlineOnline;

  /// No description provided for @controlPoints.
  ///
  /// In en, this message translates to:
  /// **'CONTROL POINTS'**
  String get controlPoints;

  /// No description provided for @resumeStageEntry.
  ///
  /// In en, this message translates to:
  /// **'Resume stage entry'**
  String get resumeStageEntry;

  /// No description provided for @openAsQcEditor.
  ///
  /// In en, this message translates to:
  /// **'Open as QC editor'**
  String get openAsQcEditor;

  /// No description provided for @resetStageBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Reset stage (breakdown)'**
  String get resetStageBreakdown;

  /// No description provided for @resumeStage.
  ///
  /// In en, this message translates to:
  /// **'Resume stage'**
  String get resumeStage;

  /// No description provided for @viewControlCard.
  ///
  /// In en, this message translates to:
  /// **'View control card'**
  String get viewControlCard;

  /// No description provided for @printPickAndPack.
  ///
  /// In en, this message translates to:
  /// **'Print pick & pack'**
  String get printPickAndPack;

  /// No description provided for @raiseBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Raise breakdown'**
  String get raiseBreakdown;

  /// No description provided for @kakotora.
  ///
  /// In en, this message translates to:
  /// **'KAKOTORA'**
  String get kakotora;

  /// No description provided for @kak.
  ///
  /// In en, this message translates to:
  /// **'KAK'**
  String get kak;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'v2.4'**
  String get appVersion;

  /// No description provided for @plant.
  ///
  /// In en, this message translates to:
  /// **'PLANT'**
  String get plant;

  /// No description provided for @plantYamato.
  ///
  /// In en, this message translates to:
  /// **'YAMATO'**
  String get plantYamato;

  /// No description provided for @line.
  ///
  /// In en, this message translates to:
  /// **'LINE'**
  String get line;

  /// No description provided for @station.
  ///
  /// In en, this message translates to:
  /// **'STATION'**
  String get station;

  /// No description provided for @sapHana.
  ///
  /// In en, this message translates to:
  /// **'SAP HANA'**
  String get sapHana;

  /// No description provided for @wifi.
  ///
  /// In en, this message translates to:
  /// **'WIFI'**
  String get wifi;

  /// No description provided for @prodCrimp.
  ///
  /// In en, this message translates to:
  /// **'PROD   CRIMP'**
  String get prodCrimp;

  /// No description provided for @navOrders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get navOrders;

  /// No description provided for @navStage.
  ///
  /// In en, this message translates to:
  /// **'Stage'**
  String get navStage;

  /// No description provided for @navScan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get navScan;

  /// No description provided for @navAlerts.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get navAlerts;

  /// No description provided for @navReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get navReports;

  /// No description provided for @bomWo.
  ///
  /// In en, this message translates to:
  /// **'WO'**
  String get bomWo;

  /// No description provided for @bomStore.
  ///
  /// In en, this message translates to:
  /// **'STORE'**
  String get bomStore;

  /// No description provided for @bomPicked.
  ///
  /// In en, this message translates to:
  /// **'PICKED'**
  String get bomPicked;

  /// No description provided for @bomWoNo.
  ///
  /// In en, this message translates to:
  /// **'WO NO'**
  String get bomWoNo;

  /// No description provided for @bomPart.
  ///
  /// In en, this message translates to:
  /// **'PART'**
  String get bomPart;

  /// No description provided for @bomAssyLot.
  ///
  /// In en, this message translates to:
  /// **'ASSY LOT'**
  String get bomAssyLot;

  /// No description provided for @bomQty.
  ///
  /// In en, this message translates to:
  /// **'QTY'**
  String get bomQty;

  /// No description provided for @bomPcs.
  ///
  /// In en, this message translates to:
  /// **'pcs'**
  String get bomPcs;

  /// No description provided for @bomPlan.
  ///
  /// In en, this message translates to:
  /// **'PLAN'**
  String get bomPlan;

  /// No description provided for @bomPriority.
  ///
  /// In en, this message translates to:
  /// **'PRIORITY'**
  String get bomPriority;

  /// No description provided for @bomTitle.
  ///
  /// In en, this message translates to:
  /// **'BILL OF MATERIALS'**
  String get bomTitle;

  /// No description provided for @bomLineItems.
  ///
  /// In en, this message translates to:
  /// **'LINE ITEMS'**
  String get bomLineItems;

  /// No description provided for @bomKitForAssembly.
  ///
  /// In en, this message translates to:
  /// **'KIT FOR 1 ASSEMBLY'**
  String get bomKitForAssembly;

  /// No description provided for @bomChildSfg.
  ///
  /// In en, this message translates to:
  /// **'CHILD   SFG'**
  String get bomChildSfg;

  /// No description provided for @bomDescription.
  ///
  /// In en, this message translates to:
  /// **'DESCRIPTION'**
  String get bomDescription;

  /// No description provided for @bomQtyUom.
  ///
  /// In en, this message translates to:
  /// **'QTY UoM'**
  String get bomQtyUom;

  /// No description provided for @bomCutBend.
  ///
  /// In en, this message translates to:
  /// **'CUT/BEND'**
  String get bomCutBend;

  /// No description provided for @bomStatus.
  ///
  /// In en, this message translates to:
  /// **'STATUS'**
  String get bomStatus;

  /// No description provided for @bomScanNow.
  ///
  /// In en, this message translates to:
  /// **'SCAN NOW'**
  String get bomScanNow;

  /// No description provided for @bomPending.
  ///
  /// In en, this message translates to:
  /// **'PENDING'**
  String get bomPending;

  /// No description provided for @bomPickingNow.
  ///
  /// In en, this message translates to:
  /// **'PICKING NOW'**
  String get bomPickingNow;

  /// No description provided for @bomCameraViewfinder.
  ///
  /// In en, this message translates to:
  /// **'camera viewfinder'**
  String get bomCameraViewfinder;

  /// No description provided for @bomKitProgress.
  ///
  /// In en, this message translates to:
  /// **'KIT PROGRESS'**
  String get bomKitProgress;

  /// No description provided for @bomOf.
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get bomOf;

  /// No description provided for @bomLines.
  ///
  /// In en, this message translates to:
  /// **'lines'**
  String get bomLines;

  /// No description provided for @sessionLockedYou.
  ///
  /// In en, this message translates to:
  /// **'SESSION LOCKED • YOU'**
  String get sessionLockedYou;

  /// No description provided for @sampleNWifiVernier.
  ///
  /// In en, this message translates to:
  /// **'sample n=5 • WiFi Vernier'**
  String get sampleNWifiVernier;

  /// No description provided for @offlineCrimping.
  ///
  /// In en, this message translates to:
  /// **'OFFLINE • CRIMPING CRM-03'**
  String get offlineCrimping;

  /// No description provided for @liveVernier.
  ///
  /// In en, this message translates to:
  /// **'LIVE • VERNIER'**
  String get liveVernier;

  /// No description provided for @firstOffGate.
  ///
  /// In en, this message translates to:
  /// **'FIRST-OFF GATE'**
  String get firstOffGate;

  /// No description provided for @awaitingTlQc.
  ///
  /// In en, this message translates to:
  /// **'Awaiting TL + QC'**
  String get awaitingTlQc;

  /// No description provided for @callQc.
  ///
  /// In en, this message translates to:
  /// **'Call QC'**
  String get callQc;

  /// No description provided for @stageLog.
  ///
  /// In en, this message translates to:
  /// **'STAGE LOG'**
  String get stageLog;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @submitStage04.
  ///
  /// In en, this message translates to:
  /// **'Submit stage 04 →'**
  String get submitStage04;

  /// No description provided for @lastReading.
  ///
  /// In en, this message translates to:
  /// **'LAST READING'**
  String get lastReading;

  /// No description provided for @standard.
  ///
  /// In en, this message translates to:
  /// **'STANDARD'**
  String get standard;

  /// No description provided for @method.
  ///
  /// In en, this message translates to:
  /// **'METHOD'**
  String get method;

  /// No description provided for @sample.
  ///
  /// In en, this message translates to:
  /// **'SAMPLE'**
  String get sample;

  /// No description provided for @withinTol.
  ///
  /// In en, this message translates to:
  /// **'WITHIN TOL'**
  String get withinTol;

  /// No description provided for @spec.
  ///
  /// In en, this message translates to:
  /// **'SPEC'**
  String get spec;

  /// No description provided for @wifiVernier5Samples.
  ///
  /// In en, this message translates to:
  /// **'WIFI VERNIER - 5 SAMPLES'**
  String get wifiVernier5Samples;

  /// No description provided for @machine.
  ///
  /// In en, this message translates to:
  /// **'MACHINE'**
  String get machine;

  /// No description provided for @jig.
  ///
  /// In en, this message translates to:
  /// **'JIG'**
  String get jig;

  /// No description provided for @roll.
  ///
  /// In en, this message translates to:
  /// **'ROLL'**
  String get roll;

  /// No description provided for @operator.
  ///
  /// In en, this message translates to:
  /// **'OPERATOR'**
  String get operator;

  /// No description provided for @firstOff.
  ///
  /// In en, this message translates to:
  /// **'FIRST-OFF'**
  String get firstOff;

  /// No description provided for @master.
  ///
  /// In en, this message translates to:
  /// **'MASTER'**
  String get master;

  /// No description provided for @live.
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get live;

  /// No description provided for @signed.
  ///
  /// In en, this message translates to:
  /// **'SIGNED'**
  String get signed;

  /// No description provided for @photoReq.
  ///
  /// In en, this message translates to:
  /// **'PHOTO REQ'**
  String get photoReq;

  /// No description provided for @inTolerance.
  ///
  /// In en, this message translates to:
  /// **'5/5 IN TOLERANCE'**
  String get inTolerance;

  /// No description provided for @crimpingDiameterEndA.
  ///
  /// In en, this message translates to:
  /// **'Crimping diameter — End A'**
  String get crimpingDiameterEndA;

  /// No description provided for @insertionMarkVisible.
  ///
  /// In en, this message translates to:
  /// **'Insertion mark visible'**
  String get insertionMarkVisible;

  /// No description provided for @crimpingAppearanceCracks.
  ///
  /// In en, this message translates to:
  /// **'Crimping appearance (cracks)'**
  String get crimpingAppearanceCracks;

  /// No description provided for @gateStatus.
  ///
  /// In en, this message translates to:
  /// **'GATE STATUS'**
  String get gateStatus;

  /// No description provided for @jigSetupDone.
  ///
  /// In en, this message translates to:
  /// **'Jig Setup - DONE'**
  String get jigSetupDone;

  /// No description provided for @quantitySetupInProgress.
  ///
  /// In en, this message translates to:
  /// **'Quantity Setup - IN PROGRESS'**
  String get quantitySetupInProgress;

  /// No description provided for @quantitySetupDone.
  ///
  /// In en, this message translates to:
  /// **'Quantity Setup - DONE'**
  String get quantitySetupDone;

  /// No description provided for @verified3of3.
  ///
  /// In en, this message translates to:
  /// **'3 of 3 verified'**
  String get verified3of3;

  /// No description provided for @verified2of3.
  ///
  /// In en, this message translates to:
  /// **'2 of 3 verified'**
  String get verified2of3;

  /// No description provided for @qualitySetupLocked.
  ///
  /// In en, this message translates to:
  /// **'Quality Setup - LOCKED'**
  String get qualitySetupLocked;

  /// No description provided for @awaitingQtyDone.
  ///
  /// In en, this message translates to:
  /// **'Awaiting Qty done'**
  String get awaitingQtyDone;

  /// No description provided for @stageSetup.
  ///
  /// In en, this message translates to:
  /// **'Stage setup'**
  String get stageSetup;

  /// No description provided for @setup2of3Qty.
  ///
  /// In en, this message translates to:
  /// **'SETUP 2 / 3 • QTY'**
  String get setup2of3Qty;

  /// No description provided for @stageLocked.
  ///
  /// In en, this message translates to:
  /// **'STAGE LOCKED'**
  String get stageLocked;

  /// No description provided for @phase1.
  ///
  /// In en, this message translates to:
  /// **'PHASE 1'**
  String get phase1;

  /// No description provided for @jigSetup.
  ///
  /// In en, this message translates to:
  /// **'Jig Setup'**
  String get jigSetup;

  /// No description provided for @statusDone.
  ///
  /// In en, this message translates to:
  /// **'DONE'**
  String get statusDone;

  /// No description provided for @phase2.
  ///
  /// In en, this message translates to:
  /// **'PHASE 2'**
  String get phase2;

  /// No description provided for @quantitySetup.
  ///
  /// In en, this message translates to:
  /// **'Quantity Setup'**
  String get quantitySetup;

  /// No description provided for @phase3.
  ///
  /// In en, this message translates to:
  /// **'PHASE 3'**
  String get phase3;

  /// No description provided for @qualitySetup.
  ///
  /// In en, this message translates to:
  /// **'Quality Setup'**
  String get qualitySetup;

  /// No description provided for @phase2of3QuantitySetup.
  ///
  /// In en, this message translates to:
  /// **'PHASE 2 OF 3 • QUANTITY SETUP'**
  String get phase2of3QuantitySetup;

  /// No description provided for @viewJigSetup.
  ///
  /// In en, this message translates to:
  /// **'View Jig setup >'**
  String get viewJigSetup;

  /// No description provided for @confirmRawInputs.
  ///
  /// In en, this message translates to:
  /// **'Confirm raw inputs and lot'**
  String get confirmRawInputs;

  /// No description provided for @hoseRollLength.
  ///
  /// In en, this message translates to:
  /// **'Hose roll length'**
  String get hoseRollLength;

  /// No description provided for @wifiScale.
  ///
  /// In en, this message translates to:
  /// **'WiFi scale'**
  String get wifiScale;

  /// No description provided for @cutCount.
  ///
  /// In en, this message translates to:
  /// **'Cut count'**
  String get cutCount;

  /// No description provided for @counter.
  ///
  /// In en, this message translates to:
  /// **'Counter'**
  String get counter;

  /// No description provided for @pcsTarget.
  ///
  /// In en, this message translates to:
  /// **'pcs target'**
  String get pcsTarget;

  /// No description provided for @hoseStamp.
  ///
  /// In en, this message translates to:
  /// **'Hose stamp'**
  String get hoseStamp;

  /// No description provided for @picture.
  ///
  /// In en, this message translates to:
  /// **'Picture'**
  String get picture;

  /// No description provided for @specValue.
  ///
  /// In en, this message translates to:
  /// **'SPEC / VALUE'**
  String get specValue;

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'VERIFIED'**
  String get verified;

  /// No description provided for @qrCapture.
  ///
  /// In en, this message translates to:
  /// **'[QR] Capture'**
  String get qrCapture;

  /// No description provided for @targetCutCount.
  ///
  /// In en, this message translates to:
  /// **'TARGET CUT COUNT'**
  String get targetCutCount;

  /// No description provided for @tapPresetNoTyping.
  ///
  /// In en, this message translates to:
  /// **'Tap a preset - no typing'**
  String get tapPresetNoTyping;

  /// No description provided for @presetMatchesWoQty.
  ///
  /// In en, this message translates to:
  /// **'Preset value matches WO planned qty. Tap +/- for fine adjust.'**
  String get presetMatchesWoQty;

  /// No description provided for @customTargetSet.
  ///
  /// In en, this message translates to:
  /// **'Custom target set. Standard WO planned qty is 200.'**
  String get customTargetSet;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'NOTE'**
  String get note;

  /// No description provided for @processTasksNote.
  ///
  /// In en, this message translates to:
  /// **'Process tasks open only after all 3 setup phases are signed off by TL and QC.'**
  String get processTasksNote;

  /// No description provided for @saveAndPause.
  ///
  /// In en, this message translates to:
  /// **'Save & pause'**
  String get saveAndPause;

  /// No description provided for @submitQuantityStartQuality.
  ///
  /// In en, this message translates to:
  /// **'Submit Quantity → start Quality'**
  String get submitQuantityStartQuality;

  /// No description provided for @qtySetupSaved.
  ///
  /// In en, this message translates to:
  /// **'Quantity setup progress saved successfully!'**
  String get qtySetupSaved;

  /// No description provided for @qtySetupSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Quantity Setup submitted! Launching Quality Setup...'**
  String get qtySetupSubmitted;

  /// No description provided for @pendingTl.
  ///
  /// In en, this message translates to:
  /// **'PENDING TL'**
  String get pendingTl;

  /// No description provided for @controlPointsLabel.
  ///
  /// In en, this message translates to:
  /// **'control points • '**
  String get controlPointsLabel;

  /// No description provided for @firstOffPending.
  ///
  /// In en, this message translates to:
  /// **'FIRST-OFF PENDING'**
  String get firstOffPending;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'ONLINE'**
  String get online;

  /// No description provided for @digitalVernier.
  ///
  /// In en, this message translates to:
  /// **'Digital Vernier'**
  String get digitalVernier;

  /// No description provided for @withinPaintLine.
  ///
  /// In en, this message translates to:
  /// **'Within paint line'**
  String get withinPaintLine;

  /// No description provided for @visually.
  ///
  /// In en, this message translates to:
  /// **'Visually'**
  String get visually;

  /// No description provided for @mm.
  ///
  /// In en, this message translates to:
  /// **'mm'**
  String get mm;

  /// No description provided for @enterManually.
  ///
  /// In en, this message translates to:
  /// **'Enter manually'**
  String get enterManually;

  /// No description provided for @torch.
  ///
  /// In en, this message translates to:
  /// **'Torch'**
  String get torch;

  /// No description provided for @holdQrInsideFrame.
  ///
  /// In en, this message translates to:
  /// **'HOLD QR INSIDE THE FRAME'**
  String get holdQrInsideFrame;

  /// No description provided for @scanOperatorBadge.
  ///
  /// In en, this message translates to:
  /// **'Scan operator badge'**
  String get scanOperatorBadge;

  /// No description provided for @stageSetupChecklist.
  ///
  /// In en, this message translates to:
  /// **'STAGE SETUP CHECKLIST'**
  String get stageSetupChecklist;

  /// No description provided for @markAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get markAllRead;

  /// No description provided for @openStage4.
  ///
  /// In en, this message translates to:
  /// **'Open stage 04'**
  String get openStage4;

  /// No description provided for @quarantinePieces.
  ///
  /// In en, this message translates to:
  /// **'Quarantine\n pieces'**
  String get quarantinePieces;

  /// No description provided for @qcSupervisor.
  ///
  /// In en, this message translates to:
  /// **'Page QC\n supervisor'**
  String get qcSupervisor;

  /// No description provided for @acknowledge.
  ///
  /// In en, this message translates to:
  /// **'Acknowledge'**
  String get acknowledge;

  /// No description provided for @pickPackPage.
  ///
  /// In en, this message translates to:
  /// **'Pick & Pack A BOM page'**
  String get pickPackPage;

  /// No description provided for @ptPressureTest.
  ///
  /// In en, this message translates to:
  /// **'Pressure Test'**
  String get ptPressureTest;

  /// No description provided for @ptKakotora.
  ///
  /// In en, this message translates to:
  /// **'KAKOTORA'**
  String get ptKakotora;

  /// No description provided for @ptLive.
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get ptLive;

  /// No description provided for @ptMachine.
  ///
  /// In en, this message translates to:
  /// **'MACHINE'**
  String get ptMachine;

  /// No description provided for @ptWifi.
  ///
  /// In en, this message translates to:
  /// **'WIFI'**
  String get ptWifi;

  /// No description provided for @ptPiece.
  ///
  /// In en, this message translates to:
  /// **'PIECE'**
  String get ptPiece;

  /// No description provided for @ptLinkOk.
  ///
  /// In en, this message translates to:
  /// **'LINK OK'**
  String get ptLinkOk;

  /// No description provided for @ptPressure.
  ///
  /// In en, this message translates to:
  /// **'PRESSURE'**
  String get ptPressure;

  /// No description provided for @ptMpa.
  ///
  /// In en, this message translates to:
  /// **'MPa'**
  String get ptMpa;

  /// No description provided for @ptSpec.
  ///
  /// In en, this message translates to:
  /// **'SPEC'**
  String get ptSpec;

  /// No description provided for @ptHoldTime.
  ///
  /// In en, this message translates to:
  /// **'HOLD TIME'**
  String get ptHoldTime;

  /// No description provided for @ptS.
  ///
  /// In en, this message translates to:
  /// **'s'**
  String get ptS;

  /// No description provided for @ptHolding.
  ///
  /// In en, this message translates to:
  /// **'HOLDING'**
  String get ptHolding;

  /// No description provided for @ptRemaining.
  ///
  /// In en, this message translates to:
  /// **'REMAINING'**
  String get ptRemaining;

  /// No description provided for @ptLeakage.
  ///
  /// In en, this message translates to:
  /// **'LEAKAGE'**
  String get ptLeakage;

  /// No description provided for @ptCm3Min.
  ///
  /// In en, this message translates to:
  /// **'cm³/min'**
  String get ptCm3Min;

  /// No description provided for @ptCc.
  ///
  /// In en, this message translates to:
  /// **'cc'**
  String get ptCc;

  /// No description provided for @ptNoLeakDetected.
  ///
  /// In en, this message translates to:
  /// **'NO LEAK DETECTED'**
  String get ptNoLeakDetected;

  /// No description provided for @ptVisualOk.
  ///
  /// In en, this message translates to:
  /// **'VISUAL OK'**
  String get ptVisualOk;

  /// No description provided for @ptSoapClear.
  ///
  /// In en, this message translates to:
  /// **'SOAP CLEAR'**
  String get ptSoapClear;

  /// No description provided for @ptPressureCurve.
  ///
  /// In en, this message translates to:
  /// **'PRESSURE CURVE'**
  String get ptPressureCurve;

  /// No description provided for @ptLotNumber.
  ///
  /// In en, this message translates to:
  /// **'LOT NUMBER'**
  String get ptLotNumber;

  /// No description provided for @ptScanned.
  ///
  /// In en, this message translates to:
  /// **'SCANNED'**
  String get ptScanned;

  /// No description provided for @ptMatchesWoLot.
  ///
  /// In en, this message translates to:
  /// **'MATCHES WO LOT'**
  String get ptMatchesWoLot;

  /// No description provided for @ptRescan.
  ///
  /// In en, this message translates to:
  /// **'Re-scan'**
  String get ptRescan;

  /// No description provided for @ptStageTally.
  ///
  /// In en, this message translates to:
  /// **'STAGE TALLY'**
  String get ptStageTally;

  /// No description provided for @ptTested.
  ///
  /// In en, this message translates to:
  /// **'TESTED'**
  String get ptTested;

  /// No description provided for @ptPending.
  ///
  /// In en, this message translates to:
  /// **'PENDING'**
  String get ptPending;

  /// No description provided for @ptPassed.
  ///
  /// In en, this message translates to:
  /// **'PASSED'**
  String get ptPassed;

  /// No description provided for @ptFailed.
  ///
  /// In en, this message translates to:
  /// **'FAILED'**
  String get ptFailed;

  /// No description provided for @ptComplete.
  ///
  /// In en, this message translates to:
  /// **'complete'**
  String get ptComplete;

  /// No description provided for @ptYield.
  ///
  /// In en, this message translates to:
  /// **'YIELD'**
  String get ptYield;

  /// No description provided for @ptLast8Pieces.
  ///
  /// In en, this message translates to:
  /// **'LAST 8 PIECES'**
  String get ptLast8Pieces;

  /// No description provided for @ptOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ptOk;

  /// No description provided for @ptNg.
  ///
  /// In en, this message translates to:
  /// **'NG'**
  String get ptNg;

  /// No description provided for @ptAutoLogging.
  ///
  /// In en, this message translates to:
  /// **'WiFi Vernier auto-logging'**
  String get ptAutoLogging;

  /// No description provided for @ptFailPiece.
  ///
  /// In en, this message translates to:
  /// **'FAIL piece'**
  String get ptFailPiece;

  /// No description provided for @ptAutoMode.
  ///
  /// In en, this message translates to:
  /// **'Auto-mode'**
  String get ptAutoMode;

  /// No description provided for @ptLogPassNextPiece.
  ///
  /// In en, this message translates to:
  /// **'Log PASS · next piece ->'**
  String get ptLogPassNextPiece;

  /// No description provided for @fiFinalInspection.
  ///
  /// In en, this message translates to:
  /// **'Final inspection · Packing · RFGen tag'**
  String get fiFinalInspection;

  /// No description provided for @fiFirstBinInProgress.
  ///
  /// In en, this message translates to:
  /// **'FIRST BIN · IN PROGRESS'**
  String get fiFirstBinInProgress;

  /// No description provided for @fiLeakageConfirmationMarking.
  ///
  /// In en, this message translates to:
  /// **'Leakage confirmation marking'**
  String get fiLeakageConfirmationMarking;

  /// No description provided for @fiBlueMarkPhotoRequired.
  ///
  /// In en, this message translates to:
  /// **'Blue mark on any one fitting · photo required'**
  String get fiBlueMarkPhotoRequired;

  /// No description provided for @fiPhotoOk.
  ///
  /// In en, this message translates to:
  /// **'Photo OK'**
  String get fiPhotoOk;

  /// No description provided for @fiFitmentVerification.
  ///
  /// In en, this message translates to:
  /// **'FITMENT VERIFICATION · MATCH FIG'**
  String get fiFitmentVerification;

  /// No description provided for @fiAssyLotNo.
  ///
  /// In en, this message translates to:
  /// **'Assy Lot No'**
  String get fiAssyLotNo;

  /// No description provided for @fiIcatTac.
  ///
  /// In en, this message translates to:
  /// **'ICAT (TAC)'**
  String get fiIcatTac;

  /// No description provided for @fiPartId.
  ///
  /// In en, this message translates to:
  /// **'Part ID'**
  String get fiPartId;

  /// No description provided for @fiNiiYmddFormat.
  ///
  /// In en, this message translates to:
  /// **'NII YMDD format'**
  String get fiNiiYmddFormat;

  /// No description provided for @fiForSlimXpHose.
  ///
  /// In en, this message translates to:
  /// **'For Slim XP hose'**
  String get fiForSlimXpHose;

  /// No description provided for @fiStampIdentMatch.
  ///
  /// In en, this message translates to:
  /// **'Stamp ident match'**
  String get fiStampIdentMatch;

  /// No description provided for @fiQrMatch.
  ///
  /// In en, this message translates to:
  /// **'QR MATCH'**
  String get fiQrMatch;

  /// No description provided for @fiPackingFormula.
  ///
  /// In en, this message translates to:
  /// **'PACKING · 20 PC x 4 BUNDLE = 80 PC / BIN'**
  String get fiPackingFormula;

  /// No description provided for @fiBinColour.
  ///
  /// In en, this message translates to:
  /// **'Bin colour: Grey with flap cover · weighing scale verified'**
  String get fiBinColour;

  /// No description provided for @fiBinsPacked.
  ///
  /// In en, this message translates to:
  /// **'3 BINS PACKED · 1 FIRST'**
  String get fiBinsPacked;

  /// No description provided for @fiBundle.
  ///
  /// In en, this message translates to:
  /// **'BUNDLE'**
  String get fiBundle;

  /// No description provided for @fiRfgenTagBundle.
  ///
  /// In en, this message translates to:
  /// **'RFGEN TAG · BUNDLE #3'**
  String get fiRfgenTagBundle;

  /// No description provided for @fiGeneratedFrom.
  ///
  /// In en, this message translates to:
  /// **'Generated from WO + Part + Lot'**
  String get fiGeneratedFrom;

  /// No description provided for @fiHitachiAstemo.
  ///
  /// In en, this message translates to:
  /// **'HITACHI ASTEMO'**
  String get fiHitachiAstemo;

  /// No description provided for @fiCcNa02R14.
  ///
  /// In en, this message translates to:
  /// **'CC NA-02 R14'**
  String get fiCcNa02R14;

  /// No description provided for @fiLotQtyBin.
  ///
  /// In en, this message translates to:
  /// **'LOT - QTY - BIN'**
  String get fiLotQtyBin;

  /// No description provided for @fiPrintPasteTag.
  ///
  /// In en, this message translates to:
  /// **'Print & paste tag'**
  String get fiPrintPasteTag;

  /// No description provided for @fiFirstBinCheck.
  ///
  /// In en, this message translates to:
  /// **'FIRST-BIN CHECK'**
  String get fiFirstBinCheck;

  /// No description provided for @fiBundleRfgenMatch.
  ///
  /// In en, this message translates to:
  /// **'Bundle & RFGen tag match (Prod Engineer)'**
  String get fiBundleRfgenMatch;

  /// No description provided for @fiMassBalance.
  ///
  /// In en, this message translates to:
  /// **'Mass-balance vs. scale (auto)'**
  String get fiMassBalance;

  /// No description provided for @fiOperatorStamp.
  ///
  /// In en, this message translates to:
  /// **'Operator stamp on bundle tag'**
  String get fiOperatorStamp;

  /// No description provided for @fiScanRfgenTag.
  ///
  /// In en, this message translates to:
  /// **'[QR] Scan RFGen tag to verify'**
  String get fiScanRfgenTag;

  /// No description provided for @fiSubmitReadyForQa.
  ///
  /// In en, this message translates to:
  /// **'Submit · ready for QA pass stamp ->'**
  String get fiSubmitReadyForQa;

  /// No description provided for @prod.
  ///
  /// In en, this message translates to:
  /// **'PROD'**
  String get prod;

  /// No description provided for @offlineProcesses.
  ///
  /// In en, this message translates to:
  /// **'Offline processes'**
  String get offlineProcesses;

  /// No description provided for @fourOfNineDone.
  ///
  /// In en, this message translates to:
  /// **'4 / 9 DONE'**
  String get fourOfNineDone;

  /// No description provided for @qrBoxTag.
  ///
  /// In en, this message translates to:
  /// **'[QR] Box tag'**
  String get qrBoxTag;

  /// No description provided for @offlineProgressSteps.
  ///
  /// In en, this message translates to:
  /// **'OFFLINE PROGRESS · 4 OF 9 STEPS'**
  String get offlineProgressSteps;

  /// No description provided for @onSchedulePercent.
  ///
  /// In en, this message translates to:
  /// **'44% - ON SCHEDULE'**
  String get onSchedulePercent;

  /// No description provided for @viewEntries.
  ///
  /// In en, this message translates to:
  /// **'View entries'**
  String get viewEntries;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue →'**
  String get continueButton;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get locked;

  /// No description provided for @awaitingPreviousStep.
  ///
  /// In en, this message translates to:
  /// **'Awaiting previous step'**
  String get awaitingPreviousStep;

  /// No description provided for @whenAllOfflineDone.
  ///
  /// In en, this message translates to:
  /// **'When all 9 offline done: scan pallet → kit ready → online assembly activates.'**
  String get whenAllOfflineDone;

  /// No description provided for @printProcessTag.
  ///
  /// In en, this message translates to:
  /// **'Print process tag'**
  String get printProcessTag;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
