import 'package:flutter/material.dart';

class PressureTestPageModel {

  PressureTestPageModel({
    required this.stageCode,
    required this.connectionType,
    required this.workOrder,
    required this.machineId,
    required this.wifiStatus,
    required this.currentPiece,
    required this.totalPieces,
    required this.linkStatus,
    required this.currentPressure,
    required this.pressureSpec,
    required this.holdTimeCurrent,
    required this.holdTimeTotal,
    required this.leakage,
    required this.isVisualOk,
    required this.isSoapClear,
    required this.lotNumber,
    required this.lotDescription,
    required this.isLotMatched,
    required this.tally,
    required this.lastPieces,
  });
  final String stageCode;
  final String connectionType;
  final String workOrder;
  final String machineId;
  final String wifiStatus;
  final int currentPiece;
  final int totalPieces;
  final String linkStatus;
  
  final double currentPressure;
  final String pressureSpec;
  
  final int holdTimeCurrent;
  final int holdTimeTotal;
  
  final double leakage;
  
  final bool isVisualOk;
  final bool isSoapClear;
  
  final String lotNumber;
  final String lotDescription;
  final bool isLotMatched;

  final StageTallyModel tally;
  final List<PieceTestModel> lastPieces;
}

class StageTallyModel {

  StageTallyModel({
    required this.tested,
    required this.pending,
    required this.passed,
    required this.failed,
    required this.completePercentage,
    required this.yieldPercentage,
  });
  final int tested;
  final int pending;
  final int passed;
  final int failed;
  final double completePercentage;
  final double yieldPercentage;
}

class PieceTestModel {

  PieceTestModel({
    required this.pieceId,
    required this.pressure,
    required this.time,
    required this.isOk,
  });
  final String pieceId;
  final double pressure;
  final int time;
  final bool isOk;
}

// Mock Data
final PressureTestPageModel mockPressureTestData = PressureTestPageModel(
  stageCode: '07',
  connectionType: 'ONLINE',
  workOrder: 'WO-2025-0381',
  machineId: 'PT-02',
  wifiStatus: 'WIFI',
  currentPiece: 47,
  totalPieces: 145,
  linkStatus: 'LINK OK - 50 Hz',
  currentPressure: 15.4,
  pressureSpec: '15.2 +1.0 / -0',
  holdTimeCurrent: 28,
  holdTimeTotal: 36,
  leakage: 0.0,
  isVisualOk: true,
  isSoapClear: true,
  lotNumber: '6N105',
  lotDescription: 'NII 6N105',
  isLotMatched: true,
  tally: StageTallyModel(
    tested: 98,
    pending: 47,
    passed: 96,
    failed: 2,
    completePercentage: 66.0,
    yieldPercentage: 98.0,
  ),
  lastPieces: <PieceTestModel>[
    PieceTestModel(pieceId: '#47', pressure: 15.4, time: 36, isOk: true),
    PieceTestModel(pieceId: '#46', pressure: 15.3, time: 36, isOk: true),
    PieceTestModel(pieceId: '#45', pressure: 15.6, time: 36, isOk: true),
    PieceTestModel(pieceId: '#44', pressure: 14.9, time: 36, isOk: false),
    PieceTestModel(pieceId: '#43', pressure: 15.4, time: 36, isOk: true),
    PieceTestModel(pieceId: '#42', pressure: 15.5, time: 36, isOk: true),
    PieceTestModel(pieceId: '#41', pressure: 15.2, time: 36, isOk: true),
    PieceTestModel(pieceId: '#40', pressure: 15.4, time: 36, isOk: true),
  ],
);
