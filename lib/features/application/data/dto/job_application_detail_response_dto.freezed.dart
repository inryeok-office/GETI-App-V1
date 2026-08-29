// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_application_detail_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobApplicationDetailApiResponseDto {

 bool? get success; JobApplicationDetailResponseDto? get data; ApiResponseMetaDto? get meta;

  /// Serializes this JobApplicationDetailApiResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobApplicationDetailApiResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,meta);

@override
String toString() {
  return 'JobApplicationDetailApiResponseDto(success: $success, data: $data, meta: $meta)';
}


}




/// Adds pattern-matching-related methods to [JobApplicationDetailApiResponseDto].
extension JobApplicationDetailApiResponseDtoPatterns on JobApplicationDetailApiResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobApplicationDetailApiResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobApplicationDetailApiResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobApplicationDetailApiResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _JobApplicationDetailApiResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobApplicationDetailApiResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _JobApplicationDetailApiResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  JobApplicationDetailResponseDto? data,  ApiResponseMetaDto? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobApplicationDetailApiResponseDto() when $default != null:
return $default(_that.success,_that.data,_that.meta);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  JobApplicationDetailResponseDto? data,  ApiResponseMetaDto? meta)  $default,) {final _that = this;
switch (_that) {
case _JobApplicationDetailApiResponseDto():
return $default(_that.success,_that.data,_that.meta);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  JobApplicationDetailResponseDto? data,  ApiResponseMetaDto? meta)?  $default,) {final _that = this;
switch (_that) {
case _JobApplicationDetailApiResponseDto() when $default != null:
return $default(_that.success,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobApplicationDetailApiResponseDto implements JobApplicationDetailApiResponseDto {
  const _JobApplicationDetailApiResponseDto({this.success, this.data, this.meta});
  factory _JobApplicationDetailApiResponseDto.fromJson(Map<String, dynamic> json) => _$JobApplicationDetailApiResponseDtoFromJson(json);

@override final  bool? success;
@override final  JobApplicationDetailResponseDto? data;
@override final  ApiResponseMetaDto? meta;


@override
Map<String, dynamic> toJson() {
  return _$JobApplicationDetailApiResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobApplicationDetailApiResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,meta);

@override
String toString() {
  return 'JobApplicationDetailApiResponseDto(success: $success, data: $data, meta: $meta)';
}


}





/// @nodoc
mixin _$JobApplicationDetailResponseDto {

 int? get applicationId; int? get jobId; String? get jobTitle; String? get companyName; int? get managerMemberId; String? get managerName; int? get formId; int? get formVersion;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) JobApplicationStatusDto? get status; String? get statusReason; String? get contactEmail; String? get contactPhone; bool? get privacyConsent; String? get applicantName; int? get applicantCohort; String? get applicantDepartment; List<String> get applicantMajors; String? get applicantDesiredJob; List<String> get applicantTechStacks; List<ApplicationAnswerDto> get answers; List<JobApplicationFileResponseDto> get files; DateTime? get submittedAt; DateTime? get withdrawnAt; DateTime? get createdAt; DateTime? get updatedAt; List<String> get availableActions; List<FormFieldResponseDto> get questions;

  /// Serializes this JobApplicationDetailResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobApplicationDetailResponseDto&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.managerMemberId, managerMemberId) || other.managerMemberId == managerMemberId)&&(identical(other.managerName, managerName) || other.managerName == managerName)&&(identical(other.formId, formId) || other.formId == formId)&&(identical(other.formVersion, formVersion) || other.formVersion == formVersion)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusReason, statusReason) || other.statusReason == statusReason)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.privacyConsent, privacyConsent) || other.privacyConsent == privacyConsent)&&(identical(other.applicantName, applicantName) || other.applicantName == applicantName)&&(identical(other.applicantCohort, applicantCohort) || other.applicantCohort == applicantCohort)&&(identical(other.applicantDepartment, applicantDepartment) || other.applicantDepartment == applicantDepartment)&&const DeepCollectionEquality().equals(other.applicantMajors, applicantMajors)&&(identical(other.applicantDesiredJob, applicantDesiredJob) || other.applicantDesiredJob == applicantDesiredJob)&&const DeepCollectionEquality().equals(other.applicantTechStacks, applicantTechStacks)&&const DeepCollectionEquality().equals(other.answers, answers)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.withdrawnAt, withdrawnAt) || other.withdrawnAt == withdrawnAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.availableActions, availableActions)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,applicationId,jobId,jobTitle,companyName,managerMemberId,managerName,formId,formVersion,status,statusReason,contactEmail,contactPhone,privacyConsent,applicantName,applicantCohort,applicantDepartment,const DeepCollectionEquality().hash(applicantMajors),applicantDesiredJob,const DeepCollectionEquality().hash(applicantTechStacks),const DeepCollectionEquality().hash(answers),const DeepCollectionEquality().hash(files),submittedAt,withdrawnAt,createdAt,updatedAt,const DeepCollectionEquality().hash(availableActions),const DeepCollectionEquality().hash(questions)]);

@override
String toString() {
  return 'JobApplicationDetailResponseDto(applicationId: $applicationId, jobId: $jobId, jobTitle: $jobTitle, companyName: $companyName, managerMemberId: $managerMemberId, managerName: $managerName, formId: $formId, formVersion: $formVersion, status: $status, statusReason: $statusReason, contactEmail: $contactEmail, contactPhone: $contactPhone, privacyConsent: $privacyConsent, applicantName: $applicantName, applicantCohort: $applicantCohort, applicantDepartment: $applicantDepartment, applicantMajors: $applicantMajors, applicantDesiredJob: $applicantDesiredJob, applicantTechStacks: $applicantTechStacks, answers: $answers, files: $files, submittedAt: $submittedAt, withdrawnAt: $withdrawnAt, createdAt: $createdAt, updatedAt: $updatedAt, availableActions: $availableActions, questions: $questions)';
}


}




/// Adds pattern-matching-related methods to [JobApplicationDetailResponseDto].
extension JobApplicationDetailResponseDtoPatterns on JobApplicationDetailResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobApplicationDetailResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobApplicationDetailResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobApplicationDetailResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _JobApplicationDetailResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobApplicationDetailResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _JobApplicationDetailResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? applicationId,  int? jobId,  String? jobTitle,  String? companyName,  int? managerMemberId,  String? managerName,  int? formId,  int? formVersion, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobApplicationStatusDto? status,  String? statusReason,  String? contactEmail,  String? contactPhone,  bool? privacyConsent,  String? applicantName,  int? applicantCohort,  String? applicantDepartment,  List<String> applicantMajors,  String? applicantDesiredJob,  List<String> applicantTechStacks,  List<ApplicationAnswerDto> answers,  List<JobApplicationFileResponseDto> files,  DateTime? submittedAt,  DateTime? withdrawnAt,  DateTime? createdAt,  DateTime? updatedAt,  List<String> availableActions,  List<FormFieldResponseDto> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobApplicationDetailResponseDto() when $default != null:
return $default(_that.applicationId,_that.jobId,_that.jobTitle,_that.companyName,_that.managerMemberId,_that.managerName,_that.formId,_that.formVersion,_that.status,_that.statusReason,_that.contactEmail,_that.contactPhone,_that.privacyConsent,_that.applicantName,_that.applicantCohort,_that.applicantDepartment,_that.applicantMajors,_that.applicantDesiredJob,_that.applicantTechStacks,_that.answers,_that.files,_that.submittedAt,_that.withdrawnAt,_that.createdAt,_that.updatedAt,_that.availableActions,_that.questions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? applicationId,  int? jobId,  String? jobTitle,  String? companyName,  int? managerMemberId,  String? managerName,  int? formId,  int? formVersion, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobApplicationStatusDto? status,  String? statusReason,  String? contactEmail,  String? contactPhone,  bool? privacyConsent,  String? applicantName,  int? applicantCohort,  String? applicantDepartment,  List<String> applicantMajors,  String? applicantDesiredJob,  List<String> applicantTechStacks,  List<ApplicationAnswerDto> answers,  List<JobApplicationFileResponseDto> files,  DateTime? submittedAt,  DateTime? withdrawnAt,  DateTime? createdAt,  DateTime? updatedAt,  List<String> availableActions,  List<FormFieldResponseDto> questions)  $default,) {final _that = this;
switch (_that) {
case _JobApplicationDetailResponseDto():
return $default(_that.applicationId,_that.jobId,_that.jobTitle,_that.companyName,_that.managerMemberId,_that.managerName,_that.formId,_that.formVersion,_that.status,_that.statusReason,_that.contactEmail,_that.contactPhone,_that.privacyConsent,_that.applicantName,_that.applicantCohort,_that.applicantDepartment,_that.applicantMajors,_that.applicantDesiredJob,_that.applicantTechStacks,_that.answers,_that.files,_that.submittedAt,_that.withdrawnAt,_that.createdAt,_that.updatedAt,_that.availableActions,_that.questions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? applicationId,  int? jobId,  String? jobTitle,  String? companyName,  int? managerMemberId,  String? managerName,  int? formId,  int? formVersion, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobApplicationStatusDto? status,  String? statusReason,  String? contactEmail,  String? contactPhone,  bool? privacyConsent,  String? applicantName,  int? applicantCohort,  String? applicantDepartment,  List<String> applicantMajors,  String? applicantDesiredJob,  List<String> applicantTechStacks,  List<ApplicationAnswerDto> answers,  List<JobApplicationFileResponseDto> files,  DateTime? submittedAt,  DateTime? withdrawnAt,  DateTime? createdAt,  DateTime? updatedAt,  List<String> availableActions,  List<FormFieldResponseDto> questions)?  $default,) {final _that = this;
switch (_that) {
case _JobApplicationDetailResponseDto() when $default != null:
return $default(_that.applicationId,_that.jobId,_that.jobTitle,_that.companyName,_that.managerMemberId,_that.managerName,_that.formId,_that.formVersion,_that.status,_that.statusReason,_that.contactEmail,_that.contactPhone,_that.privacyConsent,_that.applicantName,_that.applicantCohort,_that.applicantDepartment,_that.applicantMajors,_that.applicantDesiredJob,_that.applicantTechStacks,_that.answers,_that.files,_that.submittedAt,_that.withdrawnAt,_that.createdAt,_that.updatedAt,_that.availableActions,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobApplicationDetailResponseDto implements JobApplicationDetailResponseDto {
  const _JobApplicationDetailResponseDto({this.applicationId, this.jobId, this.jobTitle, this.companyName, this.managerMemberId, this.managerName, this.formId, this.formVersion, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.status, this.statusReason, this.contactEmail, this.contactPhone, this.privacyConsent, this.applicantName, this.applicantCohort, this.applicantDepartment, final  List<String> applicantMajors = const <String>[], this.applicantDesiredJob, final  List<String> applicantTechStacks = const <String>[], final  List<ApplicationAnswerDto> answers = const <ApplicationAnswerDto>[], final  List<JobApplicationFileResponseDto> files = const <JobApplicationFileResponseDto>[], this.submittedAt, this.withdrawnAt, this.createdAt, this.updatedAt, final  List<String> availableActions = const <String>[], final  List<FormFieldResponseDto> questions = const <FormFieldResponseDto>[]}): _applicantMajors = applicantMajors,_applicantTechStacks = applicantTechStacks,_answers = answers,_files = files,_availableActions = availableActions,_questions = questions;
  factory _JobApplicationDetailResponseDto.fromJson(Map<String, dynamic> json) => _$JobApplicationDetailResponseDtoFromJson(json);

@override final  int? applicationId;
@override final  int? jobId;
@override final  String? jobTitle;
@override final  String? companyName;
@override final  int? managerMemberId;
@override final  String? managerName;
@override final  int? formId;
@override final  int? formVersion;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  JobApplicationStatusDto? status;
@override final  String? statusReason;
@override final  String? contactEmail;
@override final  String? contactPhone;
@override final  bool? privacyConsent;
@override final  String? applicantName;
@override final  int? applicantCohort;
@override final  String? applicantDepartment;
 final  List<String> _applicantMajors;
@override@JsonKey() List<String> get applicantMajors {
  if (_applicantMajors is EqualUnmodifiableListView) return _applicantMajors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applicantMajors);
}

@override final  String? applicantDesiredJob;
 final  List<String> _applicantTechStacks;
@override@JsonKey() List<String> get applicantTechStacks {
  if (_applicantTechStacks is EqualUnmodifiableListView) return _applicantTechStacks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applicantTechStacks);
}

 final  List<ApplicationAnswerDto> _answers;
@override@JsonKey() List<ApplicationAnswerDto> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

 final  List<JobApplicationFileResponseDto> _files;
@override@JsonKey() List<JobApplicationFileResponseDto> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}

@override final  DateTime? submittedAt;
@override final  DateTime? withdrawnAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
 final  List<String> _availableActions;
@override@JsonKey() List<String> get availableActions {
  if (_availableActions is EqualUnmodifiableListView) return _availableActions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableActions);
}

 final  List<FormFieldResponseDto> _questions;
@override@JsonKey() List<FormFieldResponseDto> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}



@override
Map<String, dynamic> toJson() {
  return _$JobApplicationDetailResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobApplicationDetailResponseDto&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.managerMemberId, managerMemberId) || other.managerMemberId == managerMemberId)&&(identical(other.managerName, managerName) || other.managerName == managerName)&&(identical(other.formId, formId) || other.formId == formId)&&(identical(other.formVersion, formVersion) || other.formVersion == formVersion)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusReason, statusReason) || other.statusReason == statusReason)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.privacyConsent, privacyConsent) || other.privacyConsent == privacyConsent)&&(identical(other.applicantName, applicantName) || other.applicantName == applicantName)&&(identical(other.applicantCohort, applicantCohort) || other.applicantCohort == applicantCohort)&&(identical(other.applicantDepartment, applicantDepartment) || other.applicantDepartment == applicantDepartment)&&const DeepCollectionEquality().equals(other._applicantMajors, _applicantMajors)&&(identical(other.applicantDesiredJob, applicantDesiredJob) || other.applicantDesiredJob == applicantDesiredJob)&&const DeepCollectionEquality().equals(other._applicantTechStacks, _applicantTechStacks)&&const DeepCollectionEquality().equals(other._answers, _answers)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.withdrawnAt, withdrawnAt) || other.withdrawnAt == withdrawnAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._availableActions, _availableActions)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,applicationId,jobId,jobTitle,companyName,managerMemberId,managerName,formId,formVersion,status,statusReason,contactEmail,contactPhone,privacyConsent,applicantName,applicantCohort,applicantDepartment,const DeepCollectionEquality().hash(_applicantMajors),applicantDesiredJob,const DeepCollectionEquality().hash(_applicantTechStacks),const DeepCollectionEquality().hash(_answers),const DeepCollectionEquality().hash(_files),submittedAt,withdrawnAt,createdAt,updatedAt,const DeepCollectionEquality().hash(_availableActions),const DeepCollectionEquality().hash(_questions)]);

@override
String toString() {
  return 'JobApplicationDetailResponseDto(applicationId: $applicationId, jobId: $jobId, jobTitle: $jobTitle, companyName: $companyName, managerMemberId: $managerMemberId, managerName: $managerName, formId: $formId, formVersion: $formVersion, status: $status, statusReason: $statusReason, contactEmail: $contactEmail, contactPhone: $contactPhone, privacyConsent: $privacyConsent, applicantName: $applicantName, applicantCohort: $applicantCohort, applicantDepartment: $applicantDepartment, applicantMajors: $applicantMajors, applicantDesiredJob: $applicantDesiredJob, applicantTechStacks: $applicantTechStacks, answers: $answers, files: $files, submittedAt: $submittedAt, withdrawnAt: $withdrawnAt, createdAt: $createdAt, updatedAt: $updatedAt, availableActions: $availableActions, questions: $questions)';
}


}





/// @nodoc
mixin _$ApplicationAnswerDto {

 String? get fieldId; Object? get value; List<int>? get fileIds;

  /// Serializes this ApplicationAnswerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationAnswerDto&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&const DeepCollectionEquality().equals(other.value, value)&&const DeepCollectionEquality().equals(other.fileIds, fileIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fieldId,const DeepCollectionEquality().hash(value),const DeepCollectionEquality().hash(fileIds));

@override
String toString() {
  return 'ApplicationAnswerDto(fieldId: $fieldId, value: $value, fileIds: $fileIds)';
}


}




/// Adds pattern-matching-related methods to [ApplicationAnswerDto].
extension ApplicationAnswerDtoPatterns on ApplicationAnswerDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationAnswerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationAnswerDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationAnswerDto value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationAnswerDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationAnswerDto value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationAnswerDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? fieldId,  Object? value,  List<int>? fileIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationAnswerDto() when $default != null:
return $default(_that.fieldId,_that.value,_that.fileIds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? fieldId,  Object? value,  List<int>? fileIds)  $default,) {final _that = this;
switch (_that) {
case _ApplicationAnswerDto():
return $default(_that.fieldId,_that.value,_that.fileIds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? fieldId,  Object? value,  List<int>? fileIds)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationAnswerDto() when $default != null:
return $default(_that.fieldId,_that.value,_that.fileIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApplicationAnswerDto implements ApplicationAnswerDto {
  const _ApplicationAnswerDto({this.fieldId, this.value, final  List<int>? fileIds}): _fileIds = fileIds;
  factory _ApplicationAnswerDto.fromJson(Map<String, dynamic> json) => _$ApplicationAnswerDtoFromJson(json);

@override final  String? fieldId;
@override final  Object? value;
 final  List<int>? _fileIds;
@override List<int>? get fileIds {
  final value = _fileIds;
  if (value == null) return null;
  if (_fileIds is EqualUnmodifiableListView) return _fileIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}



@override
Map<String, dynamic> toJson() {
  return _$ApplicationAnswerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationAnswerDto&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&const DeepCollectionEquality().equals(other.value, value)&&const DeepCollectionEquality().equals(other._fileIds, _fileIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fieldId,const DeepCollectionEquality().hash(value),const DeepCollectionEquality().hash(_fileIds));

@override
String toString() {
  return 'ApplicationAnswerDto(fieldId: $fieldId, value: $value, fileIds: $fileIds)';
}


}





/// @nodoc
mixin _$JobApplicationFileResponseDto {

 int? get fileId; String? get originalName; String? get contentType; int? get size; String? get downloadUrl;

  /// Serializes this JobApplicationFileResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobApplicationFileResponseDto&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.size, size) || other.size == size)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId,originalName,contentType,size,downloadUrl);

@override
String toString() {
  return 'JobApplicationFileResponseDto(fileId: $fileId, originalName: $originalName, contentType: $contentType, size: $size, downloadUrl: $downloadUrl)';
}


}




/// Adds pattern-matching-related methods to [JobApplicationFileResponseDto].
extension JobApplicationFileResponseDtoPatterns on JobApplicationFileResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobApplicationFileResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobApplicationFileResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobApplicationFileResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _JobApplicationFileResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobApplicationFileResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _JobApplicationFileResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? fileId,  String? originalName,  String? contentType,  int? size,  String? downloadUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobApplicationFileResponseDto() when $default != null:
return $default(_that.fileId,_that.originalName,_that.contentType,_that.size,_that.downloadUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? fileId,  String? originalName,  String? contentType,  int? size,  String? downloadUrl)  $default,) {final _that = this;
switch (_that) {
case _JobApplicationFileResponseDto():
return $default(_that.fileId,_that.originalName,_that.contentType,_that.size,_that.downloadUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? fileId,  String? originalName,  String? contentType,  int? size,  String? downloadUrl)?  $default,) {final _that = this;
switch (_that) {
case _JobApplicationFileResponseDto() when $default != null:
return $default(_that.fileId,_that.originalName,_that.contentType,_that.size,_that.downloadUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobApplicationFileResponseDto implements JobApplicationFileResponseDto {
  const _JobApplicationFileResponseDto({this.fileId, this.originalName, this.contentType, this.size, this.downloadUrl});
  factory _JobApplicationFileResponseDto.fromJson(Map<String, dynamic> json) => _$JobApplicationFileResponseDtoFromJson(json);

@override final  int? fileId;
@override final  String? originalName;
@override final  String? contentType;
@override final  int? size;
@override final  String? downloadUrl;


@override
Map<String, dynamic> toJson() {
  return _$JobApplicationFileResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobApplicationFileResponseDto&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.size, size) || other.size == size)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId,originalName,contentType,size,downloadUrl);

@override
String toString() {
  return 'JobApplicationFileResponseDto(fileId: $fileId, originalName: $originalName, contentType: $contentType, size: $size, downloadUrl: $downloadUrl)';
}


}





/// @nodoc
mixin _$FormFieldResponseDto {

 String? get fieldId;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) FormFieldTypeDto? get type; String? get title; String? get description;@JsonKey(name: 'required') bool? get isRequired; int? get order; List<String>? get options; Object? get filePolicy;

  /// Serializes this FormFieldResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormFieldResponseDto&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.filePolicy, filePolicy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fieldId,type,title,description,isRequired,order,const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(filePolicy));

@override
String toString() {
  return 'FormFieldResponseDto(fieldId: $fieldId, type: $type, title: $title, description: $description, isRequired: $isRequired, order: $order, options: $options, filePolicy: $filePolicy)';
}


}




/// Adds pattern-matching-related methods to [FormFieldResponseDto].
extension FormFieldResponseDtoPatterns on FormFieldResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormFieldResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormFieldResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormFieldResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _FormFieldResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormFieldResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _FormFieldResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? fieldId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  FormFieldTypeDto? type,  String? title,  String? description, @JsonKey(name: 'required')  bool? isRequired,  int? order,  List<String>? options,  Object? filePolicy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormFieldResponseDto() when $default != null:
return $default(_that.fieldId,_that.type,_that.title,_that.description,_that.isRequired,_that.order,_that.options,_that.filePolicy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? fieldId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  FormFieldTypeDto? type,  String? title,  String? description, @JsonKey(name: 'required')  bool? isRequired,  int? order,  List<String>? options,  Object? filePolicy)  $default,) {final _that = this;
switch (_that) {
case _FormFieldResponseDto():
return $default(_that.fieldId,_that.type,_that.title,_that.description,_that.isRequired,_that.order,_that.options,_that.filePolicy);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? fieldId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  FormFieldTypeDto? type,  String? title,  String? description, @JsonKey(name: 'required')  bool? isRequired,  int? order,  List<String>? options,  Object? filePolicy)?  $default,) {final _that = this;
switch (_that) {
case _FormFieldResponseDto() when $default != null:
return $default(_that.fieldId,_that.type,_that.title,_that.description,_that.isRequired,_that.order,_that.options,_that.filePolicy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormFieldResponseDto implements FormFieldResponseDto {
  const _FormFieldResponseDto({this.fieldId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.type, this.title, this.description, @JsonKey(name: 'required') this.isRequired, this.order, final  List<String>? options, this.filePolicy}): _options = options;
  factory _FormFieldResponseDto.fromJson(Map<String, dynamic> json) => _$FormFieldResponseDtoFromJson(json);

@override final  String? fieldId;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  FormFieldTypeDto? type;
@override final  String? title;
@override final  String? description;
@override@JsonKey(name: 'required') final  bool? isRequired;
@override final  int? order;
 final  List<String>? _options;
@override List<String>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Object? filePolicy;


@override
Map<String, dynamic> toJson() {
  return _$FormFieldResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormFieldResponseDto&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other.filePolicy, filePolicy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fieldId,type,title,description,isRequired,order,const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(filePolicy));

@override
String toString() {
  return 'FormFieldResponseDto(fieldId: $fieldId, type: $type, title: $title, description: $description, isRequired: $isRequired, order: $order, options: $options, filePolicy: $filePolicy)';
}


}




// dart format on
