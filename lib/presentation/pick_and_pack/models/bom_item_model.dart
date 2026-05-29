/// Model representing a single item in the BOM list.
class BomItemModel {

  /// Creates a [BomItemModel] with the required details.
  BomItemModel({
    required this.childPart,
    required this.childDescription,
    required this.sfgPart,
    required this.description,
    required this.qty,
    required this.uom,
    required this.cutBend,
    required this.status,
    this.badgeText,
  });
  final String childPart;
  final String childDescription;
  final String sfgPart;
  final String description;
  final double qty;
  final String uom;
  final String cutBend;
  final BomItemStatus status;
  final String? badgeText;
}

/// Represents the current picking status of a BOM item.
enum BomItemStatus { 
  /// The item has been successfully picked.
  picked, 
  /// The item is currently being picked.
  pickingNow, 
  /// The item has not been picked yet.
  pending 
}

/// Mock data for BOM items to be used in the UI during development.
final List<BomItemModel> mockBomItems = <BomItemModel>[
  BomItemModel(
    childPart: '05-0030-015-00-000',
    childDescription: '05-0030-015-00-000005',
    sfgPart: 'SFG',
    description: 'Hose · 6mm × 885mm',
    qty: 0.885,
    uom: 'm',
    cutBend: 'C-885',
    status: BomItemStatus.picked,
    badgeText: 'BX-44218',
  ),
  BomItemModel(
    childPart: 'K40543-00000-C3',
    childDescription: 'K40543-40115',
    sfgPart: 'SFG',
    description: 'Fitting · banjo · 40° bend',
    qty: 1,
    uom: 'pc',
    cutBend: 'B-40115',
    status: BomItemStatus.picked,
    badgeText: 'BX-44219',
  ),
  BomItemModel(
    childPart: 'K40543-00000-C3',
    childDescription: 'K40543-30120',
    sfgPart: 'SFG',
    description: 'Fitting · eye · 30° bend · CN2222',
    qty: 1,
    uom: 'pc',
    cutBend: 'B-30120',
    status: BomItemStatus.picked,
    badgeText: 'BX-44220',
  ),
  BomItemModel(
    childPart: 'PR0061-0000',
    childDescription: 'PR0061-0500',
    sfgPart: 'SFG',
    description: 'Protector (PVC) · 500mm',
    qty: 0.500,
    uom: 'm',
    cutBend: 'C-500',
    status: BomItemStatus.pickingNow,
  ),
  BomItemModel(
    childPart: 'PR0157-0000',
    childDescription: 'PR0157-0170',
    sfgPart: 'SFG',
    description: 'Protector (NYLON) -\n170mm',
    qty: 0.170,
    uom: 'm',
    cutBend: 'C-170',
    status: BomItemStatus.pending,
  ),
  BomItemModel(
    childPart: 'BU10024-01000',
    childDescription: 'BU10024-01000',
    sfgPart: 'SFG',
    description: 'Bush (Kanban)',
    qty: 2,
    uom: 'pc',
    cutBend: '-',
    status: BomItemStatus.pending,
  ),
];
