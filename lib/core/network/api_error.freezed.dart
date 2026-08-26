// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiFieldError {

 String? get field; String? get message;
/// Create a copy of ApiFieldError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiFieldErrorCopyWith<ApiFieldError> get copyWith => _$ApiFieldErrorCopyWithImpl<ApiFieldError>(this as ApiFieldError, _$identity);

  /// Serializes this ApiFieldError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiFieldError&&(identical(other.field, field) || other.field == field)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,field,message);

@override
String toString() {
  return 'ApiFieldError(field: $field, message: $message)';
}


}

/// @nodoc
abstract mixin class $ApiFieldErrorCopyWith<$Res>  {
  factory $ApiFieldErrorCopyWith(ApiFieldError value, $Res Function(ApiFieldError) _then) = _$ApiFieldErrorCopyWithImpl;
@useResult
$Res call({
 String? field, String? message
});




}
/// @nodoc
class _$ApiFieldErrorCopyWithImpl<$Res>
    implements $ApiFieldErrorCopyWith<$Res> {
  _$ApiFieldErrorCopyWithImpl(this._self, this._then);

  final ApiFieldError _self;
  final $Res Function(ApiFieldError) _then;

/// Create a copy of ApiFieldError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? field = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiFieldError].
extension ApiFieldErrorPatterns on ApiFieldError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiFieldError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiFieldError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiFieldError value)  $default,){
final _that = this;
switch (_that) {
case _ApiFieldError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiFieldError value)?  $default,){
final _that = this;
switch (_that) {
case _ApiFieldError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? field,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiFieldError() when $default != null:
return $default(_that.field,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? field,  String? message)  $default,) {final _that = this;
switch (_that) {
case _ApiFieldError():
return $default(_that.field,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? field,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _ApiFieldError() when $default != null:
return $default(_that.field,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiFieldError implements ApiFieldError {
  const _ApiFieldError({this.field, this.message});
  factory _ApiFieldError.fromJson(Map<String, dynamic> json) => _$ApiFieldErrorFromJson(json);

@override final  String? field;
@override final  String? message;

/// Create a copy of ApiFieldError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiFieldErrorCopyWith<_ApiFieldError> get copyWith => __$ApiFieldErrorCopyWithImpl<_ApiFieldError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiFieldErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiFieldError&&(identical(other.field, field) || other.field == field)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,field,message);

@override
String toString() {
  return 'ApiFieldError(field: $field, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ApiFieldErrorCopyWith<$Res> implements $ApiFieldErrorCopyWith<$Res> {
  factory _$ApiFieldErrorCopyWith(_ApiFieldError value, $Res Function(_ApiFieldError) _then) = __$ApiFieldErrorCopyWithImpl;
@override @useResult
$Res call({
 String? field, String? message
});




}
/// @nodoc
class __$ApiFieldErrorCopyWithImpl<$Res>
    implements _$ApiFieldErrorCopyWith<$Res> {
  __$ApiFieldErrorCopyWithImpl(this._self, this._then);

  final _ApiFieldError _self;
  final $Res Function(_ApiFieldError) _then;

/// Create a copy of ApiFieldError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? field = freezed,Object? message = freezed,}) {
  return _then(_ApiFieldError(
field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ApiErrorBody {

 String get code; String get message; List<ApiFieldError> get fieldErrors;
/// Create a copy of ApiErrorBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiErrorBodyCopyWith<ApiErrorBody> get copyWith => _$ApiErrorBodyCopyWithImpl<ApiErrorBody>(this as ApiErrorBody, _$identity);

  /// Serializes this ApiErrorBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiErrorBody&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(fieldErrors));

@override
String toString() {
  return 'ApiErrorBody(code: $code, message: $message, fieldErrors: $fieldErrors)';
}


}

/// @nodoc
abstract mixin class $ApiErrorBodyCopyWith<$Res>  {
  factory $ApiErrorBodyCopyWith(ApiErrorBody value, $Res Function(ApiErrorBody) _then) = _$ApiErrorBodyCopyWithImpl;
@useResult
$Res call({
 String code, String message, List<ApiFieldError> fieldErrors
});




}
/// @nodoc
class _$ApiErrorBodyCopyWithImpl<$Res>
    implements $ApiErrorBodyCopyWith<$Res> {
  _$ApiErrorBodyCopyWithImpl(this._self, this._then);

  final ApiErrorBody _self;
  final $Res Function(ApiErrorBody) _then;

/// Create a copy of ApiErrorBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? fieldErrors = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as List<ApiFieldError>,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiErrorBody].
extension ApiErrorBodyPatterns on ApiErrorBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiErrorBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiErrorBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiErrorBody value)  $default,){
final _that = this;
switch (_that) {
case _ApiErrorBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiErrorBody value)?  $default,){
final _that = this;
switch (_that) {
case _ApiErrorBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String message,  List<ApiFieldError> fieldErrors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiErrorBody() when $default != null:
return $default(_that.code,_that.message,_that.fieldErrors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String message,  List<ApiFieldError> fieldErrors)  $default,) {final _that = this;
switch (_that) {
case _ApiErrorBody():
return $default(_that.code,_that.message,_that.fieldErrors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String message,  List<ApiFieldError> fieldErrors)?  $default,) {final _that = this;
switch (_that) {
case _ApiErrorBody() when $default != null:
return $default(_that.code,_that.message,_that.fieldErrors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiErrorBody implements ApiErrorBody {
  const _ApiErrorBody({required this.code, required this.message, final  List<ApiFieldError> fieldErrors = const []}): _fieldErrors = fieldErrors;
  factory _ApiErrorBody.fromJson(Map<String, dynamic> json) => _$ApiErrorBodyFromJson(json);

@override final  String code;
@override final  String message;
 final  List<ApiFieldError> _fieldErrors;
@override@JsonKey() List<ApiFieldError> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableListView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fieldErrors);
}


/// Create a copy of ApiErrorBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiErrorBodyCopyWith<_ApiErrorBody> get copyWith => __$ApiErrorBodyCopyWithImpl<_ApiErrorBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiErrorBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiErrorBody&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(_fieldErrors));

@override
String toString() {
  return 'ApiErrorBody(code: $code, message: $message, fieldErrors: $fieldErrors)';
}


}

/// @nodoc
abstract mixin class _$ApiErrorBodyCopyWith<$Res> implements $ApiErrorBodyCopyWith<$Res> {
  factory _$ApiErrorBodyCopyWith(_ApiErrorBody value, $Res Function(_ApiErrorBody) _then) = __$ApiErrorBodyCopyWithImpl;
@override @useResult
$Res call({
 String code, String message, List<ApiFieldError> fieldErrors
});




}
/// @nodoc
class __$ApiErrorBodyCopyWithImpl<$Res>
    implements _$ApiErrorBodyCopyWith<$Res> {
  __$ApiErrorBodyCopyWithImpl(this._self, this._then);

  final _ApiErrorBody _self;
  final $Res Function(_ApiErrorBody) _then;

/// Create a copy of ApiErrorBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? fieldErrors = null,}) {
  return _then(_ApiErrorBody(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as List<ApiFieldError>,
  ));
}


}


/// @nodoc
mixin _$ResponseMeta {

 String? get requestId;
/// Create a copy of ResponseMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseMetaCopyWith<ResponseMeta> get copyWith => _$ResponseMetaCopyWithImpl<ResponseMeta>(this as ResponseMeta, _$identity);

  /// Serializes this ResponseMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseMeta&&(identical(other.requestId, requestId) || other.requestId == requestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'ResponseMeta(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ResponseMetaCopyWith<$Res>  {
  factory $ResponseMetaCopyWith(ResponseMeta value, $Res Function(ResponseMeta) _then) = _$ResponseMetaCopyWithImpl;
@useResult
$Res call({
 String? requestId
});




}
/// @nodoc
class _$ResponseMetaCopyWithImpl<$Res>
    implements $ResponseMetaCopyWith<$Res> {
  _$ResponseMetaCopyWithImpl(this._self, this._then);

  final ResponseMeta _self;
  final $Res Function(ResponseMeta) _then;

/// Create a copy of ResponseMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = freezed,}) {
  return _then(_self.copyWith(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResponseMeta].
extension ResponseMetaPatterns on ResponseMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResponseMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResponseMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResponseMeta value)  $default,){
final _that = this;
switch (_that) {
case _ResponseMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResponseMeta value)?  $default,){
final _that = this;
switch (_that) {
case _ResponseMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResponseMeta() when $default != null:
return $default(_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? requestId)  $default,) {final _that = this;
switch (_that) {
case _ResponseMeta():
return $default(_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? requestId)?  $default,) {final _that = this;
switch (_that) {
case _ResponseMeta() when $default != null:
return $default(_that.requestId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResponseMeta implements ResponseMeta {
  const _ResponseMeta({this.requestId});
  factory _ResponseMeta.fromJson(Map<String, dynamic> json) => _$ResponseMetaFromJson(json);

@override final  String? requestId;

/// Create a copy of ResponseMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseMetaCopyWith<_ResponseMeta> get copyWith => __$ResponseMetaCopyWithImpl<_ResponseMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResponseMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseMeta&&(identical(other.requestId, requestId) || other.requestId == requestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'ResponseMeta(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$ResponseMetaCopyWith<$Res> implements $ResponseMetaCopyWith<$Res> {
  factory _$ResponseMetaCopyWith(_ResponseMeta value, $Res Function(_ResponseMeta) _then) = __$ResponseMetaCopyWithImpl;
@override @useResult
$Res call({
 String? requestId
});




}
/// @nodoc
class __$ResponseMetaCopyWithImpl<$Res>
    implements _$ResponseMetaCopyWith<$Res> {
  __$ResponseMetaCopyWithImpl(this._self, this._then);

  final _ResponseMeta _self;
  final $Res Function(_ResponseMeta) _then;

/// Create a copy of ResponseMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = freezed,}) {
  return _then(_ResponseMeta(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
