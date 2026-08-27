class ApiResponseProgramListResponse {
  const ApiResponseProgramListResponse({
    required this.success,
    this.data,
    this.meta,
  });

  factory ApiResponseProgramListResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponseProgramListResponse(
      success: json['success'] as bool? ?? false,
      data: json['data'] == null
          ? null
          : ProgramListResponse.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  final bool success;
  final ProgramListResponse? data;
  final ResponseMeta? meta;
}

class ResponseMeta {
  const ResponseMeta({this.requestId});

  factory ResponseMeta.fromJson(Map<String, dynamic> json) {
    return ResponseMeta(requestId: json['requestId'] as String?);
  }

  final String? requestId;
}

class ProgramListResponse {
  const ProgramListResponse({
    required this.content,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.first,
    required this.last,
  });

  factory ProgramListResponse.fromJson(Map<String, dynamic> json) {
    return ProgramListResponse(
      content:
          (json['content'] as List<dynamic>?)
              ?.map(
                (item) => ProgramSummaryResponse.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList(growable: false) ??
          const [],
      page: json['page'] as int? ?? 0,
      size: json['size'] as int? ?? 0,
      totalElements: json['totalElements'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
      first: json['first'] as bool? ?? true,
      last: json['last'] as bool? ?? true,
    );
  }

  final List<ProgramSummaryResponse> content;
  final int page;
  final int size;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;
}

class ProgramSummaryResponse {
  const ProgramSummaryResponse({
    required this.programId,
    required this.title,
    required this.programType,
    required this.status,
    this.location,
    this.startAt,
    this.endAt,
    this.applicationStartAt,
    this.applicationEndAt,
    this.capacity,
    this.currentApplicants = 0,
    this.remainingCapacity,
    this.firstComeServed = false,
    this.applied = false,
  });

  factory ProgramSummaryResponse.fromJson(Map<String, dynamic> json) {
    return ProgramSummaryResponse(
      programId: json['programId'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      programType: json['programType'] as String? ?? '',
      status: json['status'] as String? ?? '',
      location: json['location'] as String?,
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
      applied: json['applied'] as bool? ?? false,
    );
  }

  final int programId;
  final String title;
  final String programType;
  final String status;
  final String? location;
  final DateTime? startAt;
  final DateTime? endAt;
  final DateTime? applicationStartAt;
  final DateTime? applicationEndAt;
  final int? capacity;
  final int currentApplicants;
  final int? remainingCapacity;
  final bool firstComeServed;
  final bool applied;
}
