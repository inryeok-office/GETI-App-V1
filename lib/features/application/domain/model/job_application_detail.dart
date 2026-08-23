import 'package:geti_app/features/application/domain/model/application_summary.dart';

enum ApplicationQuestionType { text, textarea, singleSelect, multiSelect, file }

class JobApplicationDetail {
  const JobApplicationDetail({
    required this.applicationId,
    required this.jobId,
    required this.jobTitle,
    required this.companyName,
    required this.managerMemberId,
    required this.managerName,
    required this.formId,
    required this.formVersion,
    required this.status,
    required this.statusReason,
    required this.contactEmail,
    required this.contactPhone,
    required this.privacyConsent,
    required this.applicantName,
    required this.applicantCohort,
    required this.applicantDepartment,
    required this.applicantMajors,
    required this.applicantDesiredJob,
    required this.applicantTechStacks,
    required this.answers,
    required this.files,
    required this.submittedAt,
    required this.withdrawnAt,
    required this.createdAt,
    required this.updatedAt,
    required this.availableActions,
    required this.questions,
  });

  final int applicationId;
  final int? jobId;
  final String? jobTitle;
  final String? companyName;
  final int? managerMemberId;
  final String? managerName;
  final int? formId;
  final int? formVersion;
  final ApplicationStatus status;
  final String? statusReason;
  final String? contactEmail;
  final String? contactPhone;
  final bool? privacyConsent;
  final String? applicantName;
  final int? applicantCohort;
  final String? applicantDepartment;
  final List<String> applicantMajors;
  final String? applicantDesiredJob;
  final List<String> applicantTechStacks;
  final List<JobApplicationAnswer> answers;
  final List<JobApplicationFile> files;
  final DateTime? submittedAt;
  final DateTime? withdrawnAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String> availableActions;
  final List<JobApplicationQuestion> questions;
}

class JobApplicationAnswer {
  const JobApplicationAnswer({
    required this.fieldId,
    required this.value,
    required this.fileIds,
  });

  final String? fieldId;
  final Object? value;
  final List<int>? fileIds;
}

class JobApplicationFile {
  const JobApplicationFile({
    required this.fileId,
    required this.originalName,
    required this.contentType,
    required this.size,
    required this.downloadUrl,
  });

  final int? fileId;
  final String? originalName;
  final String? contentType;
  final int? size;
  final String? downloadUrl;
}

class JobApplicationQuestion {
  const JobApplicationQuestion({
    required this.fieldId,
    required this.type,
    required this.title,
    required this.description,
    required this.isRequired,
    required this.order,
    required this.options,
    required this.filePolicy,
  });

  final String? fieldId;
  final ApplicationQuestionType? type;
  final String? title;
  final String? description;
  final bool? isRequired;
  final int? order;
  final List<String>? options;
  final Object? filePolicy;
}
