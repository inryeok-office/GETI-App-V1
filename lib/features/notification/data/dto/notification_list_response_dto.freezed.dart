// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationListApiResponseDto {

 bool? get success; NotificationListResponseDto? get data; NotificationResponseMetaDto? get meta;

  /// Serializes this NotificationListApiResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationListApiResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,meta);

@override
String toString() {
  return 'NotificationListApiResponseDto(success: $success, data: $data, meta: $meta)';
}


}




/// Adds pattern-matching-related methods to [NotificationListApiResponseDto].
extension NotificationListApiResponseDtoPatterns on NotificationListApiResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationListApiResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationListApiResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationListApiResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _NotificationListApiResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationListApiResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationListApiResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  NotificationListResponseDto? data,  NotificationResponseMetaDto? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationListApiResponseDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  NotificationListResponseDto? data,  NotificationResponseMetaDto? meta)  $default,) {final _that = this;
switch (_that) {
case _NotificationListApiResponseDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  NotificationListResponseDto? data,  NotificationResponseMetaDto? meta)?  $default,) {final _that = this;
switch (_that) {
case _NotificationListApiResponseDto() when $default != null:
return $default(_that.success,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationListApiResponseDto implements NotificationListApiResponseDto {
  const _NotificationListApiResponseDto({this.success, this.data, this.meta});
  factory _NotificationListApiResponseDto.fromJson(Map<String, dynamic> json) => _$NotificationListApiResponseDtoFromJson(json);

@override final  bool? success;
@override final  NotificationListResponseDto? data;
@override final  NotificationResponseMetaDto? meta;


@override
Map<String, dynamic> toJson() {
  return _$NotificationListApiResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationListApiResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data,meta);

@override
String toString() {
  return 'NotificationListApiResponseDto(success: $success, data: $data, meta: $meta)';
}


}





/// @nodoc
mixin _$NotificationListResponseDto {

 List<NotificationSummaryResponseDto> get content; int? get page; int? get size; int? get totalElements; int? get totalPages; bool? get first; bool? get last; int? get unreadCount;

  /// Serializes this NotificationListResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationListResponseDto&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),page,size,totalElements,totalPages,first,last,unreadCount);

@override
String toString() {
  return 'NotificationListResponseDto(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages, first: $first, last: $last, unreadCount: $unreadCount)';
}


}




/// Adds pattern-matching-related methods to [NotificationListResponseDto].
extension NotificationListResponseDtoPatterns on NotificationListResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationListResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationListResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationListResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _NotificationListResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationListResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationListResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NotificationSummaryResponseDto> content,  int? page,  int? size,  int? totalElements,  int? totalPages,  bool? first,  bool? last,  int? unreadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationListResponseDto() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages,_that.first,_that.last,_that.unreadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NotificationSummaryResponseDto> content,  int? page,  int? size,  int? totalElements,  int? totalPages,  bool? first,  bool? last,  int? unreadCount)  $default,) {final _that = this;
switch (_that) {
case _NotificationListResponseDto():
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages,_that.first,_that.last,_that.unreadCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NotificationSummaryResponseDto> content,  int? page,  int? size,  int? totalElements,  int? totalPages,  bool? first,  bool? last,  int? unreadCount)?  $default,) {final _that = this;
switch (_that) {
case _NotificationListResponseDto() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages,_that.first,_that.last,_that.unreadCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationListResponseDto implements NotificationListResponseDto {
  const _NotificationListResponseDto({final  List<NotificationSummaryResponseDto> content = const <NotificationSummaryResponseDto>[], this.page, this.size, this.totalElements, this.totalPages, this.first, this.last, this.unreadCount}): _content = content;
  factory _NotificationListResponseDto.fromJson(Map<String, dynamic> json) => _$NotificationListResponseDtoFromJson(json);

 final  List<NotificationSummaryResponseDto> _content;
@override@JsonKey() List<NotificationSummaryResponseDto> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override final  int? page;
@override final  int? size;
@override final  int? totalElements;
@override final  int? totalPages;
@override final  bool? first;
@override final  bool? last;
@override final  int? unreadCount;


@override
Map<String, dynamic> toJson() {
  return _$NotificationListResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationListResponseDto&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),page,size,totalElements,totalPages,first,last,unreadCount);

@override
String toString() {
  return 'NotificationListResponseDto(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages, first: $first, last: $last, unreadCount: $unreadCount)';
}


}





/// @nodoc
mixin _$NotificationSummaryResponseDto {

 int? get notificationId;@JsonKey(unknownEnumValue: NotificationTypeDto.unknown) NotificationTypeDto? get notificationType; String? get title; String? get content;@JsonKey(unknownEnumValue: NotificationTargetTypeDto.unknown) NotificationTargetTypeDto? get targetType; int? get targetId; bool? get targetAvailable;@JsonKey(unknownEnumValue: NotificationUnavailableReasonDto.unknown) NotificationUnavailableReasonDto? get targetUnavailableReason; String? get deepLink;@JsonKey(name: 'read') bool? get isRead; DateTime? get readAt; DateTime? get createdAt;

  /// Serializes this NotificationSummaryResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationSummaryResponseDto&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.notificationType, notificationType) || other.notificationType == notificationType)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.targetAvailable, targetAvailable) || other.targetAvailable == targetAvailable)&&(identical(other.targetUnavailableReason, targetUnavailableReason) || other.targetUnavailableReason == targetUnavailableReason)&&(identical(other.deepLink, deepLink) || other.deepLink == deepLink)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notificationId,notificationType,title,content,targetType,targetId,targetAvailable,targetUnavailableReason,deepLink,isRead,readAt,createdAt);

@override
String toString() {
  return 'NotificationSummaryResponseDto(notificationId: $notificationId, notificationType: $notificationType, title: $title, content: $content, targetType: $targetType, targetId: $targetId, targetAvailable: $targetAvailable, targetUnavailableReason: $targetUnavailableReason, deepLink: $deepLink, isRead: $isRead, readAt: $readAt, createdAt: $createdAt)';
}


}




/// Adds pattern-matching-related methods to [NotificationSummaryResponseDto].
extension NotificationSummaryResponseDtoPatterns on NotificationSummaryResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationSummaryResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationSummaryResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationSummaryResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _NotificationSummaryResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationSummaryResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationSummaryResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? notificationId, @JsonKey(unknownEnumValue: NotificationTypeDto.unknown)  NotificationTypeDto? notificationType,  String? title,  String? content, @JsonKey(unknownEnumValue: NotificationTargetTypeDto.unknown)  NotificationTargetTypeDto? targetType,  int? targetId,  bool? targetAvailable, @JsonKey(unknownEnumValue: NotificationUnavailableReasonDto.unknown)  NotificationUnavailableReasonDto? targetUnavailableReason,  String? deepLink, @JsonKey(name: 'read')  bool? isRead,  DateTime? readAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationSummaryResponseDto() when $default != null:
return $default(_that.notificationId,_that.notificationType,_that.title,_that.content,_that.targetType,_that.targetId,_that.targetAvailable,_that.targetUnavailableReason,_that.deepLink,_that.isRead,_that.readAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? notificationId, @JsonKey(unknownEnumValue: NotificationTypeDto.unknown)  NotificationTypeDto? notificationType,  String? title,  String? content, @JsonKey(unknownEnumValue: NotificationTargetTypeDto.unknown)  NotificationTargetTypeDto? targetType,  int? targetId,  bool? targetAvailable, @JsonKey(unknownEnumValue: NotificationUnavailableReasonDto.unknown)  NotificationUnavailableReasonDto? targetUnavailableReason,  String? deepLink, @JsonKey(name: 'read')  bool? isRead,  DateTime? readAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationSummaryResponseDto():
return $default(_that.notificationId,_that.notificationType,_that.title,_that.content,_that.targetType,_that.targetId,_that.targetAvailable,_that.targetUnavailableReason,_that.deepLink,_that.isRead,_that.readAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? notificationId, @JsonKey(unknownEnumValue: NotificationTypeDto.unknown)  NotificationTypeDto? notificationType,  String? title,  String? content, @JsonKey(unknownEnumValue: NotificationTargetTypeDto.unknown)  NotificationTargetTypeDto? targetType,  int? targetId,  bool? targetAvailable, @JsonKey(unknownEnumValue: NotificationUnavailableReasonDto.unknown)  NotificationUnavailableReasonDto? targetUnavailableReason,  String? deepLink, @JsonKey(name: 'read')  bool? isRead,  DateTime? readAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationSummaryResponseDto() when $default != null:
return $default(_that.notificationId,_that.notificationType,_that.title,_that.content,_that.targetType,_that.targetId,_that.targetAvailable,_that.targetUnavailableReason,_that.deepLink,_that.isRead,_that.readAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationSummaryResponseDto implements NotificationSummaryResponseDto {
  const _NotificationSummaryResponseDto({this.notificationId, @JsonKey(unknownEnumValue: NotificationTypeDto.unknown) this.notificationType, this.title, this.content, @JsonKey(unknownEnumValue: NotificationTargetTypeDto.unknown) this.targetType, this.targetId, this.targetAvailable, @JsonKey(unknownEnumValue: NotificationUnavailableReasonDto.unknown) this.targetUnavailableReason, this.deepLink, @JsonKey(name: 'read') this.isRead, this.readAt, this.createdAt});
  factory _NotificationSummaryResponseDto.fromJson(Map<String, dynamic> json) => _$NotificationSummaryResponseDtoFromJson(json);

@override final  int? notificationId;
@override@JsonKey(unknownEnumValue: NotificationTypeDto.unknown) final  NotificationTypeDto? notificationType;
@override final  String? title;
@override final  String? content;
@override@JsonKey(unknownEnumValue: NotificationTargetTypeDto.unknown) final  NotificationTargetTypeDto? targetType;
@override final  int? targetId;
@override final  bool? targetAvailable;
@override@JsonKey(unknownEnumValue: NotificationUnavailableReasonDto.unknown) final  NotificationUnavailableReasonDto? targetUnavailableReason;
@override final  String? deepLink;
@override@JsonKey(name: 'read') final  bool? isRead;
@override final  DateTime? readAt;
@override final  DateTime? createdAt;


@override
Map<String, dynamic> toJson() {
  return _$NotificationSummaryResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationSummaryResponseDto&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.notificationType, notificationType) || other.notificationType == notificationType)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.targetAvailable, targetAvailable) || other.targetAvailable == targetAvailable)&&(identical(other.targetUnavailableReason, targetUnavailableReason) || other.targetUnavailableReason == targetUnavailableReason)&&(identical(other.deepLink, deepLink) || other.deepLink == deepLink)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notificationId,notificationType,title,content,targetType,targetId,targetAvailable,targetUnavailableReason,deepLink,isRead,readAt,createdAt);

@override
String toString() {
  return 'NotificationSummaryResponseDto(notificationId: $notificationId, notificationType: $notificationType, title: $title, content: $content, targetType: $targetType, targetId: $targetId, targetAvailable: $targetAvailable, targetUnavailableReason: $targetUnavailableReason, deepLink: $deepLink, isRead: $isRead, readAt: $readAt, createdAt: $createdAt)';
}


}





/// @nodoc
mixin _$NotificationResponseMetaDto {

 String? get requestId;

  /// Serializes this NotificationResponseMetaDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationResponseMetaDto&&(identical(other.requestId, requestId) || other.requestId == requestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'NotificationResponseMetaDto(requestId: $requestId)';
}


}




/// Adds pattern-matching-related methods to [NotificationResponseMetaDto].
extension NotificationResponseMetaDtoPatterns on NotificationResponseMetaDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationResponseMetaDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationResponseMetaDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationResponseMetaDto value)  $default,){
final _that = this;
switch (_that) {
case _NotificationResponseMetaDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationResponseMetaDto value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationResponseMetaDto() when $default != null:
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
case _NotificationResponseMetaDto() when $default != null:
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
case _NotificationResponseMetaDto():
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
case _NotificationResponseMetaDto() when $default != null:
return $default(_that.requestId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationResponseMetaDto implements NotificationResponseMetaDto {
  const _NotificationResponseMetaDto({this.requestId});
  factory _NotificationResponseMetaDto.fromJson(Map<String, dynamic> json) => _$NotificationResponseMetaDtoFromJson(json);

@override final  String? requestId;


@override
Map<String, dynamic> toJson() {
  return _$NotificationResponseMetaDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationResponseMetaDto&&(identical(other.requestId, requestId) || other.requestId == requestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'NotificationResponseMetaDto(requestId: $requestId)';
}


}




// dart format on
