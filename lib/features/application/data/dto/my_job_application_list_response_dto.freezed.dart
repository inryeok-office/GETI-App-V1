// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_job_application_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyJobApplicationListApiResponseDto {

 bool get success; MyJobApplicationListResponseDto get data; ApiResponseMetaDto get meta;

  /// Serializes this MyJobApplicationListApiResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyJobApplicationListApiResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,meta);

@override
String toString() {
  return 'MyJobApplicationListApiResponseDto(success: $success, data: $data, meta: $meta)';
}


}




/// Adds pattern-matching-related methods to [MyJobApplicationListApiResponseDto].
extension MyJobApplicationListApiResponseDtoPatterns on MyJobApplicationListApiResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyJobApplicationListApiResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyJobApplicationListApiResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyJobApplicationListApiResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _MyJobApplicationListApiResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyJobApplicationListApiResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _MyJobApplicationListApiResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  MyJobApplicationListResponseDto data,  ApiResponseMetaDto meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyJobApplicationListApiResponseDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  MyJobApplicationListResponseDto data,  ApiResponseMetaDto meta)  $default,) {final _that = this;
switch (_that) {
case _MyJobApplicationListApiResponseDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  MyJobApplicationListResponseDto data,  ApiResponseMetaDto meta)?  $default,) {final _that = this;
switch (_that) {
case _MyJobApplicationListApiResponseDto() when $default != null:
return $default(_that.success,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyJobApplicationListApiResponseDto implements MyJobApplicationListApiResponseDto {
  const _MyJobApplicationListApiResponseDto({required this.success, required this.data, required this.meta});
  factory _MyJobApplicationListApiResponseDto.fromJson(Map<String, dynamic> json) => _$MyJobApplicationListApiResponseDtoFromJson(json);

@override final  bool success;
@override final  MyJobApplicationListResponseDto data;
@override final  ApiResponseMetaDto meta;


@override
Map<String, dynamic> toJson() {
  return _$MyJobApplicationListApiResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyJobApplicationListApiResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,meta);

@override
String toString() {
  return 'MyJobApplicationListApiResponseDto(success: $success, data: $data, meta: $meta)';
}


}





/// @nodoc
mixin _$MyJobApplicationListResponseDto {

 List<MyJobApplicationListItemDto> get content; int get page; int get size; int get totalElements; int get totalPages; bool get first; bool get last;
/// Create a copy of MyJobApplicationListResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyJobApplicationListResponseDtoCopyWith<MyJobApplicationListResponseDto> get copyWith => _$MyJobApplicationListResponseDtoCopyWithImpl<MyJobApplicationListResponseDto>(this as MyJobApplicationListResponseDto, _$identity);

  /// Serializes this MyJobApplicationListResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyJobApplicationListResponseDto&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),page,size,totalElements,totalPages,first,last);

@override
String toString() {
  return 'MyJobApplicationListResponseDto(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages, first: $first, last: $last)';
}


}

/// @nodoc
abstract mixin class $MyJobApplicationListResponseDtoCopyWith<$Res>  {
  factory $MyJobApplicationListResponseDtoCopyWith(MyJobApplicationListResponseDto value, $Res Function(MyJobApplicationListResponseDto) _then) = _$MyJobApplicationListResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<MyJobApplicationListItemDto> content, int page, int size, int totalElements, int totalPages, bool first, bool last
});




}
/// @nodoc
class _$MyJobApplicationListResponseDtoCopyWithImpl<$Res>
    implements $MyJobApplicationListResponseDtoCopyWith<$Res> {
  _$MyJobApplicationListResponseDtoCopyWithImpl(this._self, this._then);

  final MyJobApplicationListResponseDto _self;
  final $Res Function(MyJobApplicationListResponseDto) _then;

/// Create a copy of MyJobApplicationListResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,Object? first = null,Object? last = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<MyJobApplicationListItemDto>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as bool,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MyJobApplicationListResponseDto].
extension MyJobApplicationListResponseDtoPatterns on MyJobApplicationListResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyJobApplicationListResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyJobApplicationListResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyJobApplicationListResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _MyJobApplicationListResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyJobApplicationListResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _MyJobApplicationListResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MyJobApplicationListItemDto> content,  int page,  int size,  int totalElements,  int totalPages,  bool first,  bool last)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyJobApplicationListResponseDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MyJobApplicationListItemDto> content,  int page,  int size,  int totalElements,  int totalPages,  bool first,  bool last)  $default,) {final _that = this;
switch (_that) {
case _MyJobApplicationListResponseDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MyJobApplicationListItemDto> content,  int page,  int size,  int totalElements,  int totalPages,  bool first,  bool last)?  $default,) {final _that = this;
switch (_that) {
case _MyJobApplicationListResponseDto() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages,_that.first,_that.last);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyJobApplicationListResponseDto implements MyJobApplicationListResponseDto {
  const _MyJobApplicationListResponseDto({required final  List<MyJobApplicationListItemDto> content, required this.page, required this.size, required this.totalElements, required this.totalPages, required this.first, required this.last}): _content = content;
  factory _MyJobApplicationListResponseDto.fromJson(Map<String, dynamic> json) => _$MyJobApplicationListResponseDtoFromJson(json);

 final  List<MyJobApplicationListItemDto> _content;
@override List<MyJobApplicationListItemDto> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override final  int page;
@override final  int size;
@override final  int totalElements;
@override final  int totalPages;
@override final  bool first;
@override final  bool last;

/// Create a copy of MyJobApplicationListResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyJobApplicationListResponseDtoCopyWith<_MyJobApplicationListResponseDto> get copyWith => __$MyJobApplicationListResponseDtoCopyWithImpl<_MyJobApplicationListResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyJobApplicationListResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyJobApplicationListResponseDto&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),page,size,totalElements,totalPages,first,last);

@override
String toString() {
  return 'MyJobApplicationListResponseDto(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages, first: $first, last: $last)';
}


}

/// @nodoc
abstract mixin class _$MyJobApplicationListResponseDtoCopyWith<$Res> implements $MyJobApplicationListResponseDtoCopyWith<$Res> {
  factory _$MyJobApplicationListResponseDtoCopyWith(_MyJobApplicationListResponseDto value, $Res Function(_MyJobApplicationListResponseDto) _then) = __$MyJobApplicationListResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<MyJobApplicationListItemDto> content, int page, int size, int totalElements, int totalPages, bool first, bool last
});




}
/// @nodoc
class __$MyJobApplicationListResponseDtoCopyWithImpl<$Res>
    implements _$MyJobApplicationListResponseDtoCopyWith<$Res> {
  __$MyJobApplicationListResponseDtoCopyWithImpl(this._self, this._then);

  final _MyJobApplicationListResponseDto _self;
  final $Res Function(_MyJobApplicationListResponseDto) _then;

/// Create a copy of MyJobApplicationListResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,Object? first = null,Object? last = null,}) {
  return _then(_MyJobApplicationListResponseDto(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<MyJobApplicationListItemDto>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
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
mixin _$MyJobApplicationListItemDto {

 int get applicationId; MyJobApplicationJobSummaryDto? get job; JobApplicationStatusDto get status; DateTime? get submittedAt; DateTime get updatedAt;
/// Create a copy of MyJobApplicationListItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyJobApplicationListItemDtoCopyWith<MyJobApplicationListItemDto> get copyWith => _$MyJobApplicationListItemDtoCopyWithImpl<MyJobApplicationListItemDto>(this as MyJobApplicationListItemDto, _$identity);

  /// Serializes this MyJobApplicationListItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyJobApplicationListItemDto&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.job, job) || other.job == job)&&(identical(other.status, status) || other.status == status)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,job,status,submittedAt,updatedAt);

@override
String toString() {
  return 'MyJobApplicationListItemDto(applicationId: $applicationId, job: $job, status: $status, submittedAt: $submittedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MyJobApplicationListItemDtoCopyWith<$Res>  {
  factory $MyJobApplicationListItemDtoCopyWith(MyJobApplicationListItemDto value, $Res Function(MyJobApplicationListItemDto) _then) = _$MyJobApplicationListItemDtoCopyWithImpl;
@useResult
$Res call({
 int applicationId, MyJobApplicationJobSummaryDto? job, JobApplicationStatusDto status, DateTime? submittedAt, DateTime updatedAt
});


$MyJobApplicationJobSummaryDtoCopyWith<$Res>? get job;

}
/// @nodoc
class _$MyJobApplicationListItemDtoCopyWithImpl<$Res>
    implements $MyJobApplicationListItemDtoCopyWith<$Res> {
  _$MyJobApplicationListItemDtoCopyWithImpl(this._self, this._then);

  final MyJobApplicationListItemDto _self;
  final $Res Function(MyJobApplicationListItemDto) _then;

/// Create a copy of MyJobApplicationListItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? job = freezed,Object? status = null,Object? submittedAt = freezed,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as int,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as MyJobApplicationJobSummaryDto?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as JobApplicationStatusDto,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of MyJobApplicationListItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyJobApplicationJobSummaryDtoCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $MyJobApplicationJobSummaryDtoCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyJobApplicationListItemDto].
extension MyJobApplicationListItemDtoPatterns on MyJobApplicationListItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyJobApplicationListItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyJobApplicationListItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyJobApplicationListItemDto value)  $default,){
final _that = this;
switch (_that) {
case _MyJobApplicationListItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyJobApplicationListItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _MyJobApplicationListItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int applicationId,  MyJobApplicationJobSummaryDto? job,  JobApplicationStatusDto status,  DateTime? submittedAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyJobApplicationListItemDto() when $default != null:
return $default(_that.applicationId,_that.job,_that.status,_that.submittedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int applicationId,  MyJobApplicationJobSummaryDto? job,  JobApplicationStatusDto status,  DateTime? submittedAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MyJobApplicationListItemDto():
return $default(_that.applicationId,_that.job,_that.status,_that.submittedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int applicationId,  MyJobApplicationJobSummaryDto? job,  JobApplicationStatusDto status,  DateTime? submittedAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MyJobApplicationListItemDto() when $default != null:
return $default(_that.applicationId,_that.job,_that.status,_that.submittedAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyJobApplicationListItemDto implements MyJobApplicationListItemDto {
  const _MyJobApplicationListItemDto({required this.applicationId, required this.job, required this.status, required this.submittedAt, required this.updatedAt});
  factory _MyJobApplicationListItemDto.fromJson(Map<String, dynamic> json) => _$MyJobApplicationListItemDtoFromJson(json);

@override final  int applicationId;
@override final  MyJobApplicationJobSummaryDto? job;
@override final  JobApplicationStatusDto status;
@override final  DateTime? submittedAt;
@override final  DateTime updatedAt;

/// Create a copy of MyJobApplicationListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyJobApplicationListItemDtoCopyWith<_MyJobApplicationListItemDto> get copyWith => __$MyJobApplicationListItemDtoCopyWithImpl<_MyJobApplicationListItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyJobApplicationListItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyJobApplicationListItemDto&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.job, job) || other.job == job)&&(identical(other.status, status) || other.status == status)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,job,status,submittedAt,updatedAt);

@override
String toString() {
  return 'MyJobApplicationListItemDto(applicationId: $applicationId, job: $job, status: $status, submittedAt: $submittedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MyJobApplicationListItemDtoCopyWith<$Res> implements $MyJobApplicationListItemDtoCopyWith<$Res> {
  factory _$MyJobApplicationListItemDtoCopyWith(_MyJobApplicationListItemDto value, $Res Function(_MyJobApplicationListItemDto) _then) = __$MyJobApplicationListItemDtoCopyWithImpl;
@override @useResult
$Res call({
 int applicationId, MyJobApplicationJobSummaryDto? job, JobApplicationStatusDto status, DateTime? submittedAt, DateTime updatedAt
});


@override $MyJobApplicationJobSummaryDtoCopyWith<$Res>? get job;

}
/// @nodoc
class __$MyJobApplicationListItemDtoCopyWithImpl<$Res>
    implements _$MyJobApplicationListItemDtoCopyWith<$Res> {
  __$MyJobApplicationListItemDtoCopyWithImpl(this._self, this._then);

  final _MyJobApplicationListItemDto _self;
  final $Res Function(_MyJobApplicationListItemDto) _then;

/// Create a copy of MyJobApplicationListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? job = freezed,Object? status = null,Object? submittedAt = freezed,Object? updatedAt = null,}) {
  return _then(_MyJobApplicationListItemDto(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as int,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as MyJobApplicationJobSummaryDto?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as JobApplicationStatusDto,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of MyJobApplicationListItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyJobApplicationJobSummaryDtoCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $MyJobApplicationJobSummaryDtoCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}
}


/// @nodoc
mixin _$MyJobApplicationJobSummaryDto {

 int get jobId; String get title; JobPostingTypeDto get postingType; JobApplicationMethodDto get applicationMethod; JobPostingStatusDto get status; CompanySummaryDto? get company; DateTime? get endDate; int get viewCount; bool get bookmarked; List<JobAiSkillAccessDto> get techStacks; int get bookmarkCount;
/// Create a copy of MyJobApplicationJobSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyJobApplicationJobSummaryDtoCopyWith<MyJobApplicationJobSummaryDto> get copyWith => _$MyJobApplicationJobSummaryDtoCopyWithImpl<MyJobApplicationJobSummaryDto>(this as MyJobApplicationJobSummaryDto, _$identity);

  /// Serializes this MyJobApplicationJobSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyJobApplicationJobSummaryDto&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.title, title) || other.title == title)&&(identical(other.postingType, postingType) || other.postingType == postingType)&&(identical(other.applicationMethod, applicationMethod) || other.applicationMethod == applicationMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.company, company) || other.company == company)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&const DeepCollectionEquality().equals(other.techStacks, techStacks)&&(identical(other.bookmarkCount, bookmarkCount) || other.bookmarkCount == bookmarkCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,title,postingType,applicationMethod,status,company,endDate,viewCount,bookmarked,const DeepCollectionEquality().hash(techStacks),bookmarkCount);

@override
String toString() {
  return 'MyJobApplicationJobSummaryDto(jobId: $jobId, title: $title, postingType: $postingType, applicationMethod: $applicationMethod, status: $status, company: $company, endDate: $endDate, viewCount: $viewCount, bookmarked: $bookmarked, techStacks: $techStacks, bookmarkCount: $bookmarkCount)';
}


}

/// @nodoc
abstract mixin class $MyJobApplicationJobSummaryDtoCopyWith<$Res>  {
  factory $MyJobApplicationJobSummaryDtoCopyWith(MyJobApplicationJobSummaryDto value, $Res Function(MyJobApplicationJobSummaryDto) _then) = _$MyJobApplicationJobSummaryDtoCopyWithImpl;
@useResult
$Res call({
 int jobId, String title, JobPostingTypeDto postingType, JobApplicationMethodDto applicationMethod, JobPostingStatusDto status, CompanySummaryDto? company, DateTime? endDate, int viewCount, bool bookmarked, List<JobAiSkillAccessDto> techStacks, int bookmarkCount
});


$CompanySummaryDtoCopyWith<$Res>? get company;

}
/// @nodoc
class _$MyJobApplicationJobSummaryDtoCopyWithImpl<$Res>
    implements $MyJobApplicationJobSummaryDtoCopyWith<$Res> {
  _$MyJobApplicationJobSummaryDtoCopyWithImpl(this._self, this._then);

  final MyJobApplicationJobSummaryDto _self;
  final $Res Function(MyJobApplicationJobSummaryDto) _then;

/// Create a copy of MyJobApplicationJobSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobId = null,Object? title = null,Object? postingType = null,Object? applicationMethod = null,Object? status = null,Object? company = freezed,Object? endDate = freezed,Object? viewCount = null,Object? bookmarked = null,Object? techStacks = null,Object? bookmarkCount = null,}) {
  return _then(_self.copyWith(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,postingType: null == postingType ? _self.postingType : postingType // ignore: cast_nullable_to_non_nullable
as JobPostingTypeDto,applicationMethod: null == applicationMethod ? _self.applicationMethod : applicationMethod // ignore: cast_nullable_to_non_nullable
as JobApplicationMethodDto,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as JobPostingStatusDto,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as CompanySummaryDto?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,techStacks: null == techStacks ? _self.techStacks : techStacks // ignore: cast_nullable_to_non_nullable
as List<JobAiSkillAccessDto>,bookmarkCount: null == bookmarkCount ? _self.bookmarkCount : bookmarkCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of MyJobApplicationJobSummaryDto
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


/// Adds pattern-matching-related methods to [MyJobApplicationJobSummaryDto].
extension MyJobApplicationJobSummaryDtoPatterns on MyJobApplicationJobSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyJobApplicationJobSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyJobApplicationJobSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyJobApplicationJobSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _MyJobApplicationJobSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyJobApplicationJobSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _MyJobApplicationJobSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int jobId,  String title,  JobPostingTypeDto postingType,  JobApplicationMethodDto applicationMethod,  JobPostingStatusDto status,  CompanySummaryDto? company,  DateTime? endDate,  int viewCount,  bool bookmarked,  List<JobAiSkillAccessDto> techStacks,  int bookmarkCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyJobApplicationJobSummaryDto() when $default != null:
return $default(_that.jobId,_that.title,_that.postingType,_that.applicationMethod,_that.status,_that.company,_that.endDate,_that.viewCount,_that.bookmarked,_that.techStacks,_that.bookmarkCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int jobId,  String title,  JobPostingTypeDto postingType,  JobApplicationMethodDto applicationMethod,  JobPostingStatusDto status,  CompanySummaryDto? company,  DateTime? endDate,  int viewCount,  bool bookmarked,  List<JobAiSkillAccessDto> techStacks,  int bookmarkCount)  $default,) {final _that = this;
switch (_that) {
case _MyJobApplicationJobSummaryDto():
return $default(_that.jobId,_that.title,_that.postingType,_that.applicationMethod,_that.status,_that.company,_that.endDate,_that.viewCount,_that.bookmarked,_that.techStacks,_that.bookmarkCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int jobId,  String title,  JobPostingTypeDto postingType,  JobApplicationMethodDto applicationMethod,  JobPostingStatusDto status,  CompanySummaryDto? company,  DateTime? endDate,  int viewCount,  bool bookmarked,  List<JobAiSkillAccessDto> techStacks,  int bookmarkCount)?  $default,) {final _that = this;
switch (_that) {
case _MyJobApplicationJobSummaryDto() when $default != null:
return $default(_that.jobId,_that.title,_that.postingType,_that.applicationMethod,_that.status,_that.company,_that.endDate,_that.viewCount,_that.bookmarked,_that.techStacks,_that.bookmarkCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyJobApplicationJobSummaryDto implements MyJobApplicationJobSummaryDto {
  const _MyJobApplicationJobSummaryDto({required this.jobId, required this.title, required this.postingType, required this.applicationMethod, required this.status, required this.company, required this.endDate, required this.viewCount, required this.bookmarked, required final  List<JobAiSkillAccessDto> techStacks, required this.bookmarkCount}): _techStacks = techStacks;
  factory _MyJobApplicationJobSummaryDto.fromJson(Map<String, dynamic> json) => _$MyJobApplicationJobSummaryDtoFromJson(json);

@override final  int jobId;
@override final  String title;
@override final  JobPostingTypeDto postingType;
@override final  JobApplicationMethodDto applicationMethod;
@override final  JobPostingStatusDto status;
@override final  CompanySummaryDto? company;
@override final  DateTime? endDate;
@override final  int viewCount;
@override final  bool bookmarked;
 final  List<JobAiSkillAccessDto> _techStacks;
@override List<JobAiSkillAccessDto> get techStacks {
  if (_techStacks is EqualUnmodifiableListView) return _techStacks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_techStacks);
}

@override final  int bookmarkCount;

/// Create a copy of MyJobApplicationJobSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyJobApplicationJobSummaryDtoCopyWith<_MyJobApplicationJobSummaryDto> get copyWith => __$MyJobApplicationJobSummaryDtoCopyWithImpl<_MyJobApplicationJobSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyJobApplicationJobSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyJobApplicationJobSummaryDto&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.title, title) || other.title == title)&&(identical(other.postingType, postingType) || other.postingType == postingType)&&(identical(other.applicationMethod, applicationMethod) || other.applicationMethod == applicationMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.company, company) || other.company == company)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&const DeepCollectionEquality().equals(other._techStacks, _techStacks)&&(identical(other.bookmarkCount, bookmarkCount) || other.bookmarkCount == bookmarkCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobId,title,postingType,applicationMethod,status,company,endDate,viewCount,bookmarked,const DeepCollectionEquality().hash(_techStacks),bookmarkCount);

@override
String toString() {
  return 'MyJobApplicationJobSummaryDto(jobId: $jobId, title: $title, postingType: $postingType, applicationMethod: $applicationMethod, status: $status, company: $company, endDate: $endDate, viewCount: $viewCount, bookmarked: $bookmarked, techStacks: $techStacks, bookmarkCount: $bookmarkCount)';
}


}

/// @nodoc
abstract mixin class _$MyJobApplicationJobSummaryDtoCopyWith<$Res> implements $MyJobApplicationJobSummaryDtoCopyWith<$Res> {
  factory _$MyJobApplicationJobSummaryDtoCopyWith(_MyJobApplicationJobSummaryDto value, $Res Function(_MyJobApplicationJobSummaryDto) _then) = __$MyJobApplicationJobSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 int jobId, String title, JobPostingTypeDto postingType, JobApplicationMethodDto applicationMethod, JobPostingStatusDto status, CompanySummaryDto? company, DateTime? endDate, int viewCount, bool bookmarked, List<JobAiSkillAccessDto> techStacks, int bookmarkCount
});


@override $CompanySummaryDtoCopyWith<$Res>? get company;

}
/// @nodoc
class __$MyJobApplicationJobSummaryDtoCopyWithImpl<$Res>
    implements _$MyJobApplicationJobSummaryDtoCopyWith<$Res> {
  __$MyJobApplicationJobSummaryDtoCopyWithImpl(this._self, this._then);

  final _MyJobApplicationJobSummaryDto _self;
  final $Res Function(_MyJobApplicationJobSummaryDto) _then;

/// Create a copy of MyJobApplicationJobSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? title = null,Object? postingType = null,Object? applicationMethod = null,Object? status = null,Object? company = freezed,Object? endDate = freezed,Object? viewCount = null,Object? bookmarked = null,Object? techStacks = null,Object? bookmarkCount = null,}) {
  return _then(_MyJobApplicationJobSummaryDto(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,postingType: null == postingType ? _self.postingType : postingType // ignore: cast_nullable_to_non_nullable
as JobPostingTypeDto,applicationMethod: null == applicationMethod ? _self.applicationMethod : applicationMethod // ignore: cast_nullable_to_non_nullable
as JobApplicationMethodDto,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as JobPostingStatusDto,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as CompanySummaryDto?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,techStacks: null == techStacks ? _self._techStacks : techStacks // ignore: cast_nullable_to_non_nullable
as List<JobAiSkillAccessDto>,bookmarkCount: null == bookmarkCount ? _self.bookmarkCount : bookmarkCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of MyJobApplicationJobSummaryDto
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
  const _CompanySummaryDto({required this.companyId, required this.name, required this.logoUrl});
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
mixin _$JobAiSkillAccessDto {

 int? get techStackId; String get name;
/// Create a copy of JobAiSkillAccessDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobAiSkillAccessDtoCopyWith<JobAiSkillAccessDto> get copyWith => _$JobAiSkillAccessDtoCopyWithImpl<JobAiSkillAccessDto>(this as JobAiSkillAccessDto, _$identity);

  /// Serializes this JobAiSkillAccessDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobAiSkillAccessDto&&(identical(other.techStackId, techStackId) || other.techStackId == techStackId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,techStackId,name);

@override
String toString() {
  return 'JobAiSkillAccessDto(techStackId: $techStackId, name: $name)';
}


}

/// @nodoc
abstract mixin class $JobAiSkillAccessDtoCopyWith<$Res>  {
  factory $JobAiSkillAccessDtoCopyWith(JobAiSkillAccessDto value, $Res Function(JobAiSkillAccessDto) _then) = _$JobAiSkillAccessDtoCopyWithImpl;
@useResult
$Res call({
 int? techStackId, String name
});




}
/// @nodoc
class _$JobAiSkillAccessDtoCopyWithImpl<$Res>
    implements $JobAiSkillAccessDtoCopyWith<$Res> {
  _$JobAiSkillAccessDtoCopyWithImpl(this._self, this._then);

  final JobAiSkillAccessDto _self;
  final $Res Function(JobAiSkillAccessDto) _then;

/// Create a copy of JobAiSkillAccessDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? techStackId = freezed,Object? name = null,}) {
  return _then(_self.copyWith(
techStackId: freezed == techStackId ? _self.techStackId : techStackId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobAiSkillAccessDto].
extension JobAiSkillAccessDtoPatterns on JobAiSkillAccessDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobAiSkillAccessDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobAiSkillAccessDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobAiSkillAccessDto value)  $default,){
final _that = this;
switch (_that) {
case _JobAiSkillAccessDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobAiSkillAccessDto value)?  $default,){
final _that = this;
switch (_that) {
case _JobAiSkillAccessDto() when $default != null:
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
case _JobAiSkillAccessDto() when $default != null:
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
case _JobAiSkillAccessDto():
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
case _JobAiSkillAccessDto() when $default != null:
return $default(_that.techStackId,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobAiSkillAccessDto implements JobAiSkillAccessDto {
  const _JobAiSkillAccessDto({required this.techStackId, required this.name});
  factory _JobAiSkillAccessDto.fromJson(Map<String, dynamic> json) => _$JobAiSkillAccessDtoFromJson(json);

@override final  int? techStackId;
@override final  String name;

/// Create a copy of JobAiSkillAccessDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobAiSkillAccessDtoCopyWith<_JobAiSkillAccessDto> get copyWith => __$JobAiSkillAccessDtoCopyWithImpl<_JobAiSkillAccessDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobAiSkillAccessDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobAiSkillAccessDto&&(identical(other.techStackId, techStackId) || other.techStackId == techStackId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,techStackId,name);

@override
String toString() {
  return 'JobAiSkillAccessDto(techStackId: $techStackId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$JobAiSkillAccessDtoCopyWith<$Res> implements $JobAiSkillAccessDtoCopyWith<$Res> {
  factory _$JobAiSkillAccessDtoCopyWith(_JobAiSkillAccessDto value, $Res Function(_JobAiSkillAccessDto) _then) = __$JobAiSkillAccessDtoCopyWithImpl;
@override @useResult
$Res call({
 int? techStackId, String name
});




}
/// @nodoc
class __$JobAiSkillAccessDtoCopyWithImpl<$Res>
    implements _$JobAiSkillAccessDtoCopyWith<$Res> {
  __$JobAiSkillAccessDtoCopyWithImpl(this._self, this._then);

  final _JobAiSkillAccessDto _self;
  final $Res Function(_JobAiSkillAccessDto) _then;

/// Create a copy of JobAiSkillAccessDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? techStackId = freezed,Object? name = null,}) {
  return _then(_JobAiSkillAccessDto(
techStackId: freezed == techStackId ? _self.techStackId : techStackId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ApiResponseMetaDto {

 String? get requestId;
/// Create a copy of ApiResponseMetaDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseMetaDtoCopyWith<ApiResponseMetaDto> get copyWith => _$ApiResponseMetaDtoCopyWithImpl<ApiResponseMetaDto>(this as ApiResponseMetaDto, _$identity);

  /// Serializes this ApiResponseMetaDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseMetaDto&&(identical(other.requestId, requestId) || other.requestId == requestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'ApiResponseMetaDto(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ApiResponseMetaDtoCopyWith<$Res>  {
  factory $ApiResponseMetaDtoCopyWith(ApiResponseMetaDto value, $Res Function(ApiResponseMetaDto) _then) = _$ApiResponseMetaDtoCopyWithImpl;
@useResult
$Res call({
 String? requestId
});




}
/// @nodoc
class _$ApiResponseMetaDtoCopyWithImpl<$Res>
    implements $ApiResponseMetaDtoCopyWith<$Res> {
  _$ApiResponseMetaDtoCopyWithImpl(this._self, this._then);

  final ApiResponseMetaDto _self;
  final $Res Function(ApiResponseMetaDto) _then;

/// Create a copy of ApiResponseMetaDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = freezed,}) {
  return _then(_self.copyWith(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiResponseMetaDto].
extension ApiResponseMetaDtoPatterns on ApiResponseMetaDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseMetaDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseMetaDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseMetaDto value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseMetaDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseMetaDto value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseMetaDto() when $default != null:
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
case _ApiResponseMetaDto() when $default != null:
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
case _ApiResponseMetaDto():
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
case _ApiResponseMetaDto() when $default != null:
return $default(_that.requestId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiResponseMetaDto implements ApiResponseMetaDto {
  const _ApiResponseMetaDto({required this.requestId});
  factory _ApiResponseMetaDto.fromJson(Map<String, dynamic> json) => _$ApiResponseMetaDtoFromJson(json);

@override final  String? requestId;

/// Create a copy of ApiResponseMetaDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseMetaDtoCopyWith<_ApiResponseMetaDto> get copyWith => __$ApiResponseMetaDtoCopyWithImpl<_ApiResponseMetaDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseMetaDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseMetaDto&&(identical(other.requestId, requestId) || other.requestId == requestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'ApiResponseMetaDto(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseMetaDtoCopyWith<$Res> implements $ApiResponseMetaDtoCopyWith<$Res> {
  factory _$ApiResponseMetaDtoCopyWith(_ApiResponseMetaDto value, $Res Function(_ApiResponseMetaDto) _then) = __$ApiResponseMetaDtoCopyWithImpl;
@override @useResult
$Res call({
 String? requestId
});




}
/// @nodoc
class __$ApiResponseMetaDtoCopyWithImpl<$Res>
    implements _$ApiResponseMetaDtoCopyWith<$Res> {
  __$ApiResponseMetaDtoCopyWithImpl(this._self, this._then);

  final _ApiResponseMetaDto _self;
  final $Res Function(_ApiResponseMetaDto) _then;

/// Create a copy of ApiResponseMetaDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = freezed,}) {
  return _then(_ApiResponseMetaDto(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
