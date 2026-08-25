// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_reanalysis_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiReanalysisResponse {

 int get jobId; String get status; int get reanalysisCount; int get remainingReanalysisCount; bool get canReanalyze; String get requestedAt; bool get reanalysis;
/// Create a copy of AiReanalysisResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiReanalysisResponseCopyWith<AiReanalysisResponse> get copyWith => _$AiReanalysisResponseCopyWithImpl<AiReanalysisResponse>(this as AiReanalysisResponse, _$identity);

  /// Serializes this AiReanalysisResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiReanalysisResponse&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.status, status) || other.status == status)&&(identical(other.reanalysisCount, reanalysisCount) || other.reanalysisCount == reanalysisCount)&&(identical(other.remainingReanalysisCount, remainingReanalysisCount) || other.remainingReanalysisCount == remainingReanalysisCount)&&(identical(other.canReanalyze, canReanalyze) || other.canReanalyze == canReanalyze)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.reanalysis, reanalysis) || other.reanalysis == reanalysis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,status,reanalysisCount,remainingReanalysisCount,canReanalyze,requestedAt,reanalysis);

@override
String toString() {
  return 'AiReanalysisResponse(jobId: $jobId, status: $status, reanalysisCount: $reanalysisCount, remainingReanalysisCount: $remainingReanalysisCount, canReanalyze: $canReanalyze, requestedAt: $requestedAt, reanalysis: $reanalysis)';
}


}

/// @nodoc
abstract mixin class $AiReanalysisResponseCopyWith<$Res>  {
  factory $AiReanalysisResponseCopyWith(AiReanalysisResponse value, $Res Function(AiReanalysisResponse) _then) = _$AiReanalysisResponseCopyWithImpl;
@useResult
$Res call({
 int jobId, String status, int reanalysisCount, int remainingReanalysisCount, bool canReanalyze, String requestedAt, bool reanalysis
});




}
/// @nodoc
class _$AiReanalysisResponseCopyWithImpl<$Res>
    implements $AiReanalysisResponseCopyWith<$Res> {
  _$AiReanalysisResponseCopyWithImpl(this._self, this._then);

  final AiReanalysisResponse _self;
  final $Res Function(AiReanalysisResponse) _then;

/// Create a copy of AiReanalysisResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobId = null,Object? status = null,Object? reanalysisCount = null,Object? remainingReanalysisCount = null,Object? canReanalyze = null,Object? requestedAt = null,Object? reanalysis = null,}) {
  return _then(_self.copyWith(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reanalysisCount: null == reanalysisCount ? _self.reanalysisCount : reanalysisCount // ignore: cast_nullable_to_non_nullable
as int,remainingReanalysisCount: null == remainingReanalysisCount ? _self.remainingReanalysisCount : remainingReanalysisCount // ignore: cast_nullable_to_non_nullable
as int,canReanalyze: null == canReanalyze ? _self.canReanalyze : canReanalyze // ignore: cast_nullable_to_non_nullable
as bool,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String,reanalysis: null == reanalysis ? _self.reanalysis : reanalysis // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AiReanalysisResponse].
extension AiReanalysisResponsePatterns on AiReanalysisResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiReanalysisResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiReanalysisResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiReanalysisResponse value)  $default,){
final _that = this;
switch (_that) {
case _AiReanalysisResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiReanalysisResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AiReanalysisResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int jobId,  String status,  int reanalysisCount,  int remainingReanalysisCount,  bool canReanalyze,  String requestedAt,  bool reanalysis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiReanalysisResponse() when $default != null:
return $default(_that.jobId,_that.status,_that.reanalysisCount,_that.remainingReanalysisCount,_that.canReanalyze,_that.requestedAt,_that.reanalysis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int jobId,  String status,  int reanalysisCount,  int remainingReanalysisCount,  bool canReanalyze,  String requestedAt,  bool reanalysis)  $default,) {final _that = this;
switch (_that) {
case _AiReanalysisResponse():
return $default(_that.jobId,_that.status,_that.reanalysisCount,_that.remainingReanalysisCount,_that.canReanalyze,_that.requestedAt,_that.reanalysis);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int jobId,  String status,  int reanalysisCount,  int remainingReanalysisCount,  bool canReanalyze,  String requestedAt,  bool reanalysis)?  $default,) {final _that = this;
switch (_that) {
case _AiReanalysisResponse() when $default != null:
return $default(_that.jobId,_that.status,_that.reanalysisCount,_that.remainingReanalysisCount,_that.canReanalyze,_that.requestedAt,_that.reanalysis);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiReanalysisResponse implements AiReanalysisResponse {
  const _AiReanalysisResponse({required this.jobId, required this.status, this.reanalysisCount = 0, this.remainingReanalysisCount = 0, this.canReanalyze = false, required this.requestedAt, this.reanalysis = false});
  factory _AiReanalysisResponse.fromJson(Map<String, dynamic> json) => _$AiReanalysisResponseFromJson(json);

@override final  int jobId;
@override final  String status;
@override@JsonKey() final  int reanalysisCount;
@override@JsonKey() final  int remainingReanalysisCount;
@override@JsonKey() final  bool canReanalyze;
@override final  String requestedAt;
@override@JsonKey() final  bool reanalysis;

/// Create a copy of AiReanalysisResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiReanalysisResponseCopyWith<_AiReanalysisResponse> get copyWith => __$AiReanalysisResponseCopyWithImpl<_AiReanalysisResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiReanalysisResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiReanalysisResponse&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.status, status) || other.status == status)&&(identical(other.reanalysisCount, reanalysisCount) || other.reanalysisCount == reanalysisCount)&&(identical(other.remainingReanalysisCount, remainingReanalysisCount) || other.remainingReanalysisCount == remainingReanalysisCount)&&(identical(other.canReanalyze, canReanalyze) || other.canReanalyze == canReanalyze)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.reanalysis, reanalysis) || other.reanalysis == reanalysis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,status,reanalysisCount,remainingReanalysisCount,canReanalyze,requestedAt,reanalysis);

@override
String toString() {
  return 'AiReanalysisResponse(jobId: $jobId, status: $status, reanalysisCount: $reanalysisCount, remainingReanalysisCount: $remainingReanalysisCount, canReanalyze: $canReanalyze, requestedAt: $requestedAt, reanalysis: $reanalysis)';
}


}

/// @nodoc
abstract mixin class _$AiReanalysisResponseCopyWith<$Res> implements $AiReanalysisResponseCopyWith<$Res> {
  factory _$AiReanalysisResponseCopyWith(_AiReanalysisResponse value, $Res Function(_AiReanalysisResponse) _then) = __$AiReanalysisResponseCopyWithImpl;
@override @useResult
$Res call({
 int jobId, String status, int reanalysisCount, int remainingReanalysisCount, bool canReanalyze, String requestedAt, bool reanalysis
});




}
/// @nodoc
class __$AiReanalysisResponseCopyWithImpl<$Res>
    implements _$AiReanalysisResponseCopyWith<$Res> {
  __$AiReanalysisResponseCopyWithImpl(this._self, this._then);

  final _AiReanalysisResponse _self;
  final $Res Function(_AiReanalysisResponse) _then;

/// Create a copy of AiReanalysisResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? status = null,Object? reanalysisCount = null,Object? remainingReanalysisCount = null,Object? canReanalyze = null,Object? requestedAt = null,Object? reanalysis = null,}) {
  return _then(_AiReanalysisResponse(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reanalysisCount: null == reanalysisCount ? _self.reanalysisCount : reanalysisCount // ignore: cast_nullable_to_non_nullable
as int,remainingReanalysisCount: null == remainingReanalysisCount ? _self.remainingReanalysisCount : remainingReanalysisCount // ignore: cast_nullable_to_non_nullable
as int,canReanalyze: null == canReanalyze ? _self.canReanalyze : canReanalyze // ignore: cast_nullable_to_non_nullable
as bool,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String,reanalysis: null == reanalysis ? _self.reanalysis : reanalysis // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ApiResponseAiReanalysisResponse {

 bool get success; AiReanalysisResponse? get data; ApiErrorBody? get error; ResponseMeta? get meta;
/// Create a copy of ApiResponseAiReanalysisResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseAiReanalysisResponseCopyWith<ApiResponseAiReanalysisResponse> get copyWith => _$ApiResponseAiReanalysisResponseCopyWithImpl<ApiResponseAiReanalysisResponse>(this as ApiResponseAiReanalysisResponse, _$identity);

  /// Serializes this ApiResponseAiReanalysisResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseAiReanalysisResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseAiReanalysisResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ApiResponseAiReanalysisResponseCopyWith<$Res>  {
  factory $ApiResponseAiReanalysisResponseCopyWith(ApiResponseAiReanalysisResponse value, $Res Function(ApiResponseAiReanalysisResponse) _then) = _$ApiResponseAiReanalysisResponseCopyWithImpl;
@useResult
$Res call({
 bool success, AiReanalysisResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


$AiReanalysisResponseCopyWith<$Res>? get data;$ApiErrorBodyCopyWith<$Res>? get error;$ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ApiResponseAiReanalysisResponseCopyWithImpl<$Res>
    implements $ApiResponseAiReanalysisResponseCopyWith<$Res> {
  _$ApiResponseAiReanalysisResponseCopyWithImpl(this._self, this._then);

  final ApiResponseAiReanalysisResponse _self;
  final $Res Function(ApiResponseAiReanalysisResponse) _then;

/// Create a copy of ApiResponseAiReanalysisResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AiReanalysisResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}
/// Create a copy of ApiResponseAiReanalysisResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiReanalysisResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AiReanalysisResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseAiReanalysisResponse
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
}/// Create a copy of ApiResponseAiReanalysisResponse
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


/// Adds pattern-matching-related methods to [ApiResponseAiReanalysisResponse].
extension ApiResponseAiReanalysisResponsePatterns on ApiResponseAiReanalysisResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseAiReanalysisResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseAiReanalysisResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseAiReanalysisResponse value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseAiReanalysisResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseAiReanalysisResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseAiReanalysisResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  AiReanalysisResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseAiReanalysisResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  AiReanalysisResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseAiReanalysisResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  AiReanalysisResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseAiReanalysisResponse() when $default != null:
return $default(_that.success,_that.data,_that.error,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiResponseAiReanalysisResponse implements ApiResponseAiReanalysisResponse {
  const _ApiResponseAiReanalysisResponse({required this.success, this.data, this.error, this.meta});
  factory _ApiResponseAiReanalysisResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseAiReanalysisResponseFromJson(json);

@override final  bool success;
@override final  AiReanalysisResponse? data;
@override final  ApiErrorBody? error;
@override final  ResponseMeta? meta;

/// Create a copy of ApiResponseAiReanalysisResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseAiReanalysisResponseCopyWith<_ApiResponseAiReanalysisResponse> get copyWith => __$ApiResponseAiReanalysisResponseCopyWithImpl<_ApiResponseAiReanalysisResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseAiReanalysisResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseAiReanalysisResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseAiReanalysisResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseAiReanalysisResponseCopyWith<$Res> implements $ApiResponseAiReanalysisResponseCopyWith<$Res> {
  factory _$ApiResponseAiReanalysisResponseCopyWith(_ApiResponseAiReanalysisResponse value, $Res Function(_ApiResponseAiReanalysisResponse) _then) = __$ApiResponseAiReanalysisResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, AiReanalysisResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


@override $AiReanalysisResponseCopyWith<$Res>? get data;@override $ApiErrorBodyCopyWith<$Res>? get error;@override $ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ApiResponseAiReanalysisResponseCopyWithImpl<$Res>
    implements _$ApiResponseAiReanalysisResponseCopyWith<$Res> {
  __$ApiResponseAiReanalysisResponseCopyWithImpl(this._self, this._then);

  final _ApiResponseAiReanalysisResponse _self;
  final $Res Function(_ApiResponseAiReanalysisResponse) _then;

/// Create a copy of ApiResponseAiReanalysisResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_ApiResponseAiReanalysisResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AiReanalysisResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}

/// Create a copy of ApiResponseAiReanalysisResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiReanalysisResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AiReanalysisResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseAiReanalysisResponse
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
}/// Create a copy of ApiResponseAiReanalysisResponse
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
