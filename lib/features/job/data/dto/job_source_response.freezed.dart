// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_source_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PublicJobSourceResponse {

 int get sourceId; String get sourceCode; String get name; String get sourceType; bool get active;
/// Create a copy of PublicJobSourceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicJobSourceResponseCopyWith<PublicJobSourceResponse> get copyWith => _$PublicJobSourceResponseCopyWithImpl<PublicJobSourceResponse>(this as PublicJobSourceResponse, _$identity);

  /// Serializes this PublicJobSourceResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicJobSourceResponse&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.sourceCode, sourceCode) || other.sourceCode == sourceCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.sourceType, sourceType) || other.sourceType == sourceType)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,sourceCode,name,sourceType,active);

@override
String toString() {
  return 'PublicJobSourceResponse(sourceId: $sourceId, sourceCode: $sourceCode, name: $name, sourceType: $sourceType, active: $active)';
}


}

/// @nodoc
abstract mixin class $PublicJobSourceResponseCopyWith<$Res>  {
  factory $PublicJobSourceResponseCopyWith(PublicJobSourceResponse value, $Res Function(PublicJobSourceResponse) _then) = _$PublicJobSourceResponseCopyWithImpl;
@useResult
$Res call({
 int sourceId, String sourceCode, String name, String sourceType, bool active
});




}
/// @nodoc
class _$PublicJobSourceResponseCopyWithImpl<$Res>
    implements $PublicJobSourceResponseCopyWith<$Res> {
  _$PublicJobSourceResponseCopyWithImpl(this._self, this._then);

  final PublicJobSourceResponse _self;
  final $Res Function(PublicJobSourceResponse) _then;

/// Create a copy of PublicJobSourceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? sourceCode = null,Object? name = null,Object? sourceType = null,Object? active = null,}) {
  return _then(_self.copyWith(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as int,sourceCode: null == sourceCode ? _self.sourceCode : sourceCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sourceType: null == sourceType ? _self.sourceType : sourceType // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PublicJobSourceResponse].
extension PublicJobSourceResponsePatterns on PublicJobSourceResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublicJobSourceResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublicJobSourceResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublicJobSourceResponse value)  $default,){
final _that = this;
switch (_that) {
case _PublicJobSourceResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublicJobSourceResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PublicJobSourceResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sourceId,  String sourceCode,  String name,  String sourceType,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublicJobSourceResponse() when $default != null:
return $default(_that.sourceId,_that.sourceCode,_that.name,_that.sourceType,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sourceId,  String sourceCode,  String name,  String sourceType,  bool active)  $default,) {final _that = this;
switch (_that) {
case _PublicJobSourceResponse():
return $default(_that.sourceId,_that.sourceCode,_that.name,_that.sourceType,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sourceId,  String sourceCode,  String name,  String sourceType,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _PublicJobSourceResponse() when $default != null:
return $default(_that.sourceId,_that.sourceCode,_that.name,_that.sourceType,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublicJobSourceResponse implements PublicJobSourceResponse {
  const _PublicJobSourceResponse({required this.sourceId, required this.sourceCode, required this.name, required this.sourceType, required this.active});
  factory _PublicJobSourceResponse.fromJson(Map<String, dynamic> json) => _$PublicJobSourceResponseFromJson(json);

@override final  int sourceId;
@override final  String sourceCode;
@override final  String name;
@override final  String sourceType;
@override final  bool active;

/// Create a copy of PublicJobSourceResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicJobSourceResponseCopyWith<_PublicJobSourceResponse> get copyWith => __$PublicJobSourceResponseCopyWithImpl<_PublicJobSourceResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicJobSourceResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicJobSourceResponse&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.sourceCode, sourceCode) || other.sourceCode == sourceCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.sourceType, sourceType) || other.sourceType == sourceType)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,sourceCode,name,sourceType,active);

@override
String toString() {
  return 'PublicJobSourceResponse(sourceId: $sourceId, sourceCode: $sourceCode, name: $name, sourceType: $sourceType, active: $active)';
}


}

/// @nodoc
abstract mixin class _$PublicJobSourceResponseCopyWith<$Res> implements $PublicJobSourceResponseCopyWith<$Res> {
  factory _$PublicJobSourceResponseCopyWith(_PublicJobSourceResponse value, $Res Function(_PublicJobSourceResponse) _then) = __$PublicJobSourceResponseCopyWithImpl;
@override @useResult
$Res call({
 int sourceId, String sourceCode, String name, String sourceType, bool active
});




}
/// @nodoc
class __$PublicJobSourceResponseCopyWithImpl<$Res>
    implements _$PublicJobSourceResponseCopyWith<$Res> {
  __$PublicJobSourceResponseCopyWithImpl(this._self, this._then);

  final _PublicJobSourceResponse _self;
  final $Res Function(_PublicJobSourceResponse) _then;

/// Create a copy of PublicJobSourceResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? sourceCode = null,Object? name = null,Object? sourceType = null,Object? active = null,}) {
  return _then(_PublicJobSourceResponse(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as int,sourceCode: null == sourceCode ? _self.sourceCode : sourceCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sourceType: null == sourceType ? _self.sourceType : sourceType // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PublicJobSourceListResponse {

 List<PublicJobSourceResponse> get sources;
/// Create a copy of PublicJobSourceListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicJobSourceListResponseCopyWith<PublicJobSourceListResponse> get copyWith => _$PublicJobSourceListResponseCopyWithImpl<PublicJobSourceListResponse>(this as PublicJobSourceListResponse, _$identity);

  /// Serializes this PublicJobSourceListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicJobSourceListResponse&&const DeepCollectionEquality().equals(other.sources, sources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sources));

@override
String toString() {
  return 'PublicJobSourceListResponse(sources: $sources)';
}


}

/// @nodoc
abstract mixin class $PublicJobSourceListResponseCopyWith<$Res>  {
  factory $PublicJobSourceListResponseCopyWith(PublicJobSourceListResponse value, $Res Function(PublicJobSourceListResponse) _then) = _$PublicJobSourceListResponseCopyWithImpl;
@useResult
$Res call({
 List<PublicJobSourceResponse> sources
});




}
/// @nodoc
class _$PublicJobSourceListResponseCopyWithImpl<$Res>
    implements $PublicJobSourceListResponseCopyWith<$Res> {
  _$PublicJobSourceListResponseCopyWithImpl(this._self, this._then);

  final PublicJobSourceListResponse _self;
  final $Res Function(PublicJobSourceListResponse) _then;

/// Create a copy of PublicJobSourceListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sources = null,}) {
  return _then(_self.copyWith(
sources: null == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<PublicJobSourceResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [PublicJobSourceListResponse].
extension PublicJobSourceListResponsePatterns on PublicJobSourceListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublicJobSourceListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublicJobSourceListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublicJobSourceListResponse value)  $default,){
final _that = this;
switch (_that) {
case _PublicJobSourceListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublicJobSourceListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PublicJobSourceListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PublicJobSourceResponse> sources)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublicJobSourceListResponse() when $default != null:
return $default(_that.sources);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PublicJobSourceResponse> sources)  $default,) {final _that = this;
switch (_that) {
case _PublicJobSourceListResponse():
return $default(_that.sources);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PublicJobSourceResponse> sources)?  $default,) {final _that = this;
switch (_that) {
case _PublicJobSourceListResponse() when $default != null:
return $default(_that.sources);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublicJobSourceListResponse implements PublicJobSourceListResponse {
  const _PublicJobSourceListResponse({final  List<PublicJobSourceResponse> sources = const []}): _sources = sources;
  factory _PublicJobSourceListResponse.fromJson(Map<String, dynamic> json) => _$PublicJobSourceListResponseFromJson(json);

 final  List<PublicJobSourceResponse> _sources;
@override@JsonKey() List<PublicJobSourceResponse> get sources {
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sources);
}


/// Create a copy of PublicJobSourceListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicJobSourceListResponseCopyWith<_PublicJobSourceListResponse> get copyWith => __$PublicJobSourceListResponseCopyWithImpl<_PublicJobSourceListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicJobSourceListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicJobSourceListResponse&&const DeepCollectionEquality().equals(other._sources, _sources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sources));

@override
String toString() {
  return 'PublicJobSourceListResponse(sources: $sources)';
}


}

/// @nodoc
abstract mixin class _$PublicJobSourceListResponseCopyWith<$Res> implements $PublicJobSourceListResponseCopyWith<$Res> {
  factory _$PublicJobSourceListResponseCopyWith(_PublicJobSourceListResponse value, $Res Function(_PublicJobSourceListResponse) _then) = __$PublicJobSourceListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<PublicJobSourceResponse> sources
});




}
/// @nodoc
class __$PublicJobSourceListResponseCopyWithImpl<$Res>
    implements _$PublicJobSourceListResponseCopyWith<$Res> {
  __$PublicJobSourceListResponseCopyWithImpl(this._self, this._then);

  final _PublicJobSourceListResponse _self;
  final $Res Function(_PublicJobSourceListResponse) _then;

/// Create a copy of PublicJobSourceListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sources = null,}) {
  return _then(_PublicJobSourceListResponse(
sources: null == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<PublicJobSourceResponse>,
  ));
}


}


/// @nodoc
mixin _$ApiResponsePublicJobSourceListResponse {

 bool get success; PublicJobSourceListResponse? get data; ApiErrorBody? get error; ResponseMeta? get meta;
/// Create a copy of ApiResponsePublicJobSourceListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponsePublicJobSourceListResponseCopyWith<ApiResponsePublicJobSourceListResponse> get copyWith => _$ApiResponsePublicJobSourceListResponseCopyWithImpl<ApiResponsePublicJobSourceListResponse>(this as ApiResponsePublicJobSourceListResponse, _$identity);

  /// Serializes this ApiResponsePublicJobSourceListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponsePublicJobSourceListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponsePublicJobSourceListResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ApiResponsePublicJobSourceListResponseCopyWith<$Res>  {
  factory $ApiResponsePublicJobSourceListResponseCopyWith(ApiResponsePublicJobSourceListResponse value, $Res Function(ApiResponsePublicJobSourceListResponse) _then) = _$ApiResponsePublicJobSourceListResponseCopyWithImpl;
@useResult
$Res call({
 bool success, PublicJobSourceListResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


$PublicJobSourceListResponseCopyWith<$Res>? get data;$ApiErrorBodyCopyWith<$Res>? get error;$ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ApiResponsePublicJobSourceListResponseCopyWithImpl<$Res>
    implements $ApiResponsePublicJobSourceListResponseCopyWith<$Res> {
  _$ApiResponsePublicJobSourceListResponseCopyWithImpl(this._self, this._then);

  final ApiResponsePublicJobSourceListResponse _self;
  final $Res Function(ApiResponsePublicJobSourceListResponse) _then;

/// Create a copy of ApiResponsePublicJobSourceListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PublicJobSourceListResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}
/// Create a copy of ApiResponsePublicJobSourceListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PublicJobSourceListResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PublicJobSourceListResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponsePublicJobSourceListResponse
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
}/// Create a copy of ApiResponsePublicJobSourceListResponse
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


/// Adds pattern-matching-related methods to [ApiResponsePublicJobSourceListResponse].
extension ApiResponsePublicJobSourceListResponsePatterns on ApiResponsePublicJobSourceListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponsePublicJobSourceListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponsePublicJobSourceListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponsePublicJobSourceListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponsePublicJobSourceListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponsePublicJobSourceListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponsePublicJobSourceListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  PublicJobSourceListResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponsePublicJobSourceListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  PublicJobSourceListResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _ApiResponsePublicJobSourceListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  PublicJobSourceListResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponsePublicJobSourceListResponse() when $default != null:
return $default(_that.success,_that.data,_that.error,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiResponsePublicJobSourceListResponse implements ApiResponsePublicJobSourceListResponse {
  const _ApiResponsePublicJobSourceListResponse({required this.success, this.data, this.error, this.meta});
  factory _ApiResponsePublicJobSourceListResponse.fromJson(Map<String, dynamic> json) => _$ApiResponsePublicJobSourceListResponseFromJson(json);

@override final  bool success;
@override final  PublicJobSourceListResponse? data;
@override final  ApiErrorBody? error;
@override final  ResponseMeta? meta;

/// Create a copy of ApiResponsePublicJobSourceListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponsePublicJobSourceListResponseCopyWith<_ApiResponsePublicJobSourceListResponse> get copyWith => __$ApiResponsePublicJobSourceListResponseCopyWithImpl<_ApiResponsePublicJobSourceListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponsePublicJobSourceListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponsePublicJobSourceListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponsePublicJobSourceListResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ApiResponsePublicJobSourceListResponseCopyWith<$Res> implements $ApiResponsePublicJobSourceListResponseCopyWith<$Res> {
  factory _$ApiResponsePublicJobSourceListResponseCopyWith(_ApiResponsePublicJobSourceListResponse value, $Res Function(_ApiResponsePublicJobSourceListResponse) _then) = __$ApiResponsePublicJobSourceListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, PublicJobSourceListResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


@override $PublicJobSourceListResponseCopyWith<$Res>? get data;@override $ApiErrorBodyCopyWith<$Res>? get error;@override $ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ApiResponsePublicJobSourceListResponseCopyWithImpl<$Res>
    implements _$ApiResponsePublicJobSourceListResponseCopyWith<$Res> {
  __$ApiResponsePublicJobSourceListResponseCopyWithImpl(this._self, this._then);

  final _ApiResponsePublicJobSourceListResponse _self;
  final $Res Function(_ApiResponsePublicJobSourceListResponse) _then;

/// Create a copy of ApiResponsePublicJobSourceListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_ApiResponsePublicJobSourceListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PublicJobSourceListResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}

/// Create a copy of ApiResponsePublicJobSourceListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PublicJobSourceListResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PublicJobSourceListResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponsePublicJobSourceListResponse
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
}/// Create a copy of ApiResponsePublicJobSourceListResponse
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
