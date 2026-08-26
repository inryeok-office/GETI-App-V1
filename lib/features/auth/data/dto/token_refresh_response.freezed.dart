// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_refresh_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenRefreshResponse {

 String get accessToken; String get refreshToken; int get accessTokenExpiresInSeconds;
/// Create a copy of TokenRefreshResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenRefreshResponseCopyWith<TokenRefreshResponse> get copyWith => _$TokenRefreshResponseCopyWithImpl<TokenRefreshResponse>(this as TokenRefreshResponse, _$identity);

  /// Serializes this TokenRefreshResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenRefreshResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.accessTokenExpiresInSeconds, accessTokenExpiresInSeconds) || other.accessTokenExpiresInSeconds == accessTokenExpiresInSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,accessTokenExpiresInSeconds);

@override
String toString() {
  return 'TokenRefreshResponse(accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiresInSeconds: $accessTokenExpiresInSeconds)';
}


}

/// @nodoc
abstract mixin class $TokenRefreshResponseCopyWith<$Res>  {
  factory $TokenRefreshResponseCopyWith(TokenRefreshResponse value, $Res Function(TokenRefreshResponse) _then) = _$TokenRefreshResponseCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken, int accessTokenExpiresInSeconds
});




}
/// @nodoc
class _$TokenRefreshResponseCopyWithImpl<$Res>
    implements $TokenRefreshResponseCopyWith<$Res> {
  _$TokenRefreshResponseCopyWithImpl(this._self, this._then);

  final TokenRefreshResponse _self;
  final $Res Function(TokenRefreshResponse) _then;

/// Create a copy of TokenRefreshResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? accessTokenExpiresInSeconds = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresInSeconds: null == accessTokenExpiresInSeconds ? _self.accessTokenExpiresInSeconds : accessTokenExpiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenRefreshResponse].
extension TokenRefreshResponsePatterns on TokenRefreshResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenRefreshResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenRefreshResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenRefreshResponse value)  $default,){
final _that = this;
switch (_that) {
case _TokenRefreshResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenRefreshResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TokenRefreshResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  int accessTokenExpiresInSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenRefreshResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.accessTokenExpiresInSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  int accessTokenExpiresInSeconds)  $default,) {final _that = this;
switch (_that) {
case _TokenRefreshResponse():
return $default(_that.accessToken,_that.refreshToken,_that.accessTokenExpiresInSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken,  int accessTokenExpiresInSeconds)?  $default,) {final _that = this;
switch (_that) {
case _TokenRefreshResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.accessTokenExpiresInSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenRefreshResponse implements TokenRefreshResponse {
  const _TokenRefreshResponse({required this.accessToken, required this.refreshToken, required this.accessTokenExpiresInSeconds});
  factory _TokenRefreshResponse.fromJson(Map<String, dynamic> json) => _$TokenRefreshResponseFromJson(json);

@override final  String accessToken;
@override final  String refreshToken;
@override final  int accessTokenExpiresInSeconds;

/// Create a copy of TokenRefreshResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenRefreshResponseCopyWith<_TokenRefreshResponse> get copyWith => __$TokenRefreshResponseCopyWithImpl<_TokenRefreshResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenRefreshResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenRefreshResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.accessTokenExpiresInSeconds, accessTokenExpiresInSeconds) || other.accessTokenExpiresInSeconds == accessTokenExpiresInSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,accessTokenExpiresInSeconds);

@override
String toString() {
  return 'TokenRefreshResponse(accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiresInSeconds: $accessTokenExpiresInSeconds)';
}


}

/// @nodoc
abstract mixin class _$TokenRefreshResponseCopyWith<$Res> implements $TokenRefreshResponseCopyWith<$Res> {
  factory _$TokenRefreshResponseCopyWith(_TokenRefreshResponse value, $Res Function(_TokenRefreshResponse) _then) = __$TokenRefreshResponseCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken, int accessTokenExpiresInSeconds
});




}
/// @nodoc
class __$TokenRefreshResponseCopyWithImpl<$Res>
    implements _$TokenRefreshResponseCopyWith<$Res> {
  __$TokenRefreshResponseCopyWithImpl(this._self, this._then);

  final _TokenRefreshResponse _self;
  final $Res Function(_TokenRefreshResponse) _then;

/// Create a copy of TokenRefreshResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? accessTokenExpiresInSeconds = null,}) {
  return _then(_TokenRefreshResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresInSeconds: null == accessTokenExpiresInSeconds ? _self.accessTokenExpiresInSeconds : accessTokenExpiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ApiResponseTokenRefreshResponse {

 bool get success; TokenRefreshResponse? get data; ApiErrorBody? get error; ResponseMeta? get meta;
/// Create a copy of ApiResponseTokenRefreshResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseTokenRefreshResponseCopyWith<ApiResponseTokenRefreshResponse> get copyWith => _$ApiResponseTokenRefreshResponseCopyWithImpl<ApiResponseTokenRefreshResponse>(this as ApiResponseTokenRefreshResponse, _$identity);

  /// Serializes this ApiResponseTokenRefreshResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseTokenRefreshResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseTokenRefreshResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ApiResponseTokenRefreshResponseCopyWith<$Res>  {
  factory $ApiResponseTokenRefreshResponseCopyWith(ApiResponseTokenRefreshResponse value, $Res Function(ApiResponseTokenRefreshResponse) _then) = _$ApiResponseTokenRefreshResponseCopyWithImpl;
@useResult
$Res call({
 bool success, TokenRefreshResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


$TokenRefreshResponseCopyWith<$Res>? get data;$ApiErrorBodyCopyWith<$Res>? get error;$ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ApiResponseTokenRefreshResponseCopyWithImpl<$Res>
    implements $ApiResponseTokenRefreshResponseCopyWith<$Res> {
  _$ApiResponseTokenRefreshResponseCopyWithImpl(this._self, this._then);

  final ApiResponseTokenRefreshResponse _self;
  final $Res Function(ApiResponseTokenRefreshResponse) _then;

/// Create a copy of ApiResponseTokenRefreshResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TokenRefreshResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}
/// Create a copy of ApiResponseTokenRefreshResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenRefreshResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $TokenRefreshResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseTokenRefreshResponse
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
}/// Create a copy of ApiResponseTokenRefreshResponse
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


/// Adds pattern-matching-related methods to [ApiResponseTokenRefreshResponse].
extension ApiResponseTokenRefreshResponsePatterns on ApiResponseTokenRefreshResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseTokenRefreshResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseTokenRefreshResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseTokenRefreshResponse value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseTokenRefreshResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseTokenRefreshResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseTokenRefreshResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  TokenRefreshResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseTokenRefreshResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  TokenRefreshResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseTokenRefreshResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  TokenRefreshResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseTokenRefreshResponse() when $default != null:
return $default(_that.success,_that.data,_that.error,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiResponseTokenRefreshResponse implements ApiResponseTokenRefreshResponse {
  const _ApiResponseTokenRefreshResponse({required this.success, this.data, this.error, this.meta});
  factory _ApiResponseTokenRefreshResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseTokenRefreshResponseFromJson(json);

@override final  bool success;
@override final  TokenRefreshResponse? data;
@override final  ApiErrorBody? error;
@override final  ResponseMeta? meta;

/// Create a copy of ApiResponseTokenRefreshResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseTokenRefreshResponseCopyWith<_ApiResponseTokenRefreshResponse> get copyWith => __$ApiResponseTokenRefreshResponseCopyWithImpl<_ApiResponseTokenRefreshResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseTokenRefreshResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseTokenRefreshResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseTokenRefreshResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseTokenRefreshResponseCopyWith<$Res> implements $ApiResponseTokenRefreshResponseCopyWith<$Res> {
  factory _$ApiResponseTokenRefreshResponseCopyWith(_ApiResponseTokenRefreshResponse value, $Res Function(_ApiResponseTokenRefreshResponse) _then) = __$ApiResponseTokenRefreshResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, TokenRefreshResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


@override $TokenRefreshResponseCopyWith<$Res>? get data;@override $ApiErrorBodyCopyWith<$Res>? get error;@override $ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ApiResponseTokenRefreshResponseCopyWithImpl<$Res>
    implements _$ApiResponseTokenRefreshResponseCopyWith<$Res> {
  __$ApiResponseTokenRefreshResponseCopyWithImpl(this._self, this._then);

  final _ApiResponseTokenRefreshResponse _self;
  final $Res Function(_ApiResponseTokenRefreshResponse) _then;

/// Create a copy of ApiResponseTokenRefreshResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_ApiResponseTokenRefreshResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TokenRefreshResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}

/// Create a copy of ApiResponseTokenRefreshResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenRefreshResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $TokenRefreshResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseTokenRefreshResponse
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
}/// Create a copy of ApiResponseTokenRefreshResponse
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
