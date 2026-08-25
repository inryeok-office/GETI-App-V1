// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation_job_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecommendationJobResponse {

 int get jobId; String get title; String get postingType; String get applicationMethod; String get status; CompanySummaryDto? get company; String? get endDate; int get viewCount; bool get bookmarked; List<JobAiSkillDto> get techStacks; int get bookmarkCount; String? get location; String? get employmentType;
/// Create a copy of RecommendationJobResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationJobResponseCopyWith<RecommendationJobResponse> get copyWith => _$RecommendationJobResponseCopyWithImpl<RecommendationJobResponse>(this as RecommendationJobResponse, _$identity);

  /// Serializes this RecommendationJobResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendationJobResponse&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.title, title) || other.title == title)&&(identical(other.postingType, postingType) || other.postingType == postingType)&&(identical(other.applicationMethod, applicationMethod) || other.applicationMethod == applicationMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.company, company) || other.company == company)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&const DeepCollectionEquality().equals(other.techStacks, techStacks)&&(identical(other.bookmarkCount, bookmarkCount) || other.bookmarkCount == bookmarkCount)&&(identical(other.location, location) || other.location == location)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,title,postingType,applicationMethod,status,company,endDate,viewCount,bookmarked,const DeepCollectionEquality().hash(techStacks),bookmarkCount,location,employmentType);

@override
String toString() {
  return 'RecommendationJobResponse(jobId: $jobId, title: $title, postingType: $postingType, applicationMethod: $applicationMethod, status: $status, company: $company, endDate: $endDate, viewCount: $viewCount, bookmarked: $bookmarked, techStacks: $techStacks, bookmarkCount: $bookmarkCount, location: $location, employmentType: $employmentType)';
}


}

/// @nodoc
abstract mixin class $RecommendationJobResponseCopyWith<$Res>  {
  factory $RecommendationJobResponseCopyWith(RecommendationJobResponse value, $Res Function(RecommendationJobResponse) _then) = _$RecommendationJobResponseCopyWithImpl;
@useResult
$Res call({
 int jobId, String title, String postingType, String applicationMethod, String status, CompanySummaryDto? company, String? endDate, int viewCount, bool bookmarked, List<JobAiSkillDto> techStacks, int bookmarkCount, String? location, String? employmentType
});


$CompanySummaryDtoCopyWith<$Res>? get company;

}
/// @nodoc
class _$RecommendationJobResponseCopyWithImpl<$Res>
    implements $RecommendationJobResponseCopyWith<$Res> {
  _$RecommendationJobResponseCopyWithImpl(this._self, this._then);

  final RecommendationJobResponse _self;
  final $Res Function(RecommendationJobResponse) _then;

/// Create a copy of RecommendationJobResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobId = null,Object? title = null,Object? postingType = null,Object? applicationMethod = null,Object? status = null,Object? company = freezed,Object? endDate = freezed,Object? viewCount = null,Object? bookmarked = null,Object? techStacks = null,Object? bookmarkCount = null,Object? location = freezed,Object? employmentType = freezed,}) {
  return _then(_self.copyWith(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,postingType: null == postingType ? _self.postingType : postingType // ignore: cast_nullable_to_non_nullable
as String,applicationMethod: null == applicationMethod ? _self.applicationMethod : applicationMethod // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as CompanySummaryDto?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,techStacks: null == techStacks ? _self.techStacks : techStacks // ignore: cast_nullable_to_non_nullable
as List<JobAiSkillDto>,bookmarkCount: null == bookmarkCount ? _self.bookmarkCount : bookmarkCount // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RecommendationJobResponse
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
}
}


/// Adds pattern-matching-related methods to [RecommendationJobResponse].
extension RecommendationJobResponsePatterns on RecommendationJobResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendationJobResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendationJobResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendationJobResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecommendationJobResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendationJobResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendationJobResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int jobId,  String title,  String postingType,  String applicationMethod,  String status,  CompanySummaryDto? company,  String? endDate,  int viewCount,  bool bookmarked,  List<JobAiSkillDto> techStacks,  int bookmarkCount,  String? location,  String? employmentType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendationJobResponse() when $default != null:
return $default(_that.jobId,_that.title,_that.postingType,_that.applicationMethod,_that.status,_that.company,_that.endDate,_that.viewCount,_that.bookmarked,_that.techStacks,_that.bookmarkCount,_that.location,_that.employmentType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int jobId,  String title,  String postingType,  String applicationMethod,  String status,  CompanySummaryDto? company,  String? endDate,  int viewCount,  bool bookmarked,  List<JobAiSkillDto> techStacks,  int bookmarkCount,  String? location,  String? employmentType)  $default,) {final _that = this;
switch (_that) {
case _RecommendationJobResponse():
return $default(_that.jobId,_that.title,_that.postingType,_that.applicationMethod,_that.status,_that.company,_that.endDate,_that.viewCount,_that.bookmarked,_that.techStacks,_that.bookmarkCount,_that.location,_that.employmentType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int jobId,  String title,  String postingType,  String applicationMethod,  String status,  CompanySummaryDto? company,  String? endDate,  int viewCount,  bool bookmarked,  List<JobAiSkillDto> techStacks,  int bookmarkCount,  String? location,  String? employmentType)?  $default,) {final _that = this;
switch (_that) {
case _RecommendationJobResponse() when $default != null:
return $default(_that.jobId,_that.title,_that.postingType,_that.applicationMethod,_that.status,_that.company,_that.endDate,_that.viewCount,_that.bookmarked,_that.techStacks,_that.bookmarkCount,_that.location,_that.employmentType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendationJobResponse implements RecommendationJobResponse {
  const _RecommendationJobResponse({required this.jobId, required this.title, required this.postingType, required this.applicationMethod, required this.status, this.company, this.endDate, this.viewCount = 0, this.bookmarked = false, final  List<JobAiSkillDto> techStacks = const [], this.bookmarkCount = 0, this.location, this.employmentType}): _techStacks = techStacks;
  factory _RecommendationJobResponse.fromJson(Map<String, dynamic> json) => _$RecommendationJobResponseFromJson(json);

@override final  int jobId;
@override final  String title;
@override final  String postingType;
@override final  String applicationMethod;
@override final  String status;
@override final  CompanySummaryDto? company;
@override final  String? endDate;
@override@JsonKey() final  int viewCount;
@override@JsonKey() final  bool bookmarked;
 final  List<JobAiSkillDto> _techStacks;
@override@JsonKey() List<JobAiSkillDto> get techStacks {
  if (_techStacks is EqualUnmodifiableListView) return _techStacks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_techStacks);
}

@override@JsonKey() final  int bookmarkCount;
@override final  String? location;
@override final  String? employmentType;

/// Create a copy of RecommendationJobResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationJobResponseCopyWith<_RecommendationJobResponse> get copyWith => __$RecommendationJobResponseCopyWithImpl<_RecommendationJobResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationJobResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendationJobResponse&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.title, title) || other.title == title)&&(identical(other.postingType, postingType) || other.postingType == postingType)&&(identical(other.applicationMethod, applicationMethod) || other.applicationMethod == applicationMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.company, company) || other.company == company)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&const DeepCollectionEquality().equals(other._techStacks, _techStacks)&&(identical(other.bookmarkCount, bookmarkCount) || other.bookmarkCount == bookmarkCount)&&(identical(other.location, location) || other.location == location)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,title,postingType,applicationMethod,status,company,endDate,viewCount,bookmarked,const DeepCollectionEquality().hash(_techStacks),bookmarkCount,location,employmentType);

@override
String toString() {
  return 'RecommendationJobResponse(jobId: $jobId, title: $title, postingType: $postingType, applicationMethod: $applicationMethod, status: $status, company: $company, endDate: $endDate, viewCount: $viewCount, bookmarked: $bookmarked, techStacks: $techStacks, bookmarkCount: $bookmarkCount, location: $location, employmentType: $employmentType)';
}


}

/// @nodoc
abstract mixin class _$RecommendationJobResponseCopyWith<$Res> implements $RecommendationJobResponseCopyWith<$Res> {
  factory _$RecommendationJobResponseCopyWith(_RecommendationJobResponse value, $Res Function(_RecommendationJobResponse) _then) = __$RecommendationJobResponseCopyWithImpl;
@override @useResult
$Res call({
 int jobId, String title, String postingType, String applicationMethod, String status, CompanySummaryDto? company, String? endDate, int viewCount, bool bookmarked, List<JobAiSkillDto> techStacks, int bookmarkCount, String? location, String? employmentType
});


@override $CompanySummaryDtoCopyWith<$Res>? get company;

}
/// @nodoc
class __$RecommendationJobResponseCopyWithImpl<$Res>
    implements _$RecommendationJobResponseCopyWith<$Res> {
  __$RecommendationJobResponseCopyWithImpl(this._self, this._then);

  final _RecommendationJobResponse _self;
  final $Res Function(_RecommendationJobResponse) _then;

/// Create a copy of RecommendationJobResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? title = null,Object? postingType = null,Object? applicationMethod = null,Object? status = null,Object? company = freezed,Object? endDate = freezed,Object? viewCount = null,Object? bookmarked = null,Object? techStacks = null,Object? bookmarkCount = null,Object? location = freezed,Object? employmentType = freezed,}) {
  return _then(_RecommendationJobResponse(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,postingType: null == postingType ? _self.postingType : postingType // ignore: cast_nullable_to_non_nullable
as String,applicationMethod: null == applicationMethod ? _self.applicationMethod : applicationMethod // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as CompanySummaryDto?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,techStacks: null == techStacks ? _self._techStacks : techStacks // ignore: cast_nullable_to_non_nullable
as List<JobAiSkillDto>,bookmarkCount: null == bookmarkCount ? _self.bookmarkCount : bookmarkCount // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RecommendationJobResponse
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
}
}


/// @nodoc
mixin _$RecommendationJobListResponse {

 List<RecommendationJobResponse> get content; int get page; int get size; int get totalElements; int get totalPages; bool get first; bool get last;
/// Create a copy of RecommendationJobListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationJobListResponseCopyWith<RecommendationJobListResponse> get copyWith => _$RecommendationJobListResponseCopyWithImpl<RecommendationJobListResponse>(this as RecommendationJobListResponse, _$identity);

  /// Serializes this RecommendationJobListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendationJobListResponse&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),page,size,totalElements,totalPages,first,last);

@override
String toString() {
  return 'RecommendationJobListResponse(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages, first: $first, last: $last)';
}


}

/// @nodoc
abstract mixin class $RecommendationJobListResponseCopyWith<$Res>  {
  factory $RecommendationJobListResponseCopyWith(RecommendationJobListResponse value, $Res Function(RecommendationJobListResponse) _then) = _$RecommendationJobListResponseCopyWithImpl;
@useResult
$Res call({
 List<RecommendationJobResponse> content, int page, int size, int totalElements, int totalPages, bool first, bool last
});




}
/// @nodoc
class _$RecommendationJobListResponseCopyWithImpl<$Res>
    implements $RecommendationJobListResponseCopyWith<$Res> {
  _$RecommendationJobListResponseCopyWithImpl(this._self, this._then);

  final RecommendationJobListResponse _self;
  final $Res Function(RecommendationJobListResponse) _then;

/// Create a copy of RecommendationJobListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,Object? first = null,Object? last = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<RecommendationJobResponse>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as bool,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendationJobListResponse].
extension RecommendationJobListResponsePatterns on RecommendationJobListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendationJobListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendationJobListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendationJobListResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecommendationJobListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendationJobListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendationJobListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RecommendationJobResponse> content,  int page,  int size,  int totalElements,  int totalPages,  bool first,  bool last)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendationJobListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RecommendationJobResponse> content,  int page,  int size,  int totalElements,  int totalPages,  bool first,  bool last)  $default,) {final _that = this;
switch (_that) {
case _RecommendationJobListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RecommendationJobResponse> content,  int page,  int size,  int totalElements,  int totalPages,  bool first,  bool last)?  $default,) {final _that = this;
switch (_that) {
case _RecommendationJobListResponse() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages,_that.first,_that.last);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendationJobListResponse implements RecommendationJobListResponse {
  const _RecommendationJobListResponse({final  List<RecommendationJobResponse> content = const [], this.page = 0, this.size = 0, this.totalElements = 0, this.totalPages = 0, this.first = true, this.last = true}): _content = content;
  factory _RecommendationJobListResponse.fromJson(Map<String, dynamic> json) => _$RecommendationJobListResponseFromJson(json);

 final  List<RecommendationJobResponse> _content;
@override@JsonKey() List<RecommendationJobResponse> get content {
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

/// Create a copy of RecommendationJobListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationJobListResponseCopyWith<_RecommendationJobListResponse> get copyWith => __$RecommendationJobListResponseCopyWithImpl<_RecommendationJobListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationJobListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendationJobListResponse&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),page,size,totalElements,totalPages,first,last);

@override
String toString() {
  return 'RecommendationJobListResponse(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages, first: $first, last: $last)';
}


}

/// @nodoc
abstract mixin class _$RecommendationJobListResponseCopyWith<$Res> implements $RecommendationJobListResponseCopyWith<$Res> {
  factory _$RecommendationJobListResponseCopyWith(_RecommendationJobListResponse value, $Res Function(_RecommendationJobListResponse) _then) = __$RecommendationJobListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<RecommendationJobResponse> content, int page, int size, int totalElements, int totalPages, bool first, bool last
});




}
/// @nodoc
class __$RecommendationJobListResponseCopyWithImpl<$Res>
    implements _$RecommendationJobListResponseCopyWith<$Res> {
  __$RecommendationJobListResponseCopyWithImpl(this._self, this._then);

  final _RecommendationJobListResponse _self;
  final $Res Function(_RecommendationJobListResponse) _then;

/// Create a copy of RecommendationJobListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,Object? first = null,Object? last = null,}) {
  return _then(_RecommendationJobListResponse(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<RecommendationJobResponse>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
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
mixin _$ApiResponseRecommendationJobListResponse {

 bool get success; RecommendationJobListResponse? get data; ApiErrorBody? get error; ResponseMeta? get meta;
/// Create a copy of ApiResponseRecommendationJobListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseRecommendationJobListResponseCopyWith<ApiResponseRecommendationJobListResponse> get copyWith => _$ApiResponseRecommendationJobListResponseCopyWithImpl<ApiResponseRecommendationJobListResponse>(this as ApiResponseRecommendationJobListResponse, _$identity);

  /// Serializes this ApiResponseRecommendationJobListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseRecommendationJobListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseRecommendationJobListResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ApiResponseRecommendationJobListResponseCopyWith<$Res>  {
  factory $ApiResponseRecommendationJobListResponseCopyWith(ApiResponseRecommendationJobListResponse value, $Res Function(ApiResponseRecommendationJobListResponse) _then) = _$ApiResponseRecommendationJobListResponseCopyWithImpl;
@useResult
$Res call({
 bool success, RecommendationJobListResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


$RecommendationJobListResponseCopyWith<$Res>? get data;$ApiErrorBodyCopyWith<$Res>? get error;$ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ApiResponseRecommendationJobListResponseCopyWithImpl<$Res>
    implements $ApiResponseRecommendationJobListResponseCopyWith<$Res> {
  _$ApiResponseRecommendationJobListResponseCopyWithImpl(this._self, this._then);

  final ApiResponseRecommendationJobListResponse _self;
  final $Res Function(ApiResponseRecommendationJobListResponse) _then;

/// Create a copy of ApiResponseRecommendationJobListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RecommendationJobListResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}
/// Create a copy of ApiResponseRecommendationJobListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendationJobListResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RecommendationJobListResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseRecommendationJobListResponse
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
}/// Create a copy of ApiResponseRecommendationJobListResponse
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


/// Adds pattern-matching-related methods to [ApiResponseRecommendationJobListResponse].
extension ApiResponseRecommendationJobListResponsePatterns on ApiResponseRecommendationJobListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseRecommendationJobListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseRecommendationJobListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseRecommendationJobListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseRecommendationJobListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseRecommendationJobListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseRecommendationJobListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  RecommendationJobListResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseRecommendationJobListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  RecommendationJobListResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseRecommendationJobListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  RecommendationJobListResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseRecommendationJobListResponse() when $default != null:
return $default(_that.success,_that.data,_that.error,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiResponseRecommendationJobListResponse implements ApiResponseRecommendationJobListResponse {
  const _ApiResponseRecommendationJobListResponse({required this.success, this.data, this.error, this.meta});
  factory _ApiResponseRecommendationJobListResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseRecommendationJobListResponseFromJson(json);

@override final  bool success;
@override final  RecommendationJobListResponse? data;
@override final  ApiErrorBody? error;
@override final  ResponseMeta? meta;

/// Create a copy of ApiResponseRecommendationJobListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseRecommendationJobListResponseCopyWith<_ApiResponseRecommendationJobListResponse> get copyWith => __$ApiResponseRecommendationJobListResponseCopyWithImpl<_ApiResponseRecommendationJobListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseRecommendationJobListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseRecommendationJobListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseRecommendationJobListResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseRecommendationJobListResponseCopyWith<$Res> implements $ApiResponseRecommendationJobListResponseCopyWith<$Res> {
  factory _$ApiResponseRecommendationJobListResponseCopyWith(_ApiResponseRecommendationJobListResponse value, $Res Function(_ApiResponseRecommendationJobListResponse) _then) = __$ApiResponseRecommendationJobListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, RecommendationJobListResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


@override $RecommendationJobListResponseCopyWith<$Res>? get data;@override $ApiErrorBodyCopyWith<$Res>? get error;@override $ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ApiResponseRecommendationJobListResponseCopyWithImpl<$Res>
    implements _$ApiResponseRecommendationJobListResponseCopyWith<$Res> {
  __$ApiResponseRecommendationJobListResponseCopyWithImpl(this._self, this._then);

  final _ApiResponseRecommendationJobListResponse _self;
  final $Res Function(_ApiResponseRecommendationJobListResponse) _then;

/// Create a copy of ApiResponseRecommendationJobListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_ApiResponseRecommendationJobListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RecommendationJobListResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}

/// Create a copy of ApiResponseRecommendationJobListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendationJobListResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RecommendationJobListResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseRecommendationJobListResponse
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
}/// Create a copy of ApiResponseRecommendationJobListResponse
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


/// @nodoc
mixin _$ApiResponseRecommendationJobResponse {

 bool get success; RecommendationJobResponse? get data; ApiErrorBody? get error; ResponseMeta? get meta;
/// Create a copy of ApiResponseRecommendationJobResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseRecommendationJobResponseCopyWith<ApiResponseRecommendationJobResponse> get copyWith => _$ApiResponseRecommendationJobResponseCopyWithImpl<ApiResponseRecommendationJobResponse>(this as ApiResponseRecommendationJobResponse, _$identity);

  /// Serializes this ApiResponseRecommendationJobResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseRecommendationJobResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseRecommendationJobResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ApiResponseRecommendationJobResponseCopyWith<$Res>  {
  factory $ApiResponseRecommendationJobResponseCopyWith(ApiResponseRecommendationJobResponse value, $Res Function(ApiResponseRecommendationJobResponse) _then) = _$ApiResponseRecommendationJobResponseCopyWithImpl;
@useResult
$Res call({
 bool success, RecommendationJobResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


$RecommendationJobResponseCopyWith<$Res>? get data;$ApiErrorBodyCopyWith<$Res>? get error;$ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ApiResponseRecommendationJobResponseCopyWithImpl<$Res>
    implements $ApiResponseRecommendationJobResponseCopyWith<$Res> {
  _$ApiResponseRecommendationJobResponseCopyWithImpl(this._self, this._then);

  final ApiResponseRecommendationJobResponse _self;
  final $Res Function(ApiResponseRecommendationJobResponse) _then;

/// Create a copy of ApiResponseRecommendationJobResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RecommendationJobResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}
/// Create a copy of ApiResponseRecommendationJobResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendationJobResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RecommendationJobResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseRecommendationJobResponse
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
}/// Create a copy of ApiResponseRecommendationJobResponse
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


/// Adds pattern-matching-related methods to [ApiResponseRecommendationJobResponse].
extension ApiResponseRecommendationJobResponsePatterns on ApiResponseRecommendationJobResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseRecommendationJobResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseRecommendationJobResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseRecommendationJobResponse value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseRecommendationJobResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseRecommendationJobResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseRecommendationJobResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  RecommendationJobResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseRecommendationJobResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  RecommendationJobResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseRecommendationJobResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  RecommendationJobResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseRecommendationJobResponse() when $default != null:
return $default(_that.success,_that.data,_that.error,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiResponseRecommendationJobResponse implements ApiResponseRecommendationJobResponse {
  const _ApiResponseRecommendationJobResponse({required this.success, this.data, this.error, this.meta});
  factory _ApiResponseRecommendationJobResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseRecommendationJobResponseFromJson(json);

@override final  bool success;
@override final  RecommendationJobResponse? data;
@override final  ApiErrorBody? error;
@override final  ResponseMeta? meta;

/// Create a copy of ApiResponseRecommendationJobResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseRecommendationJobResponseCopyWith<_ApiResponseRecommendationJobResponse> get copyWith => __$ApiResponseRecommendationJobResponseCopyWithImpl<_ApiResponseRecommendationJobResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseRecommendationJobResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseRecommendationJobResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseRecommendationJobResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseRecommendationJobResponseCopyWith<$Res> implements $ApiResponseRecommendationJobResponseCopyWith<$Res> {
  factory _$ApiResponseRecommendationJobResponseCopyWith(_ApiResponseRecommendationJobResponse value, $Res Function(_ApiResponseRecommendationJobResponse) _then) = __$ApiResponseRecommendationJobResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, RecommendationJobResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


@override $RecommendationJobResponseCopyWith<$Res>? get data;@override $ApiErrorBodyCopyWith<$Res>? get error;@override $ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ApiResponseRecommendationJobResponseCopyWithImpl<$Res>
    implements _$ApiResponseRecommendationJobResponseCopyWith<$Res> {
  __$ApiResponseRecommendationJobResponseCopyWithImpl(this._self, this._then);

  final _ApiResponseRecommendationJobResponse _self;
  final $Res Function(_ApiResponseRecommendationJobResponse) _then;

/// Create a copy of ApiResponseRecommendationJobResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_ApiResponseRecommendationJobResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RecommendationJobResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}

/// Create a copy of ApiResponseRecommendationJobResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendationJobResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RecommendationJobResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseRecommendationJobResponse
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
}/// Create a copy of ApiResponseRecommendationJobResponse
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
