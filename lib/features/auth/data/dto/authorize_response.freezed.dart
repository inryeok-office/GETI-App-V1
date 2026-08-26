// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authorize_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthorizeResponse {

 String get authorizationUrl; String get state;
/// Create a copy of AuthorizeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorizeResponseCopyWith<AuthorizeResponse> get copyWith => _$AuthorizeResponseCopyWithImpl<AuthorizeResponse>(this as AuthorizeResponse, _$identity);

  /// Serializes this AuthorizeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthorizeResponse&&(identical(other.authorizationUrl, authorizationUrl) || other.authorizationUrl == authorizationUrl)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authorizationUrl,state);

@override
String toString() {
  return 'AuthorizeResponse(authorizationUrl: $authorizationUrl, state: $state)';
}


}

/// @nodoc
abstract mixin class $AuthorizeResponseCopyWith<$Res>  {
  factory $AuthorizeResponseCopyWith(AuthorizeResponse value, $Res Function(AuthorizeResponse) _then) = _$AuthorizeResponseCopyWithImpl;
@useResult
$Res call({
 String authorizationUrl, String state
});




}
/// @nodoc
class _$AuthorizeResponseCopyWithImpl<$Res>
    implements $AuthorizeResponseCopyWith<$Res> {
  _$AuthorizeResponseCopyWithImpl(this._self, this._then);

  final AuthorizeResponse _self;
  final $Res Function(AuthorizeResponse) _then;

/// Create a copy of AuthorizeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authorizationUrl = null,Object? state = null,}) {
  return _then(_self.copyWith(
authorizationUrl: null == authorizationUrl ? _self.authorizationUrl : authorizationUrl // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthorizeResponse].
extension AuthorizeResponsePatterns on AuthorizeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthorizeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthorizeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthorizeResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuthorizeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthorizeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuthorizeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String authorizationUrl,  String state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthorizeResponse() when $default != null:
return $default(_that.authorizationUrl,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String authorizationUrl,  String state)  $default,) {final _that = this;
switch (_that) {
case _AuthorizeResponse():
return $default(_that.authorizationUrl,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String authorizationUrl,  String state)?  $default,) {final _that = this;
switch (_that) {
case _AuthorizeResponse() when $default != null:
return $default(_that.authorizationUrl,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthorizeResponse implements AuthorizeResponse {
  const _AuthorizeResponse({required this.authorizationUrl, required this.state});
  factory _AuthorizeResponse.fromJson(Map<String, dynamic> json) => _$AuthorizeResponseFromJson(json);

@override final  String authorizationUrl;
@override final  String state;

/// Create a copy of AuthorizeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorizeResponseCopyWith<_AuthorizeResponse> get copyWith => __$AuthorizeResponseCopyWithImpl<_AuthorizeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthorizeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthorizeResponse&&(identical(other.authorizationUrl, authorizationUrl) || other.authorizationUrl == authorizationUrl)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authorizationUrl,state);

@override
String toString() {
  return 'AuthorizeResponse(authorizationUrl: $authorizationUrl, state: $state)';
}


}

/// @nodoc
abstract mixin class _$AuthorizeResponseCopyWith<$Res> implements $AuthorizeResponseCopyWith<$Res> {
  factory _$AuthorizeResponseCopyWith(_AuthorizeResponse value, $Res Function(_AuthorizeResponse) _then) = __$AuthorizeResponseCopyWithImpl;
@override @useResult
$Res call({
 String authorizationUrl, String state
});




}
/// @nodoc
class __$AuthorizeResponseCopyWithImpl<$Res>
    implements _$AuthorizeResponseCopyWith<$Res> {
  __$AuthorizeResponseCopyWithImpl(this._self, this._then);

  final _AuthorizeResponse _self;
  final $Res Function(_AuthorizeResponse) _then;

/// Create a copy of AuthorizeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authorizationUrl = null,Object? state = null,}) {
  return _then(_AuthorizeResponse(
authorizationUrl: null == authorizationUrl ? _self.authorizationUrl : authorizationUrl // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ApiResponseAuthorizeResponse {

 bool get success; AuthorizeResponse? get data; ApiErrorBody? get error; ResponseMeta? get meta;
/// Create a copy of ApiResponseAuthorizeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseAuthorizeResponseCopyWith<ApiResponseAuthorizeResponse> get copyWith => _$ApiResponseAuthorizeResponseCopyWithImpl<ApiResponseAuthorizeResponse>(this as ApiResponseAuthorizeResponse, _$identity);

  /// Serializes this ApiResponseAuthorizeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseAuthorizeResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseAuthorizeResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ApiResponseAuthorizeResponseCopyWith<$Res>  {
  factory $ApiResponseAuthorizeResponseCopyWith(ApiResponseAuthorizeResponse value, $Res Function(ApiResponseAuthorizeResponse) _then) = _$ApiResponseAuthorizeResponseCopyWithImpl;
@useResult
$Res call({
 bool success, AuthorizeResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


$AuthorizeResponseCopyWith<$Res>? get data;$ApiErrorBodyCopyWith<$Res>? get error;$ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ApiResponseAuthorizeResponseCopyWithImpl<$Res>
    implements $ApiResponseAuthorizeResponseCopyWith<$Res> {
  _$ApiResponseAuthorizeResponseCopyWithImpl(this._self, this._then);

  final ApiResponseAuthorizeResponse _self;
  final $Res Function(ApiResponseAuthorizeResponse) _then;

/// Create a copy of ApiResponseAuthorizeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthorizeResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}
/// Create a copy of ApiResponseAuthorizeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorizeResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AuthorizeResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseAuthorizeResponse
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
}/// Create a copy of ApiResponseAuthorizeResponse
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


/// Adds pattern-matching-related methods to [ApiResponseAuthorizeResponse].
extension ApiResponseAuthorizeResponsePatterns on ApiResponseAuthorizeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseAuthorizeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseAuthorizeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseAuthorizeResponse value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseAuthorizeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseAuthorizeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseAuthorizeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  AuthorizeResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseAuthorizeResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  AuthorizeResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseAuthorizeResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  AuthorizeResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseAuthorizeResponse() when $default != null:
return $default(_that.success,_that.data,_that.error,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiResponseAuthorizeResponse implements ApiResponseAuthorizeResponse {
  const _ApiResponseAuthorizeResponse({required this.success, this.data, this.error, this.meta});
  factory _ApiResponseAuthorizeResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseAuthorizeResponseFromJson(json);

@override final  bool success;
@override final  AuthorizeResponse? data;
@override final  ApiErrorBody? error;
@override final  ResponseMeta? meta;

/// Create a copy of ApiResponseAuthorizeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseAuthorizeResponseCopyWith<_ApiResponseAuthorizeResponse> get copyWith => __$ApiResponseAuthorizeResponseCopyWithImpl<_ApiResponseAuthorizeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseAuthorizeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseAuthorizeResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseAuthorizeResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseAuthorizeResponseCopyWith<$Res> implements $ApiResponseAuthorizeResponseCopyWith<$Res> {
  factory _$ApiResponseAuthorizeResponseCopyWith(_ApiResponseAuthorizeResponse value, $Res Function(_ApiResponseAuthorizeResponse) _then) = __$ApiResponseAuthorizeResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, AuthorizeResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


@override $AuthorizeResponseCopyWith<$Res>? get data;@override $ApiErrorBodyCopyWith<$Res>? get error;@override $ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ApiResponseAuthorizeResponseCopyWithImpl<$Res>
    implements _$ApiResponseAuthorizeResponseCopyWith<$Res> {
  __$ApiResponseAuthorizeResponseCopyWithImpl(this._self, this._then);

  final _ApiResponseAuthorizeResponse _self;
  final $Res Function(_ApiResponseAuthorizeResponse) _then;

/// Create a copy of ApiResponseAuthorizeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_ApiResponseAuthorizeResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthorizeResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}

/// Create a copy of ApiResponseAuthorizeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorizeResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AuthorizeResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseAuthorizeResponse
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
}/// Create a copy of ApiResponseAuthorizeResponse
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
