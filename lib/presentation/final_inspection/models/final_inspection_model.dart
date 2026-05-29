import 'package:flutter/material.dart';

/// Master model representing the state of the Final Inspection Page.
class FinalInspectionPageModel {

  /// Creates a [FinalInspectionPageModel] with all required data.
  FinalInspectionPageModel({
    required this.stageCode,
    required this.connectionType,
    required this.workOrder,
    required this.leakage,
    required this.fitments,
    required this.packing,
    required this.tagMockup,
    required this.firstBinChecklist,
  });
  /// The current stage code (e.g., "09 / 09").
  final String stageCode;
  /// The connection status (e.g., "ONLINE").
  final String connectionType;
  /// The current work order number.
  final String workOrder;

  /// Model holding data for the leakage confirmation section.
  final LeakageConfirmationModel leakage;
  /// List of fitment data items to verify.
  final List<FitmentDataModel> fitments;
  /// Model holding data for the packing bundles section.
  final PackingModel packing;
  /// Mock data for the RFGen Tag.
  final RfgenTagModel tagMockup;
  /// Checklist items for the first-bin check.
  final List<String> firstBinChecklist;
}

/// Model representing the leakage confirmation marking requirements.
class LeakageConfirmationModel {

  /// Creates a [LeakageConfirmationModel].
  LeakageConfirmationModel({
    required this.isPhotoRequired,
    required this.isPhotoOk,
    required this.markColor,
  });
  /// Indicates if a photo is required for the leakage confirmation.
  final bool isPhotoRequired;
  /// Indicates if the photo has been successfully taken.
  final bool isPhotoOk;
  /// The color of the mark expected on the fitting.
  final Color markColor;
}

/// Model representing a fitment verification item (e.g., Assy Lot No, ICAT).
class FitmentDataModel {

  /// Creates a [FitmentDataModel].
  FitmentDataModel({
    required this.label,
    required this.value,
    required this.subValue,
    required this.isQrMatch,
  });
  /// The label for the fitment data block.
  final String label;
  /// The primary value for the fitment data block.
  final String value;
  /// A secondary description or format associated with the value.
  final String subValue;
  /// Indicates if the QR match was successful.
  final bool isQrMatch;
}

/// Represents the packing state of a bundle within a bin.
enum BundleState {
  /// The bundle is fully packed.
  filled, 
  /// The bundle is currently being packed.
  current, 
  /// The bundle has not been started.
  empty 
}

/// Model representing an individual bundle within a packing bin.
class BundleModel {

  /// Creates a [BundleModel].
  BundleModel({
    required this.id,
    required this.currentAmount,
    required this.totalAmount,
    required this.state,
  });
  /// The identifier number of the bundle.
  final int id;
  /// The current amount packed in this bundle.
  final int currentAmount;
  /// The total capacity of this bundle.
  final int totalAmount;
  /// The current state of the bundle.
  final BundleState state;
}

/// Model containing overall packing status and bin metadata.
class PackingModel {

  /// Creates a [PackingModel].
  PackingModel({
    required this.binColourDescription,
    required this.binsPacked,
    required this.firstBins,
    required this.bundles,
  });
  /// Description of the bin color and scale verification.
  final String binColourDescription;
  /// The total number of bins packed.
  final int binsPacked;
  /// The number of first bins.
  final int firstBins;
  /// The list of bundles in the current packing view.
  final List<BundleModel> bundles;
}

/// Model representing the RFGen tag generated for a specific bundle.
class RfgenTagModel {

  /// Creates an [RfgenTagModel].
  RfgenTagModel({
    required this.bundleRef,
    required this.company,
    required this.code,
    required this.partNo,
    required this.lotNo,
  });
  /// The bundle reference string.
  final String bundleRef;
  /// The company name on the tag.
  final String company;
  /// The tag code.
  final String code;
  /// The part number on the tag.
  final String partNo;
  /// The lot, quantity, and bin string.
  final String lotNo;
}

// Mock Data
final FinalInspectionPageModel mockFinalInspectionData = FinalInspectionPageModel(
  stageCode: '09 / 09',
  connectionType: 'ONLINE',
  workOrder: '22546041',
  leakage: LeakageConfirmationModel(
    isPhotoRequired: true,
    isPhotoOk: true,
    markColor: const Color(0xFF0D47A1), // Blue
  ),
  fitments: <FitmentDataModel>[
    FitmentDataModel(
      label: 'Assy Lot No',
      value: '25-105-0042',
      subValue: 'NII YMDD format',
      isQrMatch: true,
    ),
    FitmentDataModel(
      label: 'ICAT (TAC)',
      value: 'CN2222',
      subValue: 'For Slim XP hose',
      isQrMatch: true,
    ),
    FitmentDataModel(
      label: 'Part ID',
      value: '6-K0L-DE1',
      subValue: 'Stamp ident match',
      isQrMatch: true,
    ),
  ],
  packing: PackingModel(
    binColourDescription: 'Grey with flap cover · weighing scale verified',
    binsPacked: 3,
    firstBins: 1,
    bundles: <BundleModel>[
      BundleModel(id: 1, currentAmount: 20, totalAmount: 20, state: BundleState.filled),
      BundleModel(id: 2, currentAmount: 20, totalAmount: 20, state: BundleState.current),
      BundleModel(id: 3, currentAmount: 20, totalAmount: 20, state: BundleState.current),
      BundleModel(id: 4, currentAmount: 0, totalAmount: 0, state: BundleState.empty),
    ],
  ),
  tagMockup: RfgenTagModel(
    bundleRef: '#3',
    company: 'HITACHI ASTEMO',
    code: 'CC NA-02 R14',
    partNo: '45126-K0L-DL10-\nM1-HAV',
    lotNo: '6N105 - 80 - B3',
  ),
  firstBinChecklist: <String>[
    'Bundle & RFGen tag match (Prod Engineer)',
    'Mass-balance vs. scale (auto)',
    'Operator stamp on bundle tag',
  ],
);
