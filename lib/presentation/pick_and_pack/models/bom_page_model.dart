import 'package:control_card_prototype/presentation/pick_and_pack/models/bom_item_model.dart';

/// Model that aggregates all the necessary data to render the [BomPage].
class BomPageModel {

  /// Constructor to initialize [BomPageModel].
  BomPageModel({
    required this.woNo,
    required this.partNo,
    required this.assyLot,
    required this.qty,
    required this.planDate,
    required this.priority,
    required this.items,
    this.pickingNowItem,
    required this.totalLines,
    required this.pickedLines,
    this.hasError = false,
    this.errorTitle,
    this.errorDescription,
  });
  final String woNo;
  final String partNo;
  final String assyLot;
  final int qty;
  final String planDate;
  final String priority;

  final List<BomItemModel> items;
  final BomItemModel? pickingNowItem;

  final int totalLines;
  final int pickedLines;

  final bool hasError;
  final String? errorTitle;
  final String? errorDescription;

  /// Calculates the progress of the kit picking process (0.0 to 1.0).
  double get kitProgress => totalLines > 0 ? pickedLines / totalLines : 0.0;
}

/// Mock data instance of [BomPageModel] used for UI testing and layout.
final BomPageModel mockBomPageData = BomPageModel(
  woNo: '22546041',
  partNo: '45126-K0L-DL10-M1-HAV',
  assyLot: '25-105-0042',
  qty: 200,
  planDate: '15-MAY-26',
  priority: 'P1',
  items: mockBomItems,
  pickingNowItem: mockBomItems.firstWhere(
    (BomItemModel item) => item.status == BomItemStatus.pickingNow,
  ),
  totalLines: 6,
  pickedLines: 3,
  hasError: true,
  errorTitle: 'Scanned PR0061-0400 - BOM expects PR0061-0500',
  errorDescription: 'Wrong protector length. Return box and re-pick.',
);
