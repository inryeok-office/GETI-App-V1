// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanySummaryDto {

 int get companyId; String get name; String? get logoUrl;
/// Create a copy of CompanySummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanySummaryDtoCopyWith<CompanySummaryDto> get copyWith => _$CompanySummaryDtoCopyWithImpl<CompanySummaryDto>(this as CompanySummaryDto, _$identity);

  /// Serializes this CompanySummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanySummaryDto&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyId,name,logoUrl);

@override
String toString() {
  return 'CompanySummaryDto(companyId: $companyId, name: $name, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class $CompanySummaryDtoCopyWith<$Res>  {
  factory $CompanySummaryDtoCopyWith(CompanySummaryDto value, $Res Function(CompanySummaryDto) _then) = _$CompanySummaryDtoCopyWithImpl;
@useResult
$Res call({
 int companyId, String name, String? logoUrl
});




}
/// @nodoc
class _$CompanySummaryDtoCopyWithImpl<$Res>
    implements $CompanySummaryDtoCopyWith<$Res> {
  _$CompanySummaryDtoCopyWithImpl(this._self, this._then);

  final CompanySummaryDto _self;
  final $Res Function(CompanySummaryDto) _then;

/// Create a copy of CompanySummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyId = null,Object? name = null,Object? logoUrl = freezed,}) {
  return _then(_self.copyWith(
companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanySummaryDto].
extension CompanySummaryDtoPatterns on CompanySummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanySummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanySummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanySummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _CompanySummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanySummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _CompanySummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int companyId,  String name,  String? logoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanySummaryDto() when $default != null:
return $default(_that.companyId,_that.name,_that.logoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int companyId,  String name,  String? logoUrl)  $default,) {final _that = this;
switch (_that) {
case _CompanySummaryDto():
return $default(_that.companyId,_that.name,_that.logoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int companyId,  String name,  String? logoUrl)?  $default,) {final _that = this;
switch (_that) {
case _CompanySummaryDto() when $default != null:
return $default(_that.companyId,_that.name,_that.logoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanySummaryDto implements CompanySummaryDto {
  const _CompanySummaryDto({required this.companyId, required this.name, this.logoUrl});
  factory _CompanySummaryDto.fromJson(Map<String, dynamic> json) => _$CompanySummaryDtoFromJson(json);

@override final  int companyId;
@override final  String name;
@override final  String? logoUrl;

/// Create a copy of CompanySummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanySummaryDtoCopyWith<_CompanySummaryDto> get copyWith => __$CompanySummaryDtoCopyWithImpl<_CompanySummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanySummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanySummaryDto&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyId,name,logoUrl);

@override
String toString() {
  return 'CompanySummaryDto(companyId: $companyId, name: $name, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class _$CompanySummaryDtoCopyWith<$Res> implements $CompanySummaryDtoCopyWith<$Res> {
  factory _$CompanySummaryDtoCopyWith(_CompanySummaryDto value, $Res Function(_CompanySummaryDto) _then) = __$CompanySummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 int companyId, String name, String? logoUrl
});




}
/// @nodoc
class __$CompanySummaryDtoCopyWithImpl<$Res>
    implements _$CompanySummaryDtoCopyWith<$Res> {
  __$CompanySummaryDtoCopyWithImpl(this._self, this._then);

  final _CompanySummaryDto _self;
  final $Res Function(_CompanySummaryDto) _then;

/// Create a copy of CompanySummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyId = null,Object? name = null,Object? logoUrl = freezed,}) {
  return _then(_CompanySummaryDto(
companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$JobEligibilitySnapshotDto {

 bool get canApply; String get eligibilityReason; String get eligibilityMessage; int? get applicationId; String? get applicationStatus; List<String> get availableActions;
/// Create a copy of JobEligibilitySnapshotDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobEligibilitySnapshotDtoCopyWith<JobEligibilitySnapshotDto> get copyWith => _$JobEligibilitySnapshotDtoCopyWithImpl<JobEligibilitySnapshotDto>(this as JobEligibilitySnapshotDto, _$identity);

  /// Serializes this JobEligibilitySnapshotDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobEligibilitySnapshotDto&&(identical(other.canApply, canApply) || other.canApply == canApply)&&(identical(other.eligibilityReason, eligibilityReason) || other.eligibilityReason == eligibilityReason)&&(identical(other.eligibilityMessage, eligibilityMessage) || other.eligibilityMessage == eligibilityMessage)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.applicationStatus, applicationStatus) || other.applicationStatus == applicationStatus)&&const DeepCollectionEquality().equals(other.availableActions, availableActions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canApply,eligibilityReason,eligibilityMessage,applicationId,applicationStatus,const DeepCollectionEquality().hash(availableActions));

@override
String toString() {
  return 'JobEligibilitySnapshotDto(canApply: $canApply, eligibilityReason: $eligibilityReason, eligibilityMessage: $eligibilityMessage, applicationId: $applicationId, applicationStatus: $applicationStatus, availableActions: $availableActions)';
}


}

/// @nodoc
abstract mixin class $JobEligibilitySnapshotDtoCopyWith<$Res>  {
  factory $JobEligibilitySnapshotDtoCopyWith(JobEligibilitySnapshotDto value, $Res Function(JobEligibilitySnapshotDto) _then) = _$JobEligibilitySnapshotDtoCopyWithImpl;
@useResult
$Res call({
 bool canApply, String eligibilityReason, String eligibilityMessage, int? applicationId, String? applicationStatus, List<String> availableActions
});




}
/// @nodoc
class _$JobEligibilitySnapshotDtoCopyWithImpl<$Res>
    implements $JobEligibilitySnapshotDtoCopyWith<$Res> {
  _$JobEligibilitySnapshotDtoCopyWithImpl(this._self, this._then);

  final JobEligibilitySnapshotDto _self;
  final $Res Function(JobEligibilitySnapshotDto) _then;

/// Create a copy of JobEligibilitySnapshotDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canApply = null,Object? eligibilityReason = null,Object? eligibilityMessage = null,Object? applicationId = freezed,Object? applicationStatus = freezed,Object? availableActions = null,}) {
  return _then(_self.copyWith(
canApply: null == canApply ? _self.canApply : canApply // ignore: cast_nullable_to_non_nullable
as bool,eligibilityReason: null == eligibilityReason ? _self.eligibilityReason : eligibilityReason // ignore: cast_nullable_to_non_nullable
as String,eligibilityMessage: null == eligibilityMessage ? _self.eligibilityMessage : eligibilityMessage // ignore: cast_nullable_to_non_nullable
as String,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as int?,applicationStatus: freezed == applicationStatus ? _self.applicationStatus : applicationStatus // ignore: cast_nullable_to_non_nullable
as String?,availableActions: null == availableActions ? _self.availableActions : availableActions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [JobEligibilitySnapshotDto].
extension JobEligibilitySnapshotDtoPatterns on JobEligibilitySnapshotDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobEligibilitySnapshotDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobEligibilitySnapshotDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobEligibilitySnapshotDto value)  $default,){
final _that = this;
switch (_that) {
case _JobEligibilitySnapshotDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobEligibilitySnapshotDto value)?  $default,){
final _that = this;
switch (_that) {
case _JobEligibilitySnapshotDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool canApply,  String eligibilityReason,  String eligibilityMessage,  int? applicationId,  String? applicationStatus,  List<String> availableActions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobEligibilitySnapshotDto() when $default != null:
return $default(_that.canApply,_that.eligibilityReason,_that.eligibilityMessage,_that.applicationId,_that.applicationStatus,_that.availableActions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool canApply,  String eligibilityReason,  String eligibilityMessage,  int? applicationId,  String? applicationStatus,  List<String> availableActions)  $default,) {final _that = this;
switch (_that) {
case _JobEligibilitySnapshotDto():
return $default(_that.canApply,_that.eligibilityReason,_that.eligibilityMessage,_that.applicationId,_that.applicationStatus,_that.availableActions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool canApply,  String eligibilityReason,  String eligibilityMessage,  int? applicationId,  String? applicationStatus,  List<String> availableActions)?  $default,) {final _that = this;
switch (_that) {
case _JobEligibilitySnapshotDto() when $default != null:
return $default(_that.canApply,_that.eligibilityReason,_that.eligibilityMessage,_that.applicationId,_that.applicationStatus,_that.availableActions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobEligibilitySnapshotDto implements JobEligibilitySnapshotDto {
  const _JobEligibilitySnapshotDto({required this.canApply, required this.eligibilityReason, required this.eligibilityMessage, this.applicationId, this.applicationStatus, final  List<String> availableActions = const []}): _availableActions = availableActions;
  factory _JobEligibilitySnapshotDto.fromJson(Map<String, dynamic> json) => _$JobEligibilitySnapshotDtoFromJson(json);

@override final  bool canApply;
@override final  String eligibilityReason;
@override final  String eligibilityMessage;
@override final  int? applicationId;
@override final  String? applicationStatus;
 final  List<String> _availableActions;
@override@JsonKey() List<String> get availableActions {
  if (_availableActions is EqualUnmodifiableListView) return _availableActions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableActions);
}


/// Create a copy of JobEligibilitySnapshotDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobEligibilitySnapshotDtoCopyWith<_JobEligibilitySnapshotDto> get copyWith => __$JobEligibilitySnapshotDtoCopyWithImpl<_JobEligibilitySnapshotDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobEligibilitySnapshotDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobEligibilitySnapshotDto&&(identical(other.canApply, canApply) || other.canApply == canApply)&&(identical(other.eligibilityReason, eligibilityReason) || other.eligibilityReason == eligibilityReason)&&(identical(other.eligibilityMessage, eligibilityMessage) || other.eligibilityMessage == eligibilityMessage)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.applicationStatus, applicationStatus) || other.applicationStatus == applicationStatus)&&const DeepCollectionEquality().equals(other._availableActions, _availableActions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canApply,eligibilityReason,eligibilityMessage,applicationId,applicationStatus,const DeepCollectionEquality().hash(_availableActions));

@override
String toString() {
  return 'JobEligibilitySnapshotDto(canApply: $canApply, eligibilityReason: $eligibilityReason, eligibilityMessage: $eligibilityMessage, applicationId: $applicationId, applicationStatus: $applicationStatus, availableActions: $availableActions)';
}


}

/// @nodoc
abstract mixin class _$JobEligibilitySnapshotDtoCopyWith<$Res> implements $JobEligibilitySnapshotDtoCopyWith<$Res> {
  factory _$JobEligibilitySnapshotDtoCopyWith(_JobEligibilitySnapshotDto value, $Res Function(_JobEligibilitySnapshotDto) _then) = __$JobEligibilitySnapshotDtoCopyWithImpl;
@override @useResult
$Res call({
 bool canApply, String eligibilityReason, String eligibilityMessage, int? applicationId, String? applicationStatus, List<String> availableActions
});




}
/// @nodoc
class __$JobEligibilitySnapshotDtoCopyWithImpl<$Res>
    implements _$JobEligibilitySnapshotDtoCopyWith<$Res> {
  __$JobEligibilitySnapshotDtoCopyWithImpl(this._self, this._then);

  final _JobEligibilitySnapshotDto _self;
  final $Res Function(_JobEligibilitySnapshotDto) _then;

/// Create a copy of JobEligibilitySnapshotDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canApply = null,Object? eligibilityReason = null,Object? eligibilityMessage = null,Object? applicationId = freezed,Object? applicationStatus = freezed,Object? availableActions = null,}) {
  return _then(_JobEligibilitySnapshotDto(
canApply: null == canApply ? _self.canApply : canApply // ignore: cast_nullable_to_non_nullable
as bool,eligibilityReason: null == eligibilityReason ? _self.eligibilityReason : eligibilityReason // ignore: cast_nullable_to_non_nullable
as String,eligibilityMessage: null == eligibilityMessage ? _self.eligibilityMessage : eligibilityMessage // ignore: cast_nullable_to_non_nullable
as String,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as int?,applicationStatus: freezed == applicationStatus ? _self.applicationStatus : applicationStatus // ignore: cast_nullable_to_non_nullable
as String?,availableActions: null == availableActions ? _self._availableActions : availableActions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$JobSummaryResponse {

 int get jobId; String get title; String get postingType; String get applicationMethod; String get status; CompanySummaryDto? get company; String? get startDate; String? get endDate; int? get targetGrade; int? get capacity; String? get location; String? get employmentType; String? get sourceName; bool get firstComeServed; int get viewCount; String? get publishedAt; JobEligibilitySnapshotDto get application; bool get bookmarked;
/// Create a copy of JobSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobSummaryResponseCopyWith<JobSummaryResponse> get copyWith => _$JobSummaryResponseCopyWithImpl<JobSummaryResponse>(this as JobSummaryResponse, _$identity);

  /// Serializes this JobSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobSummaryResponse&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.title, title) || other.title == title)&&(identical(other.postingType, postingType) || other.postingType == postingType)&&(identical(other.applicationMethod, applicationMethod) || other.applicationMethod == applicationMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.company, company) || other.company == company)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.targetGrade, targetGrade) || other.targetGrade == targetGrade)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.location, location) || other.location == location)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.firstComeServed, firstComeServed) || other.firstComeServed == firstComeServed)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.application, application) || other.application == application)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,title,postingType,applicationMethod,status,company,startDate,endDate,targetGrade,capacity,location,employmentType,sourceName,firstComeServed,viewCount,publishedAt,application,bookmarked);

@override
String toString() {
  return 'JobSummaryResponse(jobId: $jobId, title: $title, postingType: $postingType, applicationMethod: $applicationMethod, status: $status, company: $company, startDate: $startDate, endDate: $endDate, targetGrade: $targetGrade, capacity: $capacity, location: $location, employmentType: $employmentType, sourceName: $sourceName, firstComeServed: $firstComeServed, viewCount: $viewCount, publishedAt: $publishedAt, application: $application, bookmarked: $bookmarked)';
}


}

/// @nodoc
abstract mixin class $JobSummaryResponseCopyWith<$Res>  {
  factory $JobSummaryResponseCopyWith(JobSummaryResponse value, $Res Function(JobSummaryResponse) _then) = _$JobSummaryResponseCopyWithImpl;
@useResult
$Res call({
 int jobId, String title, String postingType, String applicationMethod, String status, CompanySummaryDto? company, String? startDate, String? endDate, int? targetGrade, int? capacity, String? location, String? employmentType, String? sourceName, bool firstComeServed, int viewCount, String? publishedAt, JobEligibilitySnapshotDto application, bool bookmarked
});


$CompanySummaryDtoCopyWith<$Res>? get company;$JobEligibilitySnapshotDtoCopyWith<$Res> get application;

}
/// @nodoc
class _$JobSummaryResponseCopyWithImpl<$Res>
    implements $JobSummaryResponseCopyWith<$Res> {
  _$JobSummaryResponseCopyWithImpl(this._self, this._then);

  final JobSummaryResponse _self;
  final $Res Function(JobSummaryResponse) _then;

/// Create a copy of JobSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobId = null,Object? title = null,Object? postingType = null,Object? applicationMethod = null,Object? status = null,Object? company = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? targetGrade = freezed,Object? capacity = freezed,Object? location = freezed,Object? employmentType = freezed,Object? sourceName = freezed,Object? firstComeServed = null,Object? viewCount = null,Object? publishedAt = freezed,Object? application = null,Object? bookmarked = null,}) {
  return _then(_self.copyWith(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,postingType: null == postingType ? _self.postingType : postingType // ignore: cast_nullable_to_non_nullable
as String,applicationMethod: null == applicationMethod ? _self.applicationMethod : applicationMethod // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as CompanySummaryDto?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,targetGrade: freezed == targetGrade ? _self.targetGrade : targetGrade // ignore: cast_nullable_to_non_nullable
as int?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,sourceName: freezed == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String?,firstComeServed: null == firstComeServed ? _self.firstComeServed : firstComeServed // ignore: cast_nullable_to_non_nullable
as bool,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as JobEligibilitySnapshotDto,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of JobSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanySummaryDtoCopyWith<$Res>? get company {
    if (_self.company == null) {
    return null;
  }

  return $CompanySummaryDtoCopyWith<$Res>(_self.company!, (value) {
    return _then(_self.copyWith(company: value));
  });
}/// Create a copy of JobSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobEligibilitySnapshotDtoCopyWith<$Res> get application {
  
  return $JobEligibilitySnapshotDtoCopyWith<$Res>(_self.application, (value) {
    return _then(_self.copyWith(application: value));
  });
}
}


/// Adds pattern-matching-related methods to [JobSummaryResponse].
extension JobSummaryResponsePatterns on JobSummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobSummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobSummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _JobSummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobSummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _JobSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int jobId,  String title,  String postingType,  String applicationMethod,  String status,  CompanySummaryDto? company,  String? startDate,  String? endDate,  int? targetGrade,  int? capacity,  String? location,  String? employmentType,  String? sourceName,  bool firstComeServed,  int viewCount,  String? publishedAt,  JobEligibilitySnapshotDto application,  bool bookmarked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobSummaryResponse() when $default != null:
return $default(_that.jobId,_that.title,_that.postingType,_that.applicationMethod,_that.status,_that.company,_that.startDate,_that.endDate,_that.targetGrade,_that.capacity,_that.location,_that.employmentType,_that.sourceName,_that.firstComeServed,_that.viewCount,_that.publishedAt,_that.application,_that.bookmarked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int jobId,  String title,  String postingType,  String applicationMethod,  String status,  CompanySummaryDto? company,  String? startDate,  String? endDate,  int? targetGrade,  int? capacity,  String? location,  String? employmentType,  String? sourceName,  bool firstComeServed,  int viewCount,  String? publishedAt,  JobEligibilitySnapshotDto application,  bool bookmarked)  $default,) {final _that = this;
switch (_that) {
case _JobSummaryResponse():
return $default(_that.jobId,_that.title,_that.postingType,_that.applicationMethod,_that.status,_that.company,_that.startDate,_that.endDate,_that.targetGrade,_that.capacity,_that.location,_that.employmentType,_that.sourceName,_that.firstComeServed,_that.viewCount,_that.publishedAt,_that.application,_that.bookmarked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int jobId,  String title,  String postingType,  String applicationMethod,  String status,  CompanySummaryDto? company,  String? startDate,  String? endDate,  int? targetGrade,  int? capacity,  String? location,  String? employmentType,  String? sourceName,  bool firstComeServed,  int viewCount,  String? publishedAt,  JobEligibilitySnapshotDto application,  bool bookmarked)?  $default,) {final _that = this;
switch (_that) {
case _JobSummaryResponse() when $default != null:
return $default(_that.jobId,_that.title,_that.postingType,_that.applicationMethod,_that.status,_that.company,_that.startDate,_that.endDate,_that.targetGrade,_that.capacity,_that.location,_that.employmentType,_that.sourceName,_that.firstComeServed,_that.viewCount,_that.publishedAt,_that.application,_that.bookmarked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobSummaryResponse implements JobSummaryResponse {
  const _JobSummaryResponse({required this.jobId, required this.title, required this.postingType, required this.applicationMethod, required this.status, this.company, this.startDate, this.endDate, this.targetGrade, this.capacity, this.location, this.employmentType, this.sourceName, this.firstComeServed = false, this.viewCount = 0, this.publishedAt, required this.application, this.bookmarked = false});
  factory _JobSummaryResponse.fromJson(Map<String, dynamic> json) => _$JobSummaryResponseFromJson(json);

@override final  int jobId;
@override final  String title;
@override final  String postingType;
@override final  String applicationMethod;
@override final  String status;
@override final  CompanySummaryDto? company;
@override final  String? startDate;
@override final  String? endDate;
@override final  int? targetGrade;
@override final  int? capacity;
@override final  String? location;
@override final  String? employmentType;
@override final  String? sourceName;
@override@JsonKey() final  bool firstComeServed;
@override@JsonKey() final  int viewCount;
@override final  String? publishedAt;
@override final  JobEligibilitySnapshotDto application;
@override@JsonKey() final  bool bookmarked;

/// Create a copy of JobSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobSummaryResponseCopyWith<_JobSummaryResponse> get copyWith => __$JobSummaryResponseCopyWithImpl<_JobSummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobSummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobSummaryResponse&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.title, title) || other.title == title)&&(identical(other.postingType, postingType) || other.postingType == postingType)&&(identical(other.applicationMethod, applicationMethod) || other.applicationMethod == applicationMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.company, company) || other.company == company)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.targetGrade, targetGrade) || other.targetGrade == targetGrade)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.location, location) || other.location == location)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.firstComeServed, firstComeServed) || other.firstComeServed == firstComeServed)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.application, application) || other.application == application)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,title,postingType,applicationMethod,status,company,startDate,endDate,targetGrade,capacity,location,employmentType,sourceName,firstComeServed,viewCount,publishedAt,application,bookmarked);

@override
String toString() {
  return 'JobSummaryResponse(jobId: $jobId, title: $title, postingType: $postingType, applicationMethod: $applicationMethod, status: $status, company: $company, startDate: $startDate, endDate: $endDate, targetGrade: $targetGrade, capacity: $capacity, location: $location, employmentType: $employmentType, sourceName: $sourceName, firstComeServed: $firstComeServed, viewCount: $viewCount, publishedAt: $publishedAt, application: $application, bookmarked: $bookmarked)';
}


}

/// @nodoc
abstract mixin class _$JobSummaryResponseCopyWith<$Res> implements $JobSummaryResponseCopyWith<$Res> {
  factory _$JobSummaryResponseCopyWith(_JobSummaryResponse value, $Res Function(_JobSummaryResponse) _then) = __$JobSummaryResponseCopyWithImpl;
@override @useResult
$Res call({
 int jobId, String title, String postingType, String applicationMethod, String status, CompanySummaryDto? company, String? startDate, String? endDate, int? targetGrade, int? capacity, String? location, String? employmentType, String? sourceName, bool firstComeServed, int viewCount, String? publishedAt, JobEligibilitySnapshotDto application, bool bookmarked
});


@override $CompanySummaryDtoCopyWith<$Res>? get company;@override $JobEligibilitySnapshotDtoCopyWith<$Res> get application;

}
/// @nodoc
class __$JobSummaryResponseCopyWithImpl<$Res>
    implements _$JobSummaryResponseCopyWith<$Res> {
  __$JobSummaryResponseCopyWithImpl(this._self, this._then);

  final _JobSummaryResponse _self;
  final $Res Function(_JobSummaryResponse) _then;

/// Create a copy of JobSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? title = null,Object? postingType = null,Object? applicationMethod = null,Object? status = null,Object? company = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? targetGrade = freezed,Object? capacity = freezed,Object? location = freezed,Object? employmentType = freezed,Object? sourceName = freezed,Object? firstComeServed = null,Object? viewCount = null,Object? publishedAt = freezed,Object? application = null,Object? bookmarked = null,}) {
  return _then(_JobSummaryResponse(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,postingType: null == postingType ? _self.postingType : postingType // ignore: cast_nullable_to_non_nullable
as String,applicationMethod: null == applicationMethod ? _self.applicationMethod : applicationMethod // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as CompanySummaryDto?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,targetGrade: freezed == targetGrade ? _self.targetGrade : targetGrade // ignore: cast_nullable_to_non_nullable
as int?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,sourceName: freezed == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String?,firstComeServed: null == firstComeServed ? _self.firstComeServed : firstComeServed // ignore: cast_nullable_to_non_nullable
as bool,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as JobEligibilitySnapshotDto,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of JobSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanySummaryDtoCopyWith<$Res>? get company {
    if (_self.company == null) {
    return null;
  }

  return $CompanySummaryDtoCopyWith<$Res>(_self.company!, (value) {
    return _then(_self.copyWith(company: value));
  });
}/// Create a copy of JobSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobEligibilitySnapshotDtoCopyWith<$Res> get application {
  
  return $JobEligibilitySnapshotDtoCopyWith<$Res>(_self.application, (value) {
    return _then(_self.copyWith(application: value));
  });
}
}


/// @nodoc
mixin _$JobSearchResponse {

 List<JobSummaryResponse> get content; int get page; int get size; int get totalElements; int get totalPages; bool get first; bool get last;
/// Create a copy of JobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobSearchResponseCopyWith<JobSearchResponse> get copyWith => _$JobSearchResponseCopyWithImpl<JobSearchResponse>(this as JobSearchResponse, _$identity);

  /// Serializes this JobSearchResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobSearchResponse&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),page,size,totalElements,totalPages,first,last);

@override
String toString() {
  return 'JobSearchResponse(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages, first: $first, last: $last)';
}


}

/// @nodoc
abstract mixin class $JobSearchResponseCopyWith<$Res>  {
  factory $JobSearchResponseCopyWith(JobSearchResponse value, $Res Function(JobSearchResponse) _then) = _$JobSearchResponseCopyWithImpl;
@useResult
$Res call({
 List<JobSummaryResponse> content, int page, int size, int totalElements, int totalPages, bool first, bool last
});




}
/// @nodoc
class _$JobSearchResponseCopyWithImpl<$Res>
    implements $JobSearchResponseCopyWith<$Res> {
  _$JobSearchResponseCopyWithImpl(this._self, this._then);

  final JobSearchResponse _self;
  final $Res Function(JobSearchResponse) _then;

/// Create a copy of JobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,Object? first = null,Object? last = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<JobSummaryResponse>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as bool,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [JobSearchResponse].
extension JobSearchResponsePatterns on JobSearchResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobSearchResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobSearchResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobSearchResponse value)  $default,){
final _that = this;
switch (_that) {
case _JobSearchResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobSearchResponse value)?  $default,){
final _that = this;
switch (_that) {
case _JobSearchResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<JobSummaryResponse> content,  int page,  int size,  int totalElements,  int totalPages,  bool first,  bool last)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobSearchResponse() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages,_that.first,_that.last);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<JobSummaryResponse> content,  int page,  int size,  int totalElements,  int totalPages,  bool first,  bool last)  $default,) {final _that = this;
switch (_that) {
case _JobSearchResponse():
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages,_that.first,_that.last);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<JobSummaryResponse> content,  int page,  int size,  int totalElements,  int totalPages,  bool first,  bool last)?  $default,) {final _that = this;
switch (_that) {
case _JobSearchResponse() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages,_that.first,_that.last);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobSearchResponse implements JobSearchResponse {
  const _JobSearchResponse({final  List<JobSummaryResponse> content = const [], this.page = 0, this.size = 0, this.totalElements = 0, this.totalPages = 0, this.first = true, this.last = true}): _content = content;
  factory _JobSearchResponse.fromJson(Map<String, dynamic> json) => _$JobSearchResponseFromJson(json);

 final  List<JobSummaryResponse> _content;
@override@JsonKey() List<JobSummaryResponse> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;
@override@JsonKey() final  int totalElements;
@override@JsonKey() final  int totalPages;
@override@JsonKey() final  bool first;
@override@JsonKey() final  bool last;

/// Create a copy of JobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobSearchResponseCopyWith<_JobSearchResponse> get copyWith => __$JobSearchResponseCopyWithImpl<_JobSearchResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobSearchResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobSearchResponse&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),page,size,totalElements,totalPages,first,last);

@override
String toString() {
  return 'JobSearchResponse(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages, first: $first, last: $last)';
}


}

/// @nodoc
abstract mixin class _$JobSearchResponseCopyWith<$Res> implements $JobSearchResponseCopyWith<$Res> {
  factory _$JobSearchResponseCopyWith(_JobSearchResponse value, $Res Function(_JobSearchResponse) _then) = __$JobSearchResponseCopyWithImpl;
@override @useResult
$Res call({
 List<JobSummaryResponse> content, int page, int size, int totalElements, int totalPages, bool first, bool last
});




}
/// @nodoc
class __$JobSearchResponseCopyWithImpl<$Res>
    implements _$JobSearchResponseCopyWith<$Res> {
  __$JobSearchResponseCopyWithImpl(this._self, this._then);

  final _JobSearchResponse _self;
  final $Res Function(_JobSearchResponse) _then;

/// Create a copy of JobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,Object? first = null,Object? last = null,}) {
  return _then(_JobSearchResponse(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<JobSummaryResponse>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as bool,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ApiResponseJobSearchResponse {

 bool get success; JobSearchResponse? get data; ApiErrorBody? get error; ResponseMeta? get meta;
/// Create a copy of ApiResponseJobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseJobSearchResponseCopyWith<ApiResponseJobSearchResponse> get copyWith => _$ApiResponseJobSearchResponseCopyWithImpl<ApiResponseJobSearchResponse>(this as ApiResponseJobSearchResponse, _$identity);

  /// Serializes this ApiResponseJobSearchResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseJobSearchResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseJobSearchResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ApiResponseJobSearchResponseCopyWith<$Res>  {
  factory $ApiResponseJobSearchResponseCopyWith(ApiResponseJobSearchResponse value, $Res Function(ApiResponseJobSearchResponse) _then) = _$ApiResponseJobSearchResponseCopyWithImpl;
@useResult
$Res call({
 bool success, JobSearchResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


$JobSearchResponseCopyWith<$Res>? get data;$ApiErrorBodyCopyWith<$Res>? get error;$ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ApiResponseJobSearchResponseCopyWithImpl<$Res>
    implements $ApiResponseJobSearchResponseCopyWith<$Res> {
  _$ApiResponseJobSearchResponseCopyWithImpl(this._self, this._then);

  final ApiResponseJobSearchResponse _self;
  final $Res Function(ApiResponseJobSearchResponse) _then;

/// Create a copy of ApiResponseJobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as JobSearchResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}
/// Create a copy of ApiResponseJobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobSearchResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $JobSearchResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseJobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiErrorBodyCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ApiErrorBodyCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}/// Create a copy of ApiResponseJobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ResponseMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApiResponseJobSearchResponse].
extension ApiResponseJobSearchResponsePatterns on ApiResponseJobSearchResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseJobSearchResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseJobSearchResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseJobSearchResponse value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseJobSearchResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseJobSearchResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseJobSearchResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  JobSearchResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseJobSearchResponse() when $default != null:
return $default(_that.success,_that.data,_that.error,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  JobSearchResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseJobSearchResponse():
return $default(_that.success,_that.data,_that.error,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  JobSearchResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseJobSearchResponse() when $default != null:
return $default(_that.success,_that.data,_that.error,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiResponseJobSearchResponse implements ApiResponseJobSearchResponse {
  const _ApiResponseJobSearchResponse({required this.success, this.data, this.error, this.meta});
  factory _ApiResponseJobSearchResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseJobSearchResponseFromJson(json);

@override final  bool success;
@override final  JobSearchResponse? data;
@override final  ApiErrorBody? error;
@override final  ResponseMeta? meta;

/// Create a copy of ApiResponseJobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseJobSearchResponseCopyWith<_ApiResponseJobSearchResponse> get copyWith => __$ApiResponseJobSearchResponseCopyWithImpl<_ApiResponseJobSearchResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseJobSearchResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseJobSearchResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseJobSearchResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseJobSearchResponseCopyWith<$Res> implements $ApiResponseJobSearchResponseCopyWith<$Res> {
  factory _$ApiResponseJobSearchResponseCopyWith(_ApiResponseJobSearchResponse value, $Res Function(_ApiResponseJobSearchResponse) _then) = __$ApiResponseJobSearchResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, JobSearchResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


@override $JobSearchResponseCopyWith<$Res>? get data;@override $ApiErrorBodyCopyWith<$Res>? get error;@override $ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ApiResponseJobSearchResponseCopyWithImpl<$Res>
    implements _$ApiResponseJobSearchResponseCopyWith<$Res> {
  __$ApiResponseJobSearchResponseCopyWithImpl(this._self, this._then);

  final _ApiResponseJobSearchResponse _self;
  final $Res Function(_ApiResponseJobSearchResponse) _then;

/// Create a copy of ApiResponseJobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_ApiResponseJobSearchResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as JobSearchResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}

/// Create a copy of ApiResponseJobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobSearchResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $JobSearchResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseJobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiErrorBodyCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $ApiErrorBodyCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}/// Create a copy of ApiResponseJobSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ResponseMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
