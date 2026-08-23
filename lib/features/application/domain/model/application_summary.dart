enum ApplicationStatus {
  draft,
  submitted,
  editRequested,
  editAllowed,
  revisionRequested,
  approved,
  rejected,
  forwarded,
  withdrawn,
}

class ApplicationSummary {
  const ApplicationSummary({
    required this.applicationId,
    required this.job,
    required this.status,
    required this.submittedAt,
    required this.updatedAt,
  });

  final int applicationId;
  final ApplicationJobSummary? job;
  final ApplicationStatus status;
  final DateTime? submittedAt;
  final DateTime updatedAt;
}

class ApplicationJobSummary {
  const ApplicationJobSummary({
    required this.jobId,
    required this.title,
    required this.companyName,
    required this.isDeleted,
  });

  final int jobId;
  final String title;
  final String? companyName;
  final bool isDeleted;
}
