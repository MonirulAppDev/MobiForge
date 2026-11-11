// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterResponseModel {

 bool get success; String get message; UserModel get data; AuthMetaModel? get meta;
/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterResponseModelCopyWith<RegisterResponseModel> get copyWith => _$RegisterResponseModelCopyWithImpl<RegisterResponseModel>(this as RegisterResponseModel, _$identity);

  /// Serializes this RegisterResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RegisterResponseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResponseModel&&(identical(other.success, _this.success) || other.success == _this.success)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.meta, _this.meta) || other.meta == _this.meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RegisterResponseModel;
  return Object.hash(runtimeType,_this.success,_this.message,_this.data,_this.meta);
}

@override
String toString() {
  final _this = this as RegisterResponseModel;
  return 'RegisterResponseModel(success: ${_this.success}, message: ${_this.message}, data: ${_this.data}, meta: ${_this.meta})';
}


}

/// @nodoc
abstract mixin class $RegisterResponseModelCopyWith<$Res>  {
  factory $RegisterResponseModelCopyWith(RegisterResponseModel value, $Res Function(RegisterResponseModel) _then) = _$RegisterResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message, UserModel data, AuthMetaModel? meta
});


$UserModelCopyWith<$Res> get data;$AuthMetaModelCopyWith<$Res>? get meta;

}
/// @nodoc
class _$RegisterResponseModelCopyWithImpl<$Res>
    implements $RegisterResponseModelCopyWith<$Res> {
  _$RegisterResponseModelCopyWithImpl(this._self, this._then);

  final RegisterResponseModel _self;
  final $Res Function(RegisterResponseModel) _then;

/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,Object? meta = freezed,}) {
  return _then(RegisterResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserModel,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as AuthMetaModel?,
  ));
}
/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get data {
  
  return $UserModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthMetaModelCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $AuthMetaModelCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterResponseModel].
extension RegisterResponseModelPatterns on RegisterResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _RegisterResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  UserModel data,  AuthMetaModel? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  UserModel data,  AuthMetaModel? meta)  $default,) {final _that = this;
switch (_that) {
case _RegisterResponseModel():
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  UserModel data,  AuthMetaModel? meta)?  $default,) {final _that = this;
switch (_that) {
case _RegisterResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterResponseModel implements RegisterResponseModel {
  const _RegisterResponseModel({required this.success, required this.message, required this.data, this.meta});
  factory _RegisterResponseModel.fromJson(Map<String, dynamic> json) => _$RegisterResponseModelFromJson(json);

@override final  bool success;
@override final  String message;
@override final  UserModel data;
@override final  AuthMetaModel? meta;

/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterResponseModelCopyWith<_RegisterResponseModel> get copyWith => __$RegisterResponseModelCopyWithImpl<_RegisterResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,success,message,data,meta);
}

@override
String toString() {
    return 'RegisterResponseModel(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$RegisterResponseModelCopyWith<$Res> implements $RegisterResponseModelCopyWith<$Res> {
  factory _$RegisterResponseModelCopyWith(_RegisterResponseModel value, $Res Function(_RegisterResponseModel) _then) = __$RegisterResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, UserModel data, AuthMetaModel? meta
});


@override $UserModelCopyWith<$Res> get data;@override $AuthMetaModelCopyWith<$Res>? get meta;

}
/// @nodoc
class __$RegisterResponseModelCopyWithImpl<$Res>
    implements _$RegisterResponseModelCopyWith<$Res> {
  __$RegisterResponseModelCopyWithImpl(this._self, this._then);

  final _RegisterResponseModel _self;
  final $Res Function(_RegisterResponseModel) _then;

/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,Object? meta = freezed,}) {
  return _then(_RegisterResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserModel,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as AuthMetaModel?,
  ));
}

/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get data {
  
  return $UserModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthMetaModelCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $AuthMetaModelCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$AuthMetaModel {

@JsonKey(name: 'request_id') String? get requestId; String? get timestamp;
/// Create a copy of AuthMetaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthMetaModelCopyWith<AuthMetaModel> get copyWith => _$AuthMetaModelCopyWithImpl<AuthMetaModel>(this as AuthMetaModel, _$identity);

  /// Serializes this AuthMetaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AuthMetaModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthMetaModel&&(identical(other.requestId, _this.requestId) || other.requestId == _this.requestId)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AuthMetaModel;
  return Object.hash(runtimeType,_this.requestId,_this.timestamp);
}

@override
String toString() {
  final _this = this as AuthMetaModel;
  return 'AuthMetaModel(requestId: ${_this.requestId}, timestamp: ${_this.timestamp})';
}


}

/// @nodoc
abstract mixin class $AuthMetaModelCopyWith<$Res>  {
  factory $AuthMetaModelCopyWith(AuthMetaModel value, $Res Function(AuthMetaModel) _then) = _$AuthMetaModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'request_id') String? requestId, String? timestamp
});




}
/// @nodoc
class _$AuthMetaModelCopyWithImpl<$Res>
    implements $AuthMetaModelCopyWith<$Res> {
  _$AuthMetaModelCopyWithImpl(this._self, this._then);

  final AuthMetaModel _self;
  final $Res Function(AuthMetaModel) _then;

/// Create a copy of AuthMetaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = freezed,Object? timestamp = freezed,}) {
  return _then(AuthMetaModel(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthMetaModel].
extension AuthMetaModelPatterns on AuthMetaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthMetaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthMetaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthMetaModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthMetaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthMetaModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthMetaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'request_id')  String? requestId,  String? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthMetaModel() when $default != null:
return $default(_that.requestId,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'request_id')  String? requestId,  String? timestamp)  $default,) {final _that = this;
switch (_that) {
case _AuthMetaModel():
return $default(_that.requestId,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'request_id')  String? requestId,  String? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _AuthMetaModel() when $default != null:
return $default(_that.requestId,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthMetaModel implements AuthMetaModel {
  const _AuthMetaModel({@JsonKey(name: 'request_id') this.requestId, this.timestamp});
  factory _AuthMetaModel.fromJson(Map<String, dynamic> json) => _$AuthMetaModelFromJson(json);

@override@JsonKey(name: 'request_id') final  String? requestId;
@override final  String? timestamp;

/// Create a copy of AuthMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthMetaModelCopyWith<_AuthMetaModel> get copyWith => __$AuthMetaModelCopyWithImpl<_AuthMetaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthMetaModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthMetaModel&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,requestId,timestamp);
}

@override
String toString() {
    return 'AuthMetaModel(requestId: $requestId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$AuthMetaModelCopyWith<$Res> implements $AuthMetaModelCopyWith<$Res> {
  factory _$AuthMetaModelCopyWith(_AuthMetaModel value, $Res Function(_AuthMetaModel) _then) = __$AuthMetaModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'request_id') String? requestId, String? timestamp
});




}
/// @nodoc
class __$AuthMetaModelCopyWithImpl<$Res>
    implements _$AuthMetaModelCopyWith<$Res> {
  __$AuthMetaModelCopyWithImpl(this._self, this._then);

  final _AuthMetaModel _self;
  final $Res Function(_AuthMetaModel) _then;

/// Create a copy of AuthMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = freezed,Object? timestamp = freezed,}) {
  return _then(_AuthMetaModel(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
