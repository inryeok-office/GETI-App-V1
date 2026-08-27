import 'package:geti_app/features/program/data/dto/program_list_response.dart';

class ApiResponseProgramDetailResponse {
  const ApiResponseProgramDetailResponse({
    required this.success,
    this.data,
    this.meta,
  });

  factory ApiResponseProgramDetailResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponseProgramDetailResponse(
      success: json['success'] as bool? ?? false,
      data: json['data'] == null
          ? null
          : ProgramDetailResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      meta: json['meta'] == null
          ? null
          : ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  final bool success;
  final ProgramDetailResponse? data;
  final ResponseMeta? meta;
}

class ProgramDetailResponse {
  const ProgramDetailResponse({
    required this.programId,
    required this.title,
    required this.programType,
    required this.targetGrades,
    required this.currentApplicants,
    required this.firstComeServed,
    required this.canApply,
    required this.eligibilityReason,
    required this.eligibilityMessage,
    required this.availableActions,
    required this.canSubscribeVacancy,
    required this.vacancySubscribed,
    required this.status,
    required this.files,
    this.content,
    this.location,
    this.startAt,
    this.endAt,
    this.applicationStartAt,
    this.applicationEndAt,
    this.capacity,
    this.remainingCapacity,
    this.vacancySubscriptionStatus,
  });

  factory ProgramDetailResponse.fromJson(Map<String, dynamic> json) {
    return ProgramDetailResponse(
      programId: json['programId'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      content: json['content'] as String?,
      location: json['location'] as String?,
      programType: json['programType'] as String? ?? '',
      targetGrades:
          (json['targetGrades'] as List<dynamic>?)?.whereType<int>().toList(
            growable: false,
          ) ??
          const [],
      startAt: DateTime.tryParse(json['startAt'] as String? ?? ''),
      endAt: DateTime.tryParse(json['endAt'] as String? ?? ''),
      applicationStartAt: DateTime.tryParse(
        json['applicationStartAt'] as String? ?? '',
      ),
      applicationEndAt: DateTime.tryParse(
        json['applicationEndAt'] as String? ?? '',
      ),
      capacity: json['capacity'] as int?,
      currentApplicants: json['currentApplicants'] as int? ?? 0,
      remainingCapacity: json['remainingCapacity'] as int?,
      firstComeServed: json['firstComeServed'] as bool? ?? false,
      canApply: json['canApply'] as bool? ?? false,
      eligibilityReason: json['eligibilityReason'] as String? ?? '',
      eligibilityMessage: json['eligibilityMessage'] as String? ?? '',
      availableActions:
          (json['availableActions'] as List<dynamic>?)
              ?.whereType<String>()
              .toList(growable: false) ??
          const [],
      canSubscribeVacancy: json['canSubscribeVacancy'] as bool? ?? false,
      vacancySubscribed: json['vacancySubscribed'] as bool? ?? false,
      vacancySubscriptionStatus: json['vacancySubscriptionStatus'] as String?,
      status: json['status'] as String? ?? '',
      files:
          (json['files'] as List<dynamic>?)
              ?.map(
                (item) =>
                    ProgramFileResponse.fromJson(item as Map<String, dynamic>),
              )
              .toList(growable: false) ??
          const [],
    );
  }

  final int programId;
  final String title;
  final String? content;
  final String? location;
  final String programType;
  final List<int> targetGrades;
  final DateTime? startAt;
  final DateTime? endAt;
  final DateTime? applicationStartAt;
  final DateTime? applicationEndAt;
  final int? capacity;
  final int currentApplicants;
  final int? remainingCapacity;
  final bool firstComeServed;
  final bool canApply;
  final String eligibilityReason;
  final String eligibilityMessage;
  final List<String> availableActions;
  final bool canSubscribeVacancy;
  final bool vacancySubscribed;
  final String? vacancySubscriptionStatus;
  final String status;
  final List<ProgramFileResponse> files;
}

class ProgramFileResponse {
  const ProgramFileResponse({
    required this.fileId,
    required this.originalName,
    required this.contentType,
    required this.size,
    required this.downloadUrl,
  });

  factory ProgramFileResponse.fromJson(Map<String, dynamic> json) {
    return ProgramFileResponse(
      fileId: json['fileId'] as int? ?? 0,
      originalName: json['originalName'] as String? ?? '',
      contentType: json['contentType'] as String? ?? '',
      size: json['size'] as int? ?? 0,
      downloadUrl: json['downloadUrl'] as String? ?? '',
    );
  }

  final int fileId;
  final String originalName;
  final String contentType;
  final int size;
  final String downloadUrl;
}
