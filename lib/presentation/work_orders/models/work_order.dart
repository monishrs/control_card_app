class WorkOrder { // Added detailed stages for the left panel

  WorkOrder({
    required this.id,
    required this.priority,
    required this.status,
    required this.partNumber,
    required this.partName,
    required this.description,
    required this.cc,
    required this.r,
    required this.planned,
    required this.lot,
    required this.line,
    required this.taken,
    required this.ok,
    required this.ng,
    required this.yieldPercentage,
    this.assy = '',
    this.bomRev = '',
    required this.currentStageName,
    required this.currentStageIndex,
    required this.totalStages,
    required this.stageProgressPercentage,
    required this.pipeline,
    required this.hoseRolls,
    required this.recentNgs,
    this.detailedStages = const <DetailedStage>[],
  });
  final String id;
  final String priority;
  final String status; // 'RUNNING', 'WAITING'
  final String partNumber;
  final String partName;
  final String description;
  final String cc;
  final String r;
  final int planned;
  final String lot;
  final String line;
  final int taken;
  final int ok;
  final int ng;
  final double yieldPercentage;
  final String assy; // Added Assy field
  final String bomRev; // Added BOM REV field
  final String currentStageName;
  final int currentStageIndex;
  final int totalStages;
  final double stageProgressPercentage;
  final List<StagePipeline> pipeline;
  final List<HoseRoll> hoseRolls;
  final List<NgIssue> recentNgs;
  final List<DetailedStage>
  detailedStages;
}

class DetailedStage {

  DetailedStage({
    required this.id,
    required this.name,
    this.assigneeInfo = '',
    required this.status,
    this.isOffline = false,
    this.hasKakotora = false,
    this.isGate = false,
    this.requirements = const <RequirementCard>[],
    this.controlPoints = const <ControlPoint>[],
  });
  final String id;
  final String name;
  final String assigneeInfo; // e.g. "ARM81 . Arman . 08:14 . 22m"
  final String status; // 'done', 'active', 'upcoming'
  final bool isOffline;
  final bool hasKakotora;
  final bool isGate;
  final List<RequirementCard> requirements;
  final List<ControlPoint> controlPoints;
}

class RequirementCard {

  RequirementCard({
    required this.type,
    required this.value,
    this.isWarning = false,
  });
  final String type; // e.g. "MACHINE", "JIG"
  final String value;
  final bool isWarning;
}

class ControlPoint {

  ControlPoint({
    required this.id,
    required this.title,
    required this.method,
    required this.spec,
    required this.value,
    required this.isOk,
    this.hasKakotora = false,
    required this.okCount,
    required this.ngCount,
  });
  final String id;
  final String title;
  final String method; // e.g. "Digital Vernier"
  final String spec;
  final String value;
  final bool isOk;
  final bool hasKakotora;
  final int okCount;
  final int ngCount;
}

class StagePipeline { // 'done', 'active', 'upcoming'

  StagePipeline({required this.name, required this.id, required this.status});
  final String name;
  final String id;
  final String status;
}

class HoseRoll {

  HoseRoll({
    required this.id,
    required this.name,
    required this.checkedBy,
    required this.usage,
  });
  final String id;
  final String name;
  final String checkedBy;
  final String usage;
}

class NgIssue {

  NgIssue({
    required this.time,
    required this.issue,
    required this.details,
    required this.checkedBy,
    required this.value,
    this.isWarning = true,
  });
  final String time;
  final String issue;
  final String details;
  final String checkedBy;
  final String value;
  final bool isWarning;
}
