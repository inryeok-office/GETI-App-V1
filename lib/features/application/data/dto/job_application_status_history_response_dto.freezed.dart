// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_application_status_history_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobApplicationStatusHistoryApiResponseDto {

 bool? get success; List<JobApplicationStatusHistoryResponseDto> get data; ApiResponseMetaDto? get meta;

  /// Serializes this JobApplicationStatusHistoryApiResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobApplicationStatusHistoryApiResponseDto&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(data),meta);

@override
String toString() {
  return 'JobApplicationStatusHistoryApiResponseDto(success: $success, data: $data, meta: $meta)';
}


}




/// Adds pattern-matching-related methods to [JobApplicationStatusHistoryApiResponseDto].
extension JobApplicationStatusHistoryApiResponseDtoPatterns on JobApplicationStatusHistoryApiResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobApplicationStatusHistoryApiResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobApplicationStatusHistoryApiResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobApplicationStatusHistoryApiResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _JobApplicationStatusHistoryApiResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobApplicationStatusHistoryApiResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _JobApplicationStatusHistoryApiResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  List<JobApplicationStatusHistoryResponseDto> data,  ApiResponseMetaDto? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobApplicationStatusHistoryApiResponseDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  List<JobApplicationStatusHistoryResponseDto> data,  ApiResponseMetaDto? meta)  $default,) {final _that = this;
switch (_that) {
case _JobApplicationStatusHistoryApiResponseDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  List<JobApplicationStatusHistoryResponseDto> data,  ApiResponseMetaDto? meta)?  $default,) {final _that = this;
switch (_that) {
case _JobApplicationStatusHistoryApiResponseDto() when $default != null:
return $default(_that.success,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobApplicationStatusHistoryApiResponseDto implements JobApplicationStatusHistoryApiResponseDto {
  const _JobApplicationStatusHistoryApiResponseDto({this.success, final  List<JobApplicationStatusHistoryResponseDto> data = const <JobApplicationStatusHistoryResponseDto>[], this.meta}): _data = data;
  factory _JobApplicationStatusHistoryApiResponseDto.fromJson(Map<String, dynamic> json) => _$JobApplicationStatusHistoryApiResponseDtoFromJson(json);

@override final  bool? success;
 final  List<JobApplicationStatusHistoryResponseDto> _data;
@override@JsonKey() List<JobApplicationStatusHistoryResponseDto> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  ApiResponseMetaDto? meta;


@override
Map<String, dynamic> toJson() {
  return _$JobApplicationStatusHistoryApiResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobApplicationStatusHistoryApiResponseDto&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_data),meta);

@override
String toString() {
  return 'JobApplicationStatusHistoryApiResponseDto(success: $success, data: $data, meta: $meta)';
}


}





/// @nodoc
mixin _$JobApplicationStatusHistoryResponseDto {

 int? get historyId;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) JobApplicationStatusDto? get fromStatus;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) JobApplicationStatusDto? get toStatus; String? get action; int? get actorMemberId; String? get reason; DateTime? get createdAt;

  /// Serializes this JobApplicationStatusHistoryResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobApplicationStatusHistoryResponseDto&&(identical(other.historyId, historyId) || other.historyId == historyId)&&(identical(other.fromStatus, fromStatus) || other.fromStatus == fromStatus)&&(identical(other.toStatus, toStatus) || other.toStatus == toStatus)&&(identical(other.action, action) || other.action == action)&&(identical(other.actorMemberId, actorMemberId) || other.actorMemberId == actorMemberId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,historyId,fromStatus,toStatus,action,actorMemberId,reason,createdAt);

@override
String toString() {
  return 'JobApplicationStatusHistoryResponseDto(historyId: $historyId, fromStatus: $fromStatus, toStatus: $toStatus, action: $action, actorMemberId: $actorMemberId, reason: $reason, createdAt: $createdAt)';
}


}




/// Adds pattern-matching-related methods to [JobApplicationStatusHistoryResponseDto].
extension JobApplicationStatusHistoryResponseDtoPatterns on JobApplicationStatusHistoryResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobApplicationStatusHistoryResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobApplicationStatusHistoryResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobApplicationStatusHistoryResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _JobApplicationStatusHistoryResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobApplicationStatusHistoryResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _JobApplicationStatusHistoryResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? historyId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobApplicationStatusDto? fromStatus, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobApplicationStatusDto? toStatus,  String? action,  int? actorMemberId,  String? reason,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobApplicationStatusHistoryResponseDto() when $default != null:
return $default(_that.historyId,_that.fromStatus,_that.toStatus,_that.action,_that.actorMemberId,_that.reason,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? historyId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobApplicationStatusDto? fromStatus, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobApplicationStatusDto? toStatus,  String? action,  int? actorMemberId,  String? reason,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _JobApplicationStatusHistoryResponseDto():
return $default(_that.historyId,_that.fromStatus,_that.toStatus,_that.action,_that.actorMemberId,_that.reason,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? historyId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobApplicationStatusDto? fromStatus, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobApplicationStatusDto? toStatus,  String? action,  int? actorMemberId,  String? reason,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _JobApplicationStatusHistoryResponseDto() when $default != null:
return $default(_that.historyId,_that.fromStatus,_that.toStatus,_that.action,_that.actorMemberId,_that.reason,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobApplicationStatusHistoryResponseDto implements JobApplicationStatusHistoryResponseDto {
  const _JobApplicationStatusHistoryResponseDto({this.historyId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.fromStatus, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.toStatus, this.action, this.actorMemberId, this.reason, this.createdAt});
  factory _JobApplicationStatusHistoryResponseDto.fromJson(Map<String, dynamic> json) => _$JobApplicationStatusHistoryResponseDtoFromJson(json);

@override final  int? historyId;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  JobApplicationStatusDto? fromStatus;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  JobApplicationStatusDto? toStatus;
@override final  String? action;
@override final  int? actorMemberId;
@override final  String? reason;
@override final  DateTime? createdAt;


@override
Map<String, dynamic> toJson() {
  return _$JobApplicationStatusHistoryResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobApplicationStatusHistoryResponseDto&&(identical(other.historyId, historyId) || other.historyId == historyId)&&(identical(other.fromStatus, fromStatus) || other.fromStatus == fromStatus)&&(identical(other.toStatus, toStatus) || other.toStatus == toStatus)&&(identical(other.action, action) || other.action == action)&&(identical(other.actorMemberId, actorMemberId) || other.actorMemberId == actorMemberId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,historyId,fromStatus,toStatus,action,actorMemberId,reason,createdAt);

@override
String toString() {
  return 'JobApplicationStatusHistoryResponseDto(historyId: $historyId, fromStatus: $fromStatus, toStatus: $toStatus, action: $action, actorMemberId: $actorMemberId, reason: $reason, createdAt: $createdAt)';
}


}




// dart format on
