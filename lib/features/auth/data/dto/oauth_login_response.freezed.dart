// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oauth_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OAuthLoginResponse {

 String get accessToken; String get refreshToken; int get accessTokenExpiresInSeconds; int get memberId; List<String> get roles; String? get status; bool get newMember;
/// Create a copy of OAuthLoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OAuthLoginResponseCopyWith<OAuthLoginResponse> get copyWith => _$OAuthLoginResponseCopyWithImpl<OAuthLoginResponse>(this as OAuthLoginResponse, _$identity);

  /// Serializes this OAuthLoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OAuthLoginResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.accessTokenExpiresInSeconds, accessTokenExpiresInSeconds) || other.accessTokenExpiresInSeconds == accessTokenExpiresInSeconds)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.status, status) || other.status == status)&&(identical(other.newMember, newMember) || other.newMember == newMember));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,accessTokenExpiresInSeconds,memberId,const DeepCollectionEquality().hash(roles),status,newMember);

@override
String toString() {
  return 'OAuthLoginResponse(accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiresInSeconds: $accessTokenExpiresInSeconds, memberId: $memberId, roles: $roles, status: $status, newMember: $newMember)';
}


}

/// @nodoc
abstract mixin class $OAuthLoginResponseCopyWith<$Res>  {
  factory $OAuthLoginResponseCopyWith(OAuthLoginResponse value, $Res Function(OAuthLoginResponse) _then) = _$OAuthLoginResponseCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken, int accessTokenExpiresInSeconds, int memberId, List<String> roles, String? status, bool newMember
});




}
/// @nodoc
class _$OAuthLoginResponseCopyWithImpl<$Res>
    implements $OAuthLoginResponseCopyWith<$Res> {
  _$OAuthLoginResponseCopyWithImpl(this._self, this._then);

  final OAuthLoginResponse _self;
  final $Res Function(OAuthLoginResponse) _then;

/// Create a copy of OAuthLoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? accessTokenExpiresInSeconds = null,Object? memberId = null,Object? roles = null,Object? status = freezed,Object? newMember = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresInSeconds: null == accessTokenExpiresInSeconds ? _self.accessTokenExpiresInSeconds : accessTokenExpiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as int,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,newMember: null == newMember ? _self.newMember : newMember // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OAuthLoginResponse].
extension OAuthLoginResponsePatterns on OAuthLoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OAuthLoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OAuthLoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OAuthLoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _OAuthLoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OAuthLoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OAuthLoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  int accessTokenExpiresInSeconds,  int memberId,  List<String> roles,  String? status,  bool newMember)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OAuthLoginResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.accessTokenExpiresInSeconds,_that.memberId,_that.roles,_that.status,_that.newMember);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  int accessTokenExpiresInSeconds,  int memberId,  List<String> roles,  String? status,  bool newMember)  $default,) {final _that = this;
switch (_that) {
case _OAuthLoginResponse():
return $default(_that.accessToken,_that.refreshToken,_that.accessTokenExpiresInSeconds,_that.memberId,_that.roles,_that.status,_that.newMember);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken,  int accessTokenExpiresInSeconds,  int memberId,  List<String> roles,  String? status,  bool newMember)?  $default,) {final _that = this;
switch (_that) {
case _OAuthLoginResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.accessTokenExpiresInSeconds,_that.memberId,_that.roles,_that.status,_that.newMember);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OAuthLoginResponse implements OAuthLoginResponse {
  const _OAuthLoginResponse({required this.accessToken, required this.refreshToken, required this.accessTokenExpiresInSeconds, required this.memberId, final  List<String> roles = const [], this.status, this.newMember = false}): _roles = roles;
  factory _OAuthLoginResponse.fromJson(Map<String, dynamic> json) => _$OAuthLoginResponseFromJson(json);

@override final  String accessToken;
@override final  String refreshToken;
@override final  int accessTokenExpiresInSeconds;
@override final  int memberId;
 final  List<String> _roles;
@override@JsonKey() List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

@override final  String? status;
@override@JsonKey() final  bool newMember;

/// Create a copy of OAuthLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OAuthLoginResponseCopyWith<_OAuthLoginResponse> get copyWith => __$OAuthLoginResponseCopyWithImpl<_OAuthLoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OAuthLoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OAuthLoginResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.accessTokenExpiresInSeconds, accessTokenExpiresInSeconds) || other.accessTokenExpiresInSeconds == accessTokenExpiresInSeconds)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.status, status) || other.status == status)&&(identical(other.newMember, newMember) || other.newMember == newMember));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,accessTokenExpiresInSeconds,memberId,const DeepCollectionEquality().hash(_roles),status,newMember);

@override
String toString() {
  return 'OAuthLoginResponse(accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiresInSeconds: $accessTokenExpiresInSeconds, memberId: $memberId, roles: $roles, status: $status, newMember: $newMember)';
}


}

/// @nodoc
abstract mixin class _$OAuthLoginResponseCopyWith<$Res> implements $OAuthLoginResponseCopyWith<$Res> {
  factory _$OAuthLoginResponseCopyWith(_OAuthLoginResponse value, $Res Function(_OAuthLoginResponse) _then) = __$OAuthLoginResponseCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken, int accessTokenExpiresInSeconds, int memberId, List<String> roles, String? status, bool newMember
});




}
/// @nodoc
class __$OAuthLoginResponseCopyWithImpl<$Res>
    implements _$OAuthLoginResponseCopyWith<$Res> {
  __$OAuthLoginResponseCopyWithImpl(this._self, this._then);

  final _OAuthLoginResponse _self;
  final $Res Function(_OAuthLoginResponse) _then;

/// Create a copy of OAuthLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? accessTokenExpiresInSeconds = null,Object? memberId = null,Object? roles = null,Object? status = freezed,Object? newMember = null,}) {
  return _then(_OAuthLoginResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresInSeconds: null == accessTokenExpiresInSeconds ? _self.accessTokenExpiresInSeconds : accessTokenExpiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as int,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,newMember: null == newMember ? _self.newMember : newMember // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ApiResponseOAuthLoginResponse {

 bool get success; OAuthLoginResponse? get data; ApiErrorBody? get error; ResponseMeta? get meta;
/// Create a copy of ApiResponseOAuthLoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseOAuthLoginResponseCopyWith<ApiResponseOAuthLoginResponse> get copyWith => _$ApiResponseOAuthLoginResponseCopyWithImpl<ApiResponseOAuthLoginResponse>(this as ApiResponseOAuthLoginResponse, _$identity);

  /// Serializes this ApiResponseOAuthLoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseOAuthLoginResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseOAuthLoginResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ApiResponseOAuthLoginResponseCopyWith<$Res>  {
  factory $ApiResponseOAuthLoginResponseCopyWith(ApiResponseOAuthLoginResponse value, $Res Function(ApiResponseOAuthLoginResponse) _then) = _$ApiResponseOAuthLoginResponseCopyWithImpl;
@useResult
$Res call({
 bool success, OAuthLoginResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


$OAuthLoginResponseCopyWith<$Res>? get data;$ApiErrorBodyCopyWith<$Res>? get error;$ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ApiResponseOAuthLoginResponseCopyWithImpl<$Res>
    implements $ApiResponseOAuthLoginResponseCopyWith<$Res> {
  _$ApiResponseOAuthLoginResponseCopyWithImpl(this._self, this._then);

  final ApiResponseOAuthLoginResponse _self;
  final $Res Function(ApiResponseOAuthLoginResponse) _then;

/// Create a copy of ApiResponseOAuthLoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OAuthLoginResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}
/// Create a copy of ApiResponseOAuthLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OAuthLoginResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $OAuthLoginResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseOAuthLoginResponse
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
}/// Create a copy of ApiResponseOAuthLoginResponse
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


/// Adds pattern-matching-related methods to [ApiResponseOAuthLoginResponse].
extension ApiResponseOAuthLoginResponsePatterns on ApiResponseOAuthLoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseOAuthLoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseOAuthLoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseOAuthLoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseOAuthLoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseOAuthLoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseOAuthLoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  OAuthLoginResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseOAuthLoginResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  OAuthLoginResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseOAuthLoginResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  OAuthLoginResponse? data,  ApiErrorBody? error,  ResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseOAuthLoginResponse() when $default != null:
return $default(_that.success,_that.data,_that.error,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiResponseOAuthLoginResponse implements ApiResponseOAuthLoginResponse {
  const _ApiResponseOAuthLoginResponse({required this.success, this.data, this.error, this.meta});
  factory _ApiResponseOAuthLoginResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseOAuthLoginResponseFromJson(json);

@override final  bool success;
@override final  OAuthLoginResponse? data;
@override final  ApiErrorBody? error;
@override final  ResponseMeta? meta;

/// Create a copy of ApiResponseOAuthLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseOAuthLoginResponseCopyWith<_ApiResponseOAuthLoginResponse> get copyWith => __$ApiResponseOAuthLoginResponseCopyWithImpl<_ApiResponseOAuthLoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseOAuthLoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseOAuthLoginResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.error, error) || other.error == error)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,error,meta);

@override
String toString() {
  return 'ApiResponseOAuthLoginResponse(success: $success, data: $data, error: $error, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseOAuthLoginResponseCopyWith<$Res> implements $ApiResponseOAuthLoginResponseCopyWith<$Res> {
  factory _$ApiResponseOAuthLoginResponseCopyWith(_ApiResponseOAuthLoginResponse value, $Res Function(_ApiResponseOAuthLoginResponse) _then) = __$ApiResponseOAuthLoginResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, OAuthLoginResponse? data, ApiErrorBody? error, ResponseMeta? meta
});


@override $OAuthLoginResponseCopyWith<$Res>? get data;@override $ApiErrorBodyCopyWith<$Res>? get error;@override $ResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ApiResponseOAuthLoginResponseCopyWithImpl<$Res>
    implements _$ApiResponseOAuthLoginResponseCopyWith<$Res> {
  __$ApiResponseOAuthLoginResponseCopyWithImpl(this._self, this._then);

  final _ApiResponseOAuthLoginResponse _self;
  final $Res Function(_ApiResponseOAuthLoginResponse) _then;

/// Create a copy of ApiResponseOAuthLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,Object? error = freezed,Object? meta = freezed,}) {
  return _then(_ApiResponseOAuthLoginResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OAuthLoginResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorBody?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ResponseMeta?,
  ));
}

/// Create a copy of ApiResponseOAuthLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OAuthLoginResponseCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $OAuthLoginResponseCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ApiResponseOAuthLoginResponse
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
}/// Create a copy of ApiResponseOAuthLoginResponse
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
