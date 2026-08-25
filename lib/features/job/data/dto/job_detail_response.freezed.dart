// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobAiSkillDto {

 int? get techStackId; String get name;
/// Create a copy of JobAiSkillDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobAiSkillDtoCopyWith<JobAiSkillDto> get copyWith => _$JobAiSkillDtoCopyWithImpl<JobAiSkillDto>(this as JobAiSkillDto, _$identity);

  /// Serializes this JobAiSkillDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobAiSkillDto&&(identical(other.techStackId, techStackId) || other.techStackId == techStackId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,techStackId,name);

@override
String toString() {
  return 'JobAiSkillDto(techStackId: $techStackId, name: $name)';
}


}

/// @nodoc
abstract mixin class $JobAiSkillDtoCopyWith<$Res>  {
  factory $JobAiSkillDtoCopyWith(JobAiSkillDto value, $Res Function(JobAiSkillDto) _then) = _$JobAiSkillDtoCopyWithImpl;
@useResult
$Res call({
 int? techStackId, String name
});




}
/// @nodoc
class _$JobAiSkillDtoCopyWithImpl<$Res>
    implements $JobAiSkillDtoCopyWith<$Res> {
  _$JobAiSkillDtoCopyWithImpl(this._self, this._then);

  final JobAiSkillDto _self;
  final $Res Function(JobAiSkillDto) _then;

/// Create a copy of JobAiSkillDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? techStackId = freezed,Object? name = null,}) {
  return _then(_self.copyWith(
techStackId: freezed == techStackId ? _self.techStackId : techStackId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobAiSkillDto].
extension JobAiSkillDtoPatterns on JobAiSkillDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobAiSkillDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobAiSkillDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobAiSkillDto value)  $default,){
final _that = this;
switch (_that) {
case _JobAiSkillDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobAiSkillDto value)?  $default,){
final _that = this;
switch (_that) {
case _JobAiSkillDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? techStackId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobAiSkillDto() when $default != null:
return $default(_that.techStackId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? techStackId,  String name)  $default,) {final _that = this;
switch (_that) {
case _JobAiSkillDto():
return $default(_that.techStackId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? techStackId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _JobAiSkillDto() when $default != null:
return $default(_that.techStackId,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobAiSkillDto implements JobAiSkillDto {
  const _JobAiSkillDto({this.techStackId, required this.name});
  factory _JobAiSkillDto.fromJson(Map<String, dynamic> json) => _$JobAiSkillDtoFromJson(json);

@override final  int? techStackId;
@override final  String name;

/// Create a copy of JobAiSkillDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobAiSkillDtoCopyWith<_JobAiSkillDto> get copyWith => __$JobAiSkillDtoCopyWithImpl<_JobAiSkillDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobAiSkillDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobAiSkillDto&&(identical(other.techStackId, techStackId) || other.techStackId == techStackId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,techStackId,name);

@override
String toString() {
  return 'JobAiSkillDto(techStackId: $techStackId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$JobAiSkillDtoCopyWith<$Res> implements $JobAiSkillDtoCopyWith<$Res> {
  factory _$JobAiSkillDtoCopyWith(_JobAiSkillDto value, $Res Function(_JobAiSkillDto) _then) = __$JobAiSkillDtoCopyWithImpl;
@override @useResult
$Res call({
 int? techStackId, String name
});




}
/// @nodoc
class __$JobAiSkillDtoCopyWithImpl<$Res>
    implements _$JobAiSkillDtoCopyWith<$Res> {
  __$JobAiSkillDtoCopyWithImpl(this._self, this._then);

  final _JobAiSkillDto _self;
  final $Res Function(_JobAiSkillDto) _then;

/// Create a copy of JobAiSkillDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? techStackId = freezed,Object? name = null,}) {
  return _then(_JobAiSkillDto(
techStackId: freezed == techStackId ? _self.techStackId : techStackId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$JobAiAnalysisSnapshotDto {

 String get status; String? get summary; List<JobAiSkillDto> get requiredSkills; List<JobAiSkillDto> get preferredSkills; String? get highSchoolGraduateFit; String? get entryLevelFit; String? get difficulty; bool get canReanalyze; int get remainingReanalysisCount; String? get analyzedAt; bool get reanalysis;
/// Create a copy of JobAiAnalysisSnapshotDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobAiAnalysisSnapshotDtoCopyWith<JobAiAnalysisSnapshotDto> get copyWith => _$JobAiAnalysisSnapshotDtoCopyWithImpl<JobAiAnalysisSnapshotDto>(this as JobAiAnalysisSnapshotDto, _$identity);

  /// Serializes this JobAiAnalysisSnapshotDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobAiAnalysisSnapshotDto&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.requiredSkills, requiredSkills)&&const DeepCollectionEquality().equals(other.preferredSkills, preferredSkills)&&(identical(other.highSchoolGraduateFit, highSchoolGraduateFit) || other.highSchoolGraduateFit == highSchoolGraduateFit)&&(identical(other.entryLevelFit, entryLevelFit) || other.entryLevelFit == entryLevelFit)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.canReanalyze, canReanalyze) || other.canReanalyze == canReanalyze)&&(identical(other.remainingReanalysisCount, remainingReanalysisCount) || other.remainingReanalysisCount == remainingReanalysisCount)&&(identical(other.analyzedAt, analyzedAt) || other.analyzedAt == analyzedAt)&&(identical(other.reanalysis, reanalysis) || other.reanalysis == reanalysis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,summary,const DeepCollectionEquality().hash(requiredSkills),const DeepCollectionEquality().hash(preferredSkills),highSchoolGraduateFit,entryLevelFit,difficulty,canReanalyze,remainingReanalysisCount,analyzedAt,reanalysis);

@override
String toString() {
  return 'JobAiAnalysisSnapshotDto(status: $status, summary: $summary, requiredSkills: $requiredSkills, preferredSkills: $preferredSkills, highSchoolGraduateFit: $highSchoolGraduateFit, entryLevelFit: $entryLevelFit, difficulty: $difficulty, canReanalyze: $canReanalyze, remainingReanalysisCount: $remainingReanalysisCount, analyzedAt: $analyzedAt, reanalysis: $reanalysis)';
}


}

/// @nodoc
abstract mixin class $JobAiAnalysisSnapshotDtoCopyWith<$Res>  {
  factory $JobAiAnalysisSnapshotDtoCopyWith(JobAiAnalysisSnapshotDto value, $Res Function(JobAiAnalysisSnapshotDto) _then) = _$JobAiAnalysisSnapshotDtoCopyWithImpl;
@useResult
$Res call({
 String status, String? summary, List<JobAiSkillDto> requiredSkills, List<JobAiSkillDto> preferredSkills, String? highSchoolGraduateFit, String? entryLevelFit, String? difficulty, bool canReanalyze, int remainingReanalysisCount, String? analyzedAt, bool reanalysis
});




}
/// @nodoc
class _$JobAiAnalysisSnapshotDtoCopyWithImpl<$Res>
    implements $JobAiAnalysisSnapshotDtoCopyWith<$Res> {
  _$JobAiAnalysisSnapshotDtoCopyWithImpl(this._self, this._then);

  final JobAiAnalysisSnapshotDto _self;
  final $Res Function(JobAiAnalysisSnapshotDto) _then;

/// Create a copy of JobAiAnalysisSnapshotDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? summary = freezed,Object? requiredSkills = null,Object? preferredSkills = null,Object? highSchoolGraduateFit = freezed,Object? entryLevelFit = freezed,Object? difficulty = freezed,Object? canReanalyze = null,Object? remainingReanalysisCount = null,Object? analyzedAt = freezed,Object? reanalysis = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,requiredSkills: null == requiredSkills ? _self.requiredSkills : requiredSkills // ignore: cast_nullable_to_non_nullable
as List<JobAiSkillDto>,preferredSkills: null == preferredSkills ? _self.preferredSkills : preferredSkills // ignore: cast_nullable_to_non_nullable
as List<JobAiSkillDto>,highSchoolGraduateFit: freezed == highSchoolGraduateFit ? _self.highSchoolGraduateFit : highSchoolGraduateFit // ignore: cast_nullable_to_non_nullable
as String?,entryLevelFit: freezed == entryLevelFit ? _self.entryLevelFit : entryLevelFit // ignore: cast_nullable_to_non_nullable
as String?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String?,canReanalyze: null == canReanalyze ? _self.canReanalyze : canReanalyze // ignore: cast_nullable_to_non_nullable
as bool,remainingReanalysisCount: null == remainingReanalysisCount ? _self.remainingReanalysisCount : remainingReanalysisCount // ignore: cast_nullable_to_non_nullable
as int,analyzedAt: freezed == analyzedAt ? _self.analyzedAt : analyzedAt // ignore: cast_nullable_to_non_nullable
as String?,reanalysis: null == reanalysis ? _self.reanalysis : reanalysis // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [JobAiAnalysisSnapshotDto].
extension JobAiAnalysisSnapshotDtoPatterns on JobAiAnalysisSnapshotDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobAiAnalysisSnapshotDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobAiAnalysisSnapshotDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobAiAnalysisSnapshotDto value)  $default,){
final _that = this;
switch (_that) {
case _JobAiAnalysisSnapshotDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobAiAnalysisSnapshotDto value)?  $default,){
final _that = this;
switch (_that) {
case _JobAiAnalysisSnapshotDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String? summary,  List<JobAiSkillDto> requiredSkills,  List<JobAiSkillDto> preferredSkills,  String? highSchoolGraduateFit,  String? entryLevelFit,  String? difficulty,  bool canReanalyze,  int remainingReanalysisCount,  String? analyzedAt,  bool reanalysis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobAiAnalysisSnapshotDto() when $default != null:
return $default(_that.status,_that.summary,_that.requiredSkills,_that.preferredSkills,_that.highSchoolGraduateFit,_that.entryLevelFit,_that.difficulty,_that.canReanalyze,_that.remainingReanalysisCount,_that.analyzedAt,_that.reanalysis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String? summary,  List<JobAiSkillDto> requiredSkills,  List<JobAiSkillDto> preferredSkills,  String? highSchoolGraduateFit,  String? entryLevelFit,  String? difficulty,  bool canReanalyze,  int remainingReanalysisCount,  String? analyzedAt,  bool reanalysis)  $default,) {final _that = this;
switch (_that) {
case _JobAiAnalysisSnapshotDto():
return $default(_that.status,_that.summary,_that.requiredSkills,_that.preferredSkills,_that.highSchoolGraduateFit,_that.entryLevelFit,_that.difficulty,_that.canReanalyze,_that.remainingReanalysisCount,_that.analyzedAt,_that.reanalysis);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String? summary,  List<JobAiSkillDto> requiredSkills,  List<JobAiSkillDto> preferredSkills,  String? highSchoolGraduateFit,  String? entryLevelFit,  String? difficulty,  bool canReanalyze,  int remainingReanalysisCount,  String? analyzedAt,  bool reanalysis)?  $default,) {final _that = this;
switch (_that) {
case _JobAiAnalysisSnapshotDto() when $default != null:
return $default(_that.status,_that.summary,_that.requiredSkills,_that.preferredSkills,_that.highSchoolGraduateFit,_that.entryLevelFit,_that.difficulty,_that.canReanalyze,_that.remainingReanalysisCount,_that.analyzedAt,_that.reanalysis);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobAiAnalysisSnapshotDto implements JobAiAnalysisSnapshotDto {
  const _JobAiAnalysisSnapshotDto({required this.status, this.summary, final  List<JobAiSkillDto> requiredSkills = const [], final  List<JobAiSkillDto> preferredSkills = const [], this.highSchoolGraduateFit, this.entryLevelFit, this.difficulty, this.canReanalyze = false, this.remainingReanalysisCount = 0, this.analyzedAt, this.reanalysis = false}): _requiredSkills = requiredSkills,_preferredSkills = preferredSkills;
  factory _JobAiAnalysisSnapshotDto.fromJson(Map<String, dynamic> json) => _$JobAiAnalysisSnapshotDtoFromJson(json);

@override final  String status;
@override final  String? summary;
 final  List<JobAiSkillDto> _requiredSkills;
@override@JsonKey() List<JobAiSkillDto> get requiredSkills {
  if (_requiredSkills is EqualUnmodifiableListView) return _requiredSkills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requiredSkills);
}

 final  List<JobAiSkillDto> _preferredSkills;
@override@JsonKey() List<JobAiSkillDto> get preferredSkills {
  if (_preferredSkills is EqualUnmodifiableListView) return _preferredSkills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preferredSkills);
}

@override final  String? highSchoolGraduateFit;
@override final  String? entryLevelFit;
@override final  String? difficulty;
@override@JsonKey() final  bool canReanalyze;
@override@JsonKey() final  int remainingReanalysisCount;
@override final  String? analyzedAt;
@override@JsonKey() final  bool reanalysis;

/// Create a copy of JobAiAnalysisSnapshotDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobAiAnalysisSnapshotDtoCopyWith<_JobAiAnalysisSnapshotDto> get copyWith => __$JobAiAnalysisSnapshotDtoCopyWithImpl<_JobAiAnalysisSnapshotDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobAiAnalysisSnapshotDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobAiAnalysisSnapshotDto&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._requiredSkills, _requiredSkills)&&const DeepCollectionEquality().equals(other._preferredSkills, _preferredSkills)&&(identical(other.highSchoolGraduateFit, highSchoolGraduateFit) || other.highSchoolGraduateFit == highSchoolGraduateFit)&&(identical(other.entryLevelFit, entryLevelFit) || other.entryLevelFit == entryLevelFit)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.canReanalyze, canReanalyze) || other.canReanalyze == canReanalyze)&&(identical(other.remainingReanalysisCount, remainingReanalysisCount) || other.remainingReanalysisCount == remainingReanalysisCount)&&(identical(other.analyzedAt, analyzedAt) || other.analyzedAt == analyzedAt)&&(identical(other.reanalysis, reanalysis) || other.reanalysis == reanalysis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,summary,const DeepCollectionEquality().hash(_requiredSkills),const DeepCollectionEquality().hash(_preferredSkills),highSchoolGraduateFit,entryLevelFit,difficulty,canReanalyze,remainingReanalysisCount,analyzedAt,reanalysis);

@override
String toString() {
  return 'JobAiAnalysisSnapshotDto(status: $status, summary: $summary, requiredSkills: $requiredSkills, preferredSkills: $preferredSkills, highSchoolGraduateFit: $highSchoolGraduateFit, entryLevelFit: $entryLevelFit, difficulty: $difficulty, canReanalyze: $canReanalyze, remainingReanalysisCount: $remainingReanalysisCount, analyzedAt: $analyzedAt, reanalysis: $reanalysis)';
}


}

/// @nodoc
abstract mixin class _$JobAiAnalysisSnapshotDtoCopyWith<$Res> implements $JobAiAnalysisSnapshotDtoCopyWith<$Res> {
  factory _$JobAiAnalysisSnapshotDtoCopyWith(_JobAiAnalysisSnapshotDto value, $Res Function(_JobAiAnalysisSnapshotDto) _then) = __$JobAiAnalysisSnapshotDtoCopyWithImpl;
@override @useResult
$Res call({
 String status, String? summary, List<JobAiSkillDto> requiredSkills, List<JobAiSkillDto> preferredSkills, String? highSchoolGraduateFit, String? entryLevelFit, String? difficulty, bool canReanalyze, int remainingReanalysisCount, String? analyzedAt, bool reanalysis
});




}
/// @nodoc
class __$JobAiAnalysisSnapshotDtoCopyWithImpl<$Res>
    implements _$JobAiAnalysisSnapshotDtoCopyWith<$Res> {
  __$JobAiAnalysisSnapshotDtoCopyWithImpl(this._self, this._then);

  final _JobAiAnalysisSnapshotDto _self;
  final $Res Function(_JobAiAnalysisSnapshotDto) _then;

/// Create a copy of JobAiAnalysisSnapshotDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? summary = freezed,Object? requiredSkills = null,Object? preferredSkills = null,Object? highSchoolGraduateFit = freezed,Object? entryLevelFit = freezed,Object? difficulty = freezed,Object? canReanalyze = null,Object? remainingReanalysisCount = null,Object? analyzedAt = freezed,Object? reanalysis = null,}) {
  return _then(_JobAiAnalysisSnapshotDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,requiredSkills: null == requiredSkills ? _self._requiredSkills : requiredSkills // ignore: cast_nullable_to_non_nullable
as List<JobAiSkillDto>,preferredSkills: null == preferredSkills ? _self._preferredSkills : preferredSkills // ignore: cast_nullable_to_non_nullable
as List<JobAiSkillDto>,highSchoolGraduateFit: freezed == highSchoolGraduateFit ? _self.highSchoolGraduateFit : highSchoolGraduateFit // ignore: cast_nullable_to_non_nullable
as String?,entryLevelFit: freezed == entryLevelFit ? _self.entryLevelFit : entryLevelFit // ignore: cast_nullable_to_non_nullable
as String?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String?,canReanalyze: null == canReanalyze ? _self.canReanalyze : canReanalyze // ignore: cast_nullable_to_non_nullable
as bool,remainingReanalysisCount: null == remainingReanalysisCount ? _self.remainingReanalysisCount : remainingReanalysisCount // ignore: cast_nullable_to_non_nullable
as int,analyzedAt: freezed == analyzedAt ? _self.analyzedAt : analyzedAt // ignore: cast_nullable_to_non_nullable
as String?,reanalysis: null == reanalysis ? _self.reanalysis : reanalysis // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$JobFileDto {

 int get fileId; String get originalName; String get contentType; int get size; String get downloadUrl;
/// Create a copy of JobFileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobFileDtoCopyWith<JobFileDto> get copyWith => _$JobFileDtoCopyWithImpl<JobFileDto>(this as JobFileDto, _$identity);

  /// Serializes this JobFileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobFileDto&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.size, size) || other.size == size)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId,originalName,contentType,size,downloadUrl);

@override
String toString() {
  return 'JobFileDto(fileId: $fileId, originalName: $originalName, contentType: $contentType, size: $size, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class $JobFileDtoCopyWith<$Res>  {
  factory $JobFileDtoCopyWith(JobFileDto value, $Res Function(JobFileDto) _then) = _$JobFileDtoCopyWithImpl;
@useResult
$Res call({
 int fileId, String originalName, String contentType, int size, String downloadUrl
});




}
/// @nodoc
class _$JobFileDtoCopyWithImpl<$Res>
    implements $JobFileDtoCopyWith<$Res> {
  _$JobFileDtoCopyWithImpl(this._self, this._then);

  final JobFileDto _self;
  final $Res Function(JobFileDto) _then;

/// Create a copy of JobFileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileId = null,Object? originalName = null,Object? contentType = null,Object? size = null,Object? downloadUrl = null,}) {
  return _then(_self.copyWith(
fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as int,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobFileDto].
extension JobFileDtoPatterns on JobFileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobFileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobFileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobFileDto value)  $default,){
final _that = this;
switch (_that) {
case _JobFileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobFileDto value)?  $default,){
final _that = this;
switch (_that) {
case _JobFileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int fileId,  String originalName,  String contentType,  int size,  String downloadUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobFileDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int fileId,  String originalName,  String contentType,  int size,  String downloadUrl)  $default,) {final _that = this;
switch (_that) {
case _JobFileDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int fileId,  String originalName,  String contentType,  int size,  String downloadUrl)?  $default,) {final _that = this;
switch (_that) {
case _JobFileDto() when $default != null:
return $default(_that.fileId,_that.originalName,_that.contentType,_that.size,_that.downloadUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobFileDto implements JobFileDto {
  const _JobFileDto({required this.fileId, required this.originalName, required this.contentType, required this.size, required this.downloadUrl});
  factory _JobFileDto.fromJson(Map<String, dynamic> json) => _$JobFileDtoFromJson(json);

@override final  int fileId;
@override final  String originalName;
@override final  String contentType;
@override final  int size;
@override final  String downloadUrl;

/// Create a copy of JobFileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobFileDtoCopyWith<_JobFileDto> get copyWith => __$JobFileDtoCopyWithImpl<_JobFileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobFileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobFileDto&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.size, size) || other.size == size)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileId,originalName,contentType,size,downloadUrl);

@override
String toString() {
  return 'JobFileDto(fileId: $fileId, originalName: $originalName, contentType: $contentType, size: $size, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class _$JobFileDtoCopyWith<$Res> implements $JobFileDtoCopyWith<$Res> {
  factory _$JobFileDtoCopyWith(_JobFileDto value, $Res Function(_JobFileDto) _then) = __$JobFileDtoCopyWithImpl;
@override @useResult
$Res call({
 int fileId, String originalName, String contentType, int size, String downloadUrl
});




}
/// @nodoc
class __$JobFileDtoCopyWithImpl<$Res>
    implements _$JobFileDtoCopyWith<$Res> {
  __$JobFileDtoCopyWithImpl(this._self, this._then);

  final _JobFileDto _self;
  final $Res Function(_JobFileDto) _then;

/// Create a copy of JobFileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileId = null,Object? originalName = null,Object? contentType = null,Object? size = null,Object? downloadUrl = null,}) {
  return _then(_JobFileDto(
fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as int,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$JobDetailResponse {

 int get jobId; String get title; String get postingType; String get applicationMethod; String get status; CompanySummaryDto? get company; String? get content; String? get externalUrl; String? get startDate; String? get endDate; int? get targetGrade; int? get capacity; String? get location; String? get employmentType; String? get sourceName; bool get firstComeServed; int get viewCount; String? get publishedAt; String? get closedAt; JobAiAnalysisSnapshotDto? get aiAnalysis; JobEligibilitySnapshotDto get application; bool get bookmarked; List<JobFileDto> get files;
/// Create a copy of JobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobDetailResponseCopyWith<JobDetailResponse> get copyWith => _$JobDetailResponseCopyWithImpl<JobDetailResponse>(this as JobDetailResponse, _$identity);

  /// Serializes this JobDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobDetailResponse&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.title, title) || other.title == title)&&(identical(other.postingType, postingType) || other.postingType == postingType)&&(identical(other.applicationMethod, applicationMethod) || other.applicationMethod == applicationMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.company, company) || other.company == company)&&(identical(other.content, content) || other.content == content)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.targetGrade, targetGrade) || other.targetGrade == targetGrade)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.location, location) || other.location == location)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.firstComeServed, firstComeServed) || other.firstComeServed == firstComeServed)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.aiAnalysis, aiAnalysis) || other.aiAnalysis == aiAnalysis)&&(identical(other.application, application) || other.application == application)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&const DeepCollectionEquality().equals(other.files, files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,jobId,title,postingType,applicationMethod,status,company,content,externalUrl,startDate,endDate,targetGrade,capacity,location,employmentType,sourceName,firstComeServed,viewCount,publishedAt,closedAt,aiAnalysis,application,bookmarked,const DeepCollectionEquality().hash(files)]);

@override
String toString() {
  return 'JobDetailResponse(jobId: $jobId, title: $title, postingType: $postingType, applicationMethod: $applicationMethod, status: $status, company: $company, content: $content, externalUrl: $externalUrl, startDate: $startDate, endDate: $endDate, targetGrade: $targetGrade, capacity: $capacity, location: $location, employmentType: $employmentType, sourceName: $sourceName, firstComeServed: $firstComeServed, viewCount: $viewCount, publishedAt: $publishedAt, closedAt: $closedAt, aiAnalysis: $aiAnalysis, application: $application, bookmarked: $bookmarked, files: $files)';
}


}

/// @nodoc
abstract mixin class $JobDetailResponseCopyWith<$Res>  {
  factory $JobDetailResponseCopyWith(JobDetailResponse value, $Res Function(JobDetailResponse) _then) = _$JobDetailResponseCopyWithImpl;
@useResult
$Res call({
 int jobId, String title, String postingType, String applicationMethod, String status, CompanySummaryDto? company, String? content, String? externalUrl, String? startDate, String? endDate, int? targetGrade, int? capacity, String? location, String? employmentType, String? sourceName, bool firstComeServed, int viewCount, String? publishedAt, String? closedAt, JobAiAnalysisSnapshotDto? aiAnalysis, JobEligibilitySnapshotDto application, bool bookmarked, List<JobFileDto> files
});


$CompanySummaryDtoCopyWith<$Res>? get company;$JobAiAnalysisSnapshotDtoCopyWith<$Res>? get aiAnalysis;$JobEligibilitySnapshotDtoCopyWith<$Res> get application;

}
/// @nodoc
class _$JobDetailResponseCopyWithImpl<$Res>
    implements $JobDetailResponseCopyWith<$Res> {
  _$JobDetailResponseCopyWithImpl(this._self, this._then);

  final JobDetailResponse _self;
  final $Res Function(JobDetailResponse) _then;

/// Create a copy of JobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobId = null,Object? title = null,Object? postingType = null,Object? applicationMethod = null,Object? status = null,Object? company = freezed,Object? content = freezed,Object? externalUrl = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? targetGrade = freezed,Object? capacity = freezed,Object? location = freezed,Object? employmentType = freezed,Object? sourceName = freezed,Object? firstComeServed = null,Object? viewCount = null,Object? publishedAt = freezed,Object? closedAt = freezed,Object? aiAnalysis = freezed,Object? application = null,Object? bookmarked = null,Object? files = null,}) {
  return _then(_self.copyWith(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,postingType: null == postingType ? _self.postingType : postingType // ignore: cast_nullable_to_non_nullable
as String,applicationMethod: null == applicationMethod ? _self.applicationMethod : applicationMethod // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as CompanySummaryDto?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,targetGrade: freezed == targetGrade ? _self.targetGrade : targetGrade // ignore: cast_nullable_to_non_nullable
as int?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,sourceName: freezed == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String?,firstComeServed: null == firstComeServed ? _self.firstComeServed : firstComeServed // ignore: cast_nullable_to_non_nullable
as bool,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as String?,aiAnalysis: freezed == aiAnalysis ? _self.aiAnalysis : aiAnalysis // ignore: cast_nullable_to_non_nullable
as JobAiAnalysisSnapshotDto?,application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as JobEligibilitySnapshotDto,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<JobFileDto>,
  ));
}
/// Create a copy of JobDetailResponse
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
}/// Create a copy of JobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobAiAnalysisSnapshotDtoCopyWith<$Res>? get aiAnalysis {
    if (_self.aiAnalysis == null) {
    return null;
  }

  return $JobAiAnalysisSnapshotDtoCopyWith<$Res>(_self.aiAnalysis!, (value) {
    return _then(_self.copyWith(aiAnalysis: value));
  });
}/// Create a copy of JobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobEligibilitySnapshotDtoCopyWith<$Res> get application {
  
  return $JobEligibilitySnapshotDtoCopyWith<$Res>(_self.application, (value) {
    return _then(_self.copyWith(application: value));
  });
}
}


/// Adds pattern-matching-related methods to [JobDetailResponse].
extension JobDetailResponsePatterns on JobDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _JobDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _JobDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int jobId,  String title,  String postingType,  String applicationMethod,  String status,  CompanySummaryDto? company,  String? content,  String? externalUrl,  String? startDate,  String? endDate,  int? targetGrade,  int? capacity,  String? location,  String? employmentType,  String? sourceName,  bool firstComeServed,  int viewCount,  String? publishedAt,  String? closedAt,  JobAiAnalysisSnapshotDto? aiAnalysis,  JobEligibilitySnapshotDto application,  bool bookmarked,  List<JobFileDto> files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobDetailResponse() when $default != null:
return $default(_that.jobId,_that.title,_that.postingType,_that.applicationMethod,_that.status,_that.company,_that.content,_that.externalUrl,_that.startDate,_that.endDate,_that.targetGrade,_that.capacity,_that.location,_that.employmentType,_that.sourceName,_that.firstComeServed,_that.viewCount,_that.publishedAt,_that.closedAt,_that.aiAnalysis,_that.application,_that.bookmarked,_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int jobId,  String title,  String postingType,  String applicationMethod,  String status,  CompanySummaryDto? company,  String? content,  String? externalUrl,  String? startDate,  String? endDate,  int? targetGrade,  int? capacity,  String? location,  String? employmentType,  String? sourceName,  bool firstComeServed,  int viewCount,  String? publishedAt,  String? closedAt,  JobAiAnalysisSnapshotDto? aiAnalysis,  JobEligibilitySnapshotDto application,  bool bookmarked,  List<JobFileDto> files)  $default,) {final _that = this;
switch (_that) {
case _JobDetailResponse():
return $default(_that.jobId,_that.title,_that.postingType,_that.applicationMethod,_that.status,_that.company,_that.content,_that.externalUrl,_that.startDate,_that.endDate,_that.targetGrade,_that.capacity,_that.location,_that.employmentType,_that.sourceName,_that.firstComeServed,_that.viewCount,_that.publishedAt,_that.closedAt,_that.aiAnalysis,_that.application,_that.bookmarked,_that.files);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int jobId,  String title,  String postingType,  String applicationMethod,  String status,  CompanySummaryDto? company,  String? content,  String? externalUrl,  String? startDate,  String? endDate,  int? targetGrade,  int? capacity,  String? location,  String? employmentType,  String? sourceName,  bool firstComeServed,  int viewCount,  String? publishedAt,  String? closedAt,  JobAiAnalysisSnapshotDto? aiAnalysis,  JobEligibilitySnapshotDto application,  bool bookmarked,  List<JobFileDto> files)?  $default,) {final _that = this;
switch (_that) {
case _JobDetailResponse() when $default != null:
return $default(_that.jobId,_that.title,_that.postingType,_that.applicationMethod,_that.status,_that.company,_that.content,_that.externalUrl,_that.startDate,_that.endDate,_that.targetGrade,_that.capacity,_that.location,_that.employmentType,_that.sourceName,_that.firstComeServed,_that.viewCount,_that.publishedAt,_that.closedAt,_that.aiAnalysis,_that.application,_that.bookmarked,_that.files);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobDetailResponse implements JobDetailResponse {
  const _JobDetailResponse({required this.jobId, required this.title, required this.postingType, required this.applicationMethod, required this.status, this.company, this.content, this.externalUrl, this.startDate, this.endDate, this.targetGrade, this.capacity, this.location, this.employmentType, this.sourceName, this.firstComeServed = false, this.viewCount = 0, this.publishedAt, this.closedAt, this.aiAnalysis, required this.application, this.bookmarked = false, final  List<JobFileDto> files = const []}): _files = files;
  factory _JobDetailResponse.fromJson(Map<String, dynamic> json) => _$JobDetailResponseFromJson(json);

@override final  int jobId;
@override final  String title;
@override final  String postingType;
@override final  String applicationMethod;
@override final  String status;
@override final  CompanySummaryDto? company;
@override final  String? content;
@override final  String? externalUrl;
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
@override final  String? closedAt;
@override final  JobAiAnalysisSnapshotDto? aiAnalysis;
@override final  JobEligibilitySnapshotDto application;
@override@JsonKey() final  bool bookmarked;
 final  List<JobFileDto> _files;
@override@JsonKey() List<JobFileDto> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of JobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobDetailResponseCopyWith<_JobDetailResponse> get copyWith => __$JobDetailResponseCopyWithImpl<_JobDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobDetailResponse&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.title, title) || other.title == title)&&(identical(other.postingType, postingType) || other.postingType == postingType)&&(identical(other.applicationMethod, applicationMethod) || other.applicationMethod == applicationMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.company, company) || other.company == company)&&(identical(other.content, content) || other.content == content)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.targetGrade, targetGrade) || other.targetGrade == targetGrade)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.location, location) || other.location == location)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.firstComeServed, firstComeServed) || other.firstComeServed == firstComeServed)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.aiAnalysis, aiAnalysis) || other.aiAnalysis == aiAnalysis)&&(identical(other.application, application) || other.application == application)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&const DeepCollectionEquality().equals(other._files, _files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,jobId,title,postingType,applicationMethod,status,company,content,externalUrl,startDate,endDate,targetGrade,capacity,location,employmentType,sourceName,firstComeServed,viewCount,publishedAt,closedAt,aiAnalysis,application,bookmarked,const DeepCollectionEquality().hash(_files)]);

@override
String toString() {
  return 'JobDetailResponse(jobId: $jobId, title: $title, postingType: $postingType, applicationMethod: $applicationMethod, status: $status, company: $company, content: $content, externalUrl: $externalUrl, startDate: $startDate, endDate: $endDate, targetGrade: $targetGrade, capacity: $capacity, location: $location, employmentType: $employmentType, sourceName: $sourceName, firstComeServed: $firstComeServed, viewCount: $viewCount, publishedAt: $publishedAt, closedAt: $closedAt, aiAnalysis: $aiAnalysis, application: $application, bookmarked: $bookmarked, files: $files)';
}


}

/// @nodoc
abstract mixin class _$JobDetailResponseCopyWith<$Res> implements $JobDetailResponseCopyWith<$Res> {
  factory _$JobDetailResponseCopyWith(_JobDetailResponse value, $Res Function(_JobDetailResponse) _then) = __$JobDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 int jobId, String title, String postingType, String applicationMethod, String status, CompanySummaryDto? company, String? content, String? externalUrl, String? startDate, String? endDate, int? targetGrade, int? capacity, String? location, String? employmentType, String? sourceName, bool firstComeServed, int viewCount, String? publishedAt, String? closedAt, JobAiAnalysisSnapshotDto? aiAnalysis, JobEligibilitySnapshotDto application, bool bookmarked, List<JobFileDto> files
});


@override $CompanySummaryDtoCopyWith<$Res>? get company;@override $JobAiAnalysisSnapshotDtoCopyWith<$Res>? get aiAnalysis;@override $JobEligibilitySnapshotDtoCopyWith<$Res> get application;

}
/// @nodoc
class __$JobDetailResponseCopyWithImpl<$Res>
    implements _$JobDetailResponseCopyWith<$Res> {
  __$JobDetailResponseCopyWithImpl(this._self, this._then);

  final _JobDetailResponse _self;
  final $Res Function(_JobDetailResponse) _then;

/// Create a copy of JobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? title = null,Object? postingType = null,Object? applicationMethod = null,Object? status = null,Object? company = freezed,Object? content = freezed,Object? externalUrl = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? targetGrade = freezed,Object? capacity = freezed,Object? location = freezed,Object? employmentType = freezed,Object? sourceName = freezed,Object? firstComeServed = null,Object? viewCount = null,Object? publishedAt = freezed,Object? closedAt = freezed,Object? aiAnalysis = freezed,Object? application = null,Object? bookmarked = null,Object? files = null,}) {
  return _then(_JobDetailResponse(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,postingType: null == postingType ? _self.postingType : postingType // ignore: cast_nullable_to_non_nullable
as String,applicationMethod: null == applicationMethod ? _self.applicationMethod : applicationMethod // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as CompanySummaryDto?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,targetGrade: freezed == targetGrade ? _self.targetGrade : targetGrade // ignore: cast_nullable_to_non_nullable
as int?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,sourceName: freezed == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String?,firstComeServed: null == firstComeServed ? _self.firstComeServed : firstComeServed // ignore: cast_nullable_to_non_nullable
as bool,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as String?,aiAnalysis: freezed == aiAnalysis ? _self.aiAnalysis : aiAnalysis // ignore: cast_nullable_to_non_nullable
as JobAiAnalysisSnapshotDto?,application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as JobEligibilitySnapshotDto,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<JobFileDto>,
  ));
}

/// Create a copy of JobDetailResponse
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
}/// Create a copy of JobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobAiAnalysisSnapshotDtoCopyWith<$Res>? get aiAnalysis {
    if (_self.aiAnalysis == null) {
    return null;
  }

  return $JobAiAnalysisSnapshotDtoCopyWith<$Res>(_self.aiAnalysis!, (value) {
    return _then(_self.copyWith(aiAnalysis: value));
  });
}/// Create a copy of JobDetailResponse
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
mixin _$ApiResponseJobDetailResponse {

 bool get success; JobDetailResponse? get data; ApiErrorBody? get error; ResponseMeta? get meta;
/// Create a copy of ApiResponseJobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseJobDetailResponseCopyWith<ApiResponseJobDetailResponse> get copyWith => _$ApiResponseJobDetailResponseCopyWithImpl<ApiResponseJobDetailResponse>(this as ApiResponseJobDetailResponse, _$identity);

  /// Serializes this ApiResponseJobDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseJobDetailResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseJobDetailResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ApiResponseJobDetailResponseCopyWith<$Res>  {
  factory $ApiResponseJobDetailResponseCopyWith(ApiResponseJobDetailResponse value, $Res Function(ApiResponseJobDetailResponse) _then) = _$ApiResponseJobDetailResponseCopyWithImpl;
@useResult
$Res call({
 bool success, JobDetailResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


$JobDetailResponseCopyWith<$Res>? get data;$ApiErrorBodyCopyWith<$Res>? get error;$ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ApiResponseJobDetailResponseCopyWithImpl<$Res>
    implements $ApiResponseJobDetailResponseCopyWith<$Res> {
  _$ApiResponseJobDetailResponseCopyWithImpl(this._self, this._then);

  final ApiResponseJobDetailResponse _self;
  final $Res Function(ApiResponseJobDetailResponse) _then;

/// Create a copy of ApiResponseJobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as JobDetailResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}
/// Create a copy of ApiResponseJobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobDetailResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $JobDetailResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseJobDetailResponse
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
}/// Create a copy of ApiResponseJobDetailResponse
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


/// Adds pattern-matching-related methods to [ApiResponseJobDetailResponse].
extension ApiResponseJobDetailResponsePatterns on ApiResponseJobDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseJobDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseJobDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseJobDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseJobDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseJobDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseJobDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  JobDetailResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseJobDetailResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  JobDetailResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseJobDetailResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  JobDetailResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseJobDetailResponse() when $default != null:
return $default(_that.success,_that.data,_that.error,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiResponseJobDetailResponse implements ApiResponseJobDetailResponse {
  const _ApiResponseJobDetailResponse({required this.success, this.data, this.error, this.meta});
  factory _ApiResponseJobDetailResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseJobDetailResponseFromJson(json);

@override final  bool success;
@override final  JobDetailResponse? data;
@override final  ApiErrorBody? error;
@override final  ResponseMeta? meta;

/// Create a copy of ApiResponseJobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseJobDetailResponseCopyWith<_ApiResponseJobDetailResponse> get copyWith => __$ApiResponseJobDetailResponseCopyWithImpl<_ApiResponseJobDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseJobDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseJobDetailResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseJobDetailResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseJobDetailResponseCopyWith<$Res> implements $ApiResponseJobDetailResponseCopyWith<$Res> {
  factory _$ApiResponseJobDetailResponseCopyWith(_ApiResponseJobDetailResponse value, $Res Function(_ApiResponseJobDetailResponse) _then) = __$ApiResponseJobDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, JobDetailResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


@override $JobDetailResponseCopyWith<$Res>? get data;@override $ApiErrorBodyCopyWith<$Res>? get error;@override $ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ApiResponseJobDetailResponseCopyWithImpl<$Res>
    implements _$ApiResponseJobDetailResponseCopyWith<$Res> {
  __$ApiResponseJobDetailResponseCopyWithImpl(this._self, this._then);

  final _ApiResponseJobDetailResponse _self;
  final $Res Function(_ApiResponseJobDetailResponse) _then;

/// Create a copy of ApiResponseJobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_ApiResponseJobDetailResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as JobDetailResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}

/// Create a copy of ApiResponseJobDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobDetailResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $JobDetailResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseJobDetailResponse
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
}/// Create a copy of ApiResponseJobDetailResponse
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
