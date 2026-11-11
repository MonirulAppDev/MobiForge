// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mobile_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MobileConfigResponseModel {

 bool get success; String get message; MobileConfigDataModel get data; ConfigMetaModel? get meta;
/// Create a copy of MobileConfigResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MobileConfigResponseModelCopyWith<MobileConfigResponseModel> get copyWith => _$MobileConfigResponseModelCopyWithImpl<MobileConfigResponseModel>(this as MobileConfigResponseModel, _$identity);

  /// Serializes this MobileConfigResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MobileConfigResponseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MobileConfigResponseModel&&(identical(other.success, _this.success) || other.success == _this.success)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.meta, _this.meta) || other.meta == _this.meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MobileConfigResponseModel;
  return Object.hash(runtimeType,_this.success,_this.message,_this.data,_this.meta);
}

@override
String toString() {
  final _this = this as MobileConfigResponseModel;
  return 'MobileConfigResponseModel(success: ${_this.success}, message: ${_this.message}, data: ${_this.data}, meta: ${_this.meta})';
}


}

/// @nodoc
abstract mixin class $MobileConfigResponseModelCopyWith<$Res>  {
  factory $MobileConfigResponseModelCopyWith(MobileConfigResponseModel value, $Res Function(MobileConfigResponseModel) _then) = _$MobileConfigResponseModelCopyWithImpl;
@useResult
$Res call({
 bool success, String message, MobileConfigDataModel data, ConfigMetaModel? meta
});


$MobileConfigDataModelCopyWith<$Res> get data;$ConfigMetaModelCopyWith<$Res>? get meta;

}
/// @nodoc
class _$MobileConfigResponseModelCopyWithImpl<$Res>
    implements $MobileConfigResponseModelCopyWith<$Res> {
  _$MobileConfigResponseModelCopyWithImpl(this._self, this._then);

  final MobileConfigResponseModel _self;
  final $Res Function(MobileConfigResponseModel) _then;

/// Create a copy of MobileConfigResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,Object? meta = freezed,}) {
  return _then(MobileConfigResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MobileConfigDataModel,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ConfigMetaModel?,
  ));
}
/// Create a copy of MobileConfigResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MobileConfigDataModelCopyWith<$Res> get data {
  
  return $MobileConfigDataModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MobileConfigResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfigMetaModelCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ConfigMetaModelCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [MobileConfigResponseModel].
extension MobileConfigResponseModelPatterns on MobileConfigResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MobileConfigResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MobileConfigResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MobileConfigResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _MobileConfigResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MobileConfigResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _MobileConfigResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  MobileConfigDataModel data,  ConfigMetaModel? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MobileConfigResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  MobileConfigDataModel data,  ConfigMetaModel? meta)  $default,) {final _that = this;
switch (_that) {
case _MobileConfigResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  MobileConfigDataModel data,  ConfigMetaModel? meta)?  $default,) {final _that = this;
switch (_that) {
case _MobileConfigResponseModel() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MobileConfigResponseModel implements MobileConfigResponseModel {
  const _MobileConfigResponseModel({required this.success, required this.message, required this.data, this.meta});
  factory _MobileConfigResponseModel.fromJson(Map<String, dynamic> json) => _$MobileConfigResponseModelFromJson(json);

@override final  bool success;
@override final  String message;
@override final  MobileConfigDataModel data;
@override final  ConfigMetaModel? meta;

/// Create a copy of MobileConfigResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MobileConfigResponseModelCopyWith<_MobileConfigResponseModel> get copyWith => __$MobileConfigResponseModelCopyWithImpl<_MobileConfigResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MobileConfigResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MobileConfigResponseModel&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,success,message,data,meta);
}

@override
String toString() {
    return 'MobileConfigResponseModel(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$MobileConfigResponseModelCopyWith<$Res> implements $MobileConfigResponseModelCopyWith<$Res> {
  factory _$MobileConfigResponseModelCopyWith(_MobileConfigResponseModel value, $Res Function(_MobileConfigResponseModel) _then) = __$MobileConfigResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, MobileConfigDataModel data, ConfigMetaModel? meta
});


@override $MobileConfigDataModelCopyWith<$Res> get data;@override $ConfigMetaModelCopyWith<$Res>? get meta;

}
/// @nodoc
class __$MobileConfigResponseModelCopyWithImpl<$Res>
    implements _$MobileConfigResponseModelCopyWith<$Res> {
  __$MobileConfigResponseModelCopyWithImpl(this._self, this._then);

  final _MobileConfigResponseModel _self;
  final $Res Function(_MobileConfigResponseModel) _then;

/// Create a copy of MobileConfigResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,Object? meta = freezed,}) {
  return _then(_MobileConfigResponseModel(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MobileConfigDataModel,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ConfigMetaModel?,
  ));
}

/// Create a copy of MobileConfigResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MobileConfigDataModelCopyWith<$Res> get data {
  
  return $MobileConfigDataModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MobileConfigResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfigMetaModelCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ConfigMetaModelCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$ConfigMetaModel {

@JsonKey(name: 'request_id') String? get requestId; String? get timestamp;
/// Create a copy of ConfigMetaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigMetaModelCopyWith<ConfigMetaModel> get copyWith => _$ConfigMetaModelCopyWithImpl<ConfigMetaModel>(this as ConfigMetaModel, _$identity);

  /// Serializes this ConfigMetaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ConfigMetaModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigMetaModel&&(identical(other.requestId, _this.requestId) || other.requestId == _this.requestId)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ConfigMetaModel;
  return Object.hash(runtimeType,_this.requestId,_this.timestamp);
}

@override
String toString() {
  final _this = this as ConfigMetaModel;
  return 'ConfigMetaModel(requestId: ${_this.requestId}, timestamp: ${_this.timestamp})';
}


}

/// @nodoc
abstract mixin class $ConfigMetaModelCopyWith<$Res>  {
  factory $ConfigMetaModelCopyWith(ConfigMetaModel value, $Res Function(ConfigMetaModel) _then) = _$ConfigMetaModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'request_id') String? requestId, String? timestamp
});




}
/// @nodoc
class _$ConfigMetaModelCopyWithImpl<$Res>
    implements $ConfigMetaModelCopyWith<$Res> {
  _$ConfigMetaModelCopyWithImpl(this._self, this._then);

  final ConfigMetaModel _self;
  final $Res Function(ConfigMetaModel) _then;

/// Create a copy of ConfigMetaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = freezed,Object? timestamp = freezed,}) {
  return _then(ConfigMetaModel(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfigMetaModel].
extension ConfigMetaModelPatterns on ConfigMetaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfigMetaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfigMetaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfigMetaModel value)  $default,){
final _that = this;
switch (_that) {
case _ConfigMetaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfigMetaModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConfigMetaModel() when $default != null:
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
case _ConfigMetaModel() when $default != null:
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
case _ConfigMetaModel():
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
case _ConfigMetaModel() when $default != null:
return $default(_that.requestId,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfigMetaModel implements ConfigMetaModel {
  const _ConfigMetaModel({@JsonKey(name: 'request_id') this.requestId, this.timestamp});
  factory _ConfigMetaModel.fromJson(Map<String, dynamic> json) => _$ConfigMetaModelFromJson(json);

@override@JsonKey(name: 'request_id') final  String? requestId;
@override final  String? timestamp;

/// Create a copy of ConfigMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfigMetaModelCopyWith<_ConfigMetaModel> get copyWith => __$ConfigMetaModelCopyWithImpl<_ConfigMetaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfigMetaModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfigMetaModel&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,requestId,timestamp);
}

@override
String toString() {
    return 'ConfigMetaModel(requestId: $requestId, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$ConfigMetaModelCopyWith<$Res> implements $ConfigMetaModelCopyWith<$Res> {
  factory _$ConfigMetaModelCopyWith(_ConfigMetaModel value, $Res Function(_ConfigMetaModel) _then) = __$ConfigMetaModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'request_id') String? requestId, String? timestamp
});




}
/// @nodoc
class __$ConfigMetaModelCopyWithImpl<$Res>
    implements _$ConfigMetaModelCopyWith<$Res> {
  __$ConfigMetaModelCopyWithImpl(this._self, this._then);

  final _ConfigMetaModel _self;
  final $Res Function(_ConfigMetaModel) _then;

/// Create a copy of ConfigMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = freezed,Object? timestamp = freezed,}) {
  return _then(_ConfigMetaModel(
requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MobileConfigDataModel {

@JsonKey(name: 'api_version') String get apiVersion; String get environment;@JsonKey(name: 'force_update') bool get forceUpdate;@JsonKey(name: 'latest_app_version') String get latestAppVersion;@JsonKey(name: 'maintenance_message') String get maintenanceMessage;@JsonKey(name: 'maintenance_mode') bool get maintenanceMode;@JsonKey(name: 'minimum_app_version') String get minimumAppVersion;@JsonKey(name: 'multi_listener') bool get multiListener; ConfigFeaturesModel get features; ConfigServicesModel get services;
/// Create a copy of MobileConfigDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MobileConfigDataModelCopyWith<MobileConfigDataModel> get copyWith => _$MobileConfigDataModelCopyWithImpl<MobileConfigDataModel>(this as MobileConfigDataModel, _$identity);

  /// Serializes this MobileConfigDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MobileConfigDataModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MobileConfigDataModel&&(identical(other.apiVersion, _this.apiVersion) || other.apiVersion == _this.apiVersion)&&(identical(other.environment, _this.environment) || other.environment == _this.environment)&&(identical(other.forceUpdate, _this.forceUpdate) || other.forceUpdate == _this.forceUpdate)&&(identical(other.latestAppVersion, _this.latestAppVersion) || other.latestAppVersion == _this.latestAppVersion)&&(identical(other.maintenanceMessage, _this.maintenanceMessage) || other.maintenanceMessage == _this.maintenanceMessage)&&(identical(other.maintenanceMode, _this.maintenanceMode) || other.maintenanceMode == _this.maintenanceMode)&&(identical(other.minimumAppVersion, _this.minimumAppVersion) || other.minimumAppVersion == _this.minimumAppVersion)&&(identical(other.multiListener, _this.multiListener) || other.multiListener == _this.multiListener)&&(identical(other.features, _this.features) || other.features == _this.features)&&(identical(other.services, _this.services) || other.services == _this.services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MobileConfigDataModel;
  return Object.hash(runtimeType,_this.apiVersion,_this.environment,_this.forceUpdate,_this.latestAppVersion,_this.maintenanceMessage,_this.maintenanceMode,_this.minimumAppVersion,_this.multiListener,_this.features,_this.services);
}

@override
String toString() {
  final _this = this as MobileConfigDataModel;
  return 'MobileConfigDataModel(apiVersion: ${_this.apiVersion}, environment: ${_this.environment}, forceUpdate: ${_this.forceUpdate}, latestAppVersion: ${_this.latestAppVersion}, maintenanceMessage: ${_this.maintenanceMessage}, maintenanceMode: ${_this.maintenanceMode}, minimumAppVersion: ${_this.minimumAppVersion}, multiListener: ${_this.multiListener}, features: ${_this.features}, services: ${_this.services})';
}


}

/// @nodoc
abstract mixin class $MobileConfigDataModelCopyWith<$Res>  {
  factory $MobileConfigDataModelCopyWith(MobileConfigDataModel value, $Res Function(MobileConfigDataModel) _then) = _$MobileConfigDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'api_version') String apiVersion, String environment,@JsonKey(name: 'force_update') bool forceUpdate,@JsonKey(name: 'latest_app_version') String latestAppVersion,@JsonKey(name: 'maintenance_message') String maintenanceMessage,@JsonKey(name: 'maintenance_mode') bool maintenanceMode,@JsonKey(name: 'minimum_app_version') String minimumAppVersion,@JsonKey(name: 'multi_listener') bool multiListener, ConfigFeaturesModel features, ConfigServicesModel services
});


$ConfigFeaturesModelCopyWith<$Res> get features;$ConfigServicesModelCopyWith<$Res> get services;

}
/// @nodoc
class _$MobileConfigDataModelCopyWithImpl<$Res>
    implements $MobileConfigDataModelCopyWith<$Res> {
  _$MobileConfigDataModelCopyWithImpl(this._self, this._then);

  final MobileConfigDataModel _self;
  final $Res Function(MobileConfigDataModel) _then;

/// Create a copy of MobileConfigDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apiVersion = null,Object? environment = null,Object? forceUpdate = null,Object? latestAppVersion = null,Object? maintenanceMessage = null,Object? maintenanceMode = null,Object? minimumAppVersion = null,Object? multiListener = null,Object? features = null,Object? services = null,}) {
  return _then(MobileConfigDataModel(
apiVersion: null == apiVersion ? _self.apiVersion : apiVersion // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as String,forceUpdate: null == forceUpdate ? _self.forceUpdate : forceUpdate // ignore: cast_nullable_to_non_nullable
as bool,latestAppVersion: null == latestAppVersion ? _self.latestAppVersion : latestAppVersion // ignore: cast_nullable_to_non_nullable
as String,maintenanceMessage: null == maintenanceMessage ? _self.maintenanceMessage : maintenanceMessage // ignore: cast_nullable_to_non_nullable
as String,maintenanceMode: null == maintenanceMode ? _self.maintenanceMode : maintenanceMode // ignore: cast_nullable_to_non_nullable
as bool,minimumAppVersion: null == minimumAppVersion ? _self.minimumAppVersion : minimumAppVersion // ignore: cast_nullable_to_non_nullable
as String,multiListener: null == multiListener ? _self.multiListener : multiListener // ignore: cast_nullable_to_non_nullable
as bool,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as ConfigFeaturesModel,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as ConfigServicesModel,
  ));
}
/// Create a copy of MobileConfigDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfigFeaturesModelCopyWith<$Res> get features {
  
  return $ConfigFeaturesModelCopyWith<$Res>(_self.features, (value) {
    return _then(_self.copyWith(features: value));
  });
}/// Create a copy of MobileConfigDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfigServicesModelCopyWith<$Res> get services {
  
  return $ConfigServicesModelCopyWith<$Res>(_self.services, (value) {
    return _then(_self.copyWith(services: value));
  });
}
}


/// Adds pattern-matching-related methods to [MobileConfigDataModel].
extension MobileConfigDataModelPatterns on MobileConfigDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MobileConfigDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MobileConfigDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MobileConfigDataModel value)  $default,){
final _that = this;
switch (_that) {
case _MobileConfigDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MobileConfigDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _MobileConfigDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'api_version')  String apiVersion,  String environment, @JsonKey(name: 'force_update')  bool forceUpdate, @JsonKey(name: 'latest_app_version')  String latestAppVersion, @JsonKey(name: 'maintenance_message')  String maintenanceMessage, @JsonKey(name: 'maintenance_mode')  bool maintenanceMode, @JsonKey(name: 'minimum_app_version')  String minimumAppVersion, @JsonKey(name: 'multi_listener')  bool multiListener,  ConfigFeaturesModel features,  ConfigServicesModel services)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MobileConfigDataModel() when $default != null:
return $default(_that.apiVersion,_that.environment,_that.forceUpdate,_that.latestAppVersion,_that.maintenanceMessage,_that.maintenanceMode,_that.minimumAppVersion,_that.multiListener,_that.features,_that.services);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'api_version')  String apiVersion,  String environment, @JsonKey(name: 'force_update')  bool forceUpdate, @JsonKey(name: 'latest_app_version')  String latestAppVersion, @JsonKey(name: 'maintenance_message')  String maintenanceMessage, @JsonKey(name: 'maintenance_mode')  bool maintenanceMode, @JsonKey(name: 'minimum_app_version')  String minimumAppVersion, @JsonKey(name: 'multi_listener')  bool multiListener,  ConfigFeaturesModel features,  ConfigServicesModel services)  $default,) {final _that = this;
switch (_that) {
case _MobileConfigDataModel():
return $default(_that.apiVersion,_that.environment,_that.forceUpdate,_that.latestAppVersion,_that.maintenanceMessage,_that.maintenanceMode,_that.minimumAppVersion,_that.multiListener,_that.features,_that.services);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'api_version')  String apiVersion,  String environment, @JsonKey(name: 'force_update')  bool forceUpdate, @JsonKey(name: 'latest_app_version')  String latestAppVersion, @JsonKey(name: 'maintenance_message')  String maintenanceMessage, @JsonKey(name: 'maintenance_mode')  bool maintenanceMode, @JsonKey(name: 'minimum_app_version')  String minimumAppVersion, @JsonKey(name: 'multi_listener')  bool multiListener,  ConfigFeaturesModel features,  ConfigServicesModel services)?  $default,) {final _that = this;
switch (_that) {
case _MobileConfigDataModel() when $default != null:
return $default(_that.apiVersion,_that.environment,_that.forceUpdate,_that.latestAppVersion,_that.maintenanceMessage,_that.maintenanceMode,_that.minimumAppVersion,_that.multiListener,_that.features,_that.services);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MobileConfigDataModel extends MobileConfigDataModel {
  const _MobileConfigDataModel({@JsonKey(name: 'api_version') required this.apiVersion, required this.environment, @JsonKey(name: 'force_update') required this.forceUpdate, @JsonKey(name: 'latest_app_version') required this.latestAppVersion, @JsonKey(name: 'maintenance_message') required this.maintenanceMessage, @JsonKey(name: 'maintenance_mode') required this.maintenanceMode, @JsonKey(name: 'minimum_app_version') required this.minimumAppVersion, @JsonKey(name: 'multi_listener') required this.multiListener, required this.features, required this.services}): super._();
  factory _MobileConfigDataModel.fromJson(Map<String, dynamic> json) => _$MobileConfigDataModelFromJson(json);

@override@JsonKey(name: 'api_version') final  String apiVersion;
@override final  String environment;
@override@JsonKey(name: 'force_update') final  bool forceUpdate;
@override@JsonKey(name: 'latest_app_version') final  String latestAppVersion;
@override@JsonKey(name: 'maintenance_message') final  String maintenanceMessage;
@override@JsonKey(name: 'maintenance_mode') final  bool maintenanceMode;
@override@JsonKey(name: 'minimum_app_version') final  String minimumAppVersion;
@override@JsonKey(name: 'multi_listener') final  bool multiListener;
@override final  ConfigFeaturesModel features;
@override final  ConfigServicesModel services;

/// Create a copy of MobileConfigDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MobileConfigDataModelCopyWith<_MobileConfigDataModel> get copyWith => __$MobileConfigDataModelCopyWithImpl<_MobileConfigDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MobileConfigDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MobileConfigDataModel&&(identical(other.apiVersion, apiVersion) || other.apiVersion == apiVersion)&&(identical(other.environment, environment) || other.environment == environment)&&(identical(other.forceUpdate, forceUpdate) || other.forceUpdate == forceUpdate)&&(identical(other.latestAppVersion, latestAppVersion) || other.latestAppVersion == latestAppVersion)&&(identical(other.maintenanceMessage, maintenanceMessage) || other.maintenanceMessage == maintenanceMessage)&&(identical(other.maintenanceMode, maintenanceMode) || other.maintenanceMode == maintenanceMode)&&(identical(other.minimumAppVersion, minimumAppVersion) || other.minimumAppVersion == minimumAppVersion)&&(identical(other.multiListener, multiListener) || other.multiListener == multiListener)&&(identical(other.features, features) || other.features == features)&&(identical(other.services, services) || other.services == services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,apiVersion,environment,forceUpdate,latestAppVersion,maintenanceMessage,maintenanceMode,minimumAppVersion,multiListener,features,services);
}

@override
String toString() {
    return 'MobileConfigDataModel(apiVersion: $apiVersion, environment: $environment, forceUpdate: $forceUpdate, latestAppVersion: $latestAppVersion, maintenanceMessage: $maintenanceMessage, maintenanceMode: $maintenanceMode, minimumAppVersion: $minimumAppVersion, multiListener: $multiListener, features: $features, services: $services)';
}


}

/// @nodoc
abstract mixin class _$MobileConfigDataModelCopyWith<$Res> implements $MobileConfigDataModelCopyWith<$Res> {
  factory _$MobileConfigDataModelCopyWith(_MobileConfigDataModel value, $Res Function(_MobileConfigDataModel) _then) = __$MobileConfigDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'api_version') String apiVersion, String environment,@JsonKey(name: 'force_update') bool forceUpdate,@JsonKey(name: 'latest_app_version') String latestAppVersion,@JsonKey(name: 'maintenance_message') String maintenanceMessage,@JsonKey(name: 'maintenance_mode') bool maintenanceMode,@JsonKey(name: 'minimum_app_version') String minimumAppVersion,@JsonKey(name: 'multi_listener') bool multiListener, ConfigFeaturesModel features, ConfigServicesModel services
});


@override $ConfigFeaturesModelCopyWith<$Res> get features;@override $ConfigServicesModelCopyWith<$Res> get services;

}
/// @nodoc
class __$MobileConfigDataModelCopyWithImpl<$Res>
    implements _$MobileConfigDataModelCopyWith<$Res> {
  __$MobileConfigDataModelCopyWithImpl(this._self, this._then);

  final _MobileConfigDataModel _self;
  final $Res Function(_MobileConfigDataModel) _then;

/// Create a copy of MobileConfigDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apiVersion = null,Object? environment = null,Object? forceUpdate = null,Object? latestAppVersion = null,Object? maintenanceMessage = null,Object? maintenanceMode = null,Object? minimumAppVersion = null,Object? multiListener = null,Object? features = null,Object? services = null,}) {
  return _then(_MobileConfigDataModel(
apiVersion: null == apiVersion ? _self.apiVersion : apiVersion // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as String,forceUpdate: null == forceUpdate ? _self.forceUpdate : forceUpdate // ignore: cast_nullable_to_non_nullable
as bool,latestAppVersion: null == latestAppVersion ? _self.latestAppVersion : latestAppVersion // ignore: cast_nullable_to_non_nullable
as String,maintenanceMessage: null == maintenanceMessage ? _self.maintenanceMessage : maintenanceMessage // ignore: cast_nullable_to_non_nullable
as String,maintenanceMode: null == maintenanceMode ? _self.maintenanceMode : maintenanceMode // ignore: cast_nullable_to_non_nullable
as bool,minimumAppVersion: null == minimumAppVersion ? _self.minimumAppVersion : minimumAppVersion // ignore: cast_nullable_to_non_nullable
as String,multiListener: null == multiListener ? _self.multiListener : multiListener // ignore: cast_nullable_to_non_nullable
as bool,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as ConfigFeaturesModel,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as ConfigServicesModel,
  ));
}

/// Create a copy of MobileConfigDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfigFeaturesModelCopyWith<$Res> get features {
  
  return $ConfigFeaturesModelCopyWith<$Res>(_self.features, (value) {
    return _then(_self.copyWith(features: value));
  });
}/// Create a copy of MobileConfigDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfigServicesModelCopyWith<$Res> get services {
  
  return $ConfigServicesModelCopyWith<$Res>(_self.services, (value) {
    return _then(_self.copyWith(services: value));
  });
}
}


/// @nodoc
mixin _$ConfigFeaturesModel {

@JsonKey(name: 'mock_ai_enabled') bool get mockAiEnabled;@JsonKey(name: 'mock_otp_enabled') bool get mockOtpEnabled;@JsonKey(name: 'mock_payment_enabled') bool get mockPaymentEnabled;@JsonKey(name: 'testing_toolkit') bool get testingToolkit;
/// Create a copy of ConfigFeaturesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigFeaturesModelCopyWith<ConfigFeaturesModel> get copyWith => _$ConfigFeaturesModelCopyWithImpl<ConfigFeaturesModel>(this as ConfigFeaturesModel, _$identity);

  /// Serializes this ConfigFeaturesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ConfigFeaturesModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigFeaturesModel&&(identical(other.mockAiEnabled, _this.mockAiEnabled) || other.mockAiEnabled == _this.mockAiEnabled)&&(identical(other.mockOtpEnabled, _this.mockOtpEnabled) || other.mockOtpEnabled == _this.mockOtpEnabled)&&(identical(other.mockPaymentEnabled, _this.mockPaymentEnabled) || other.mockPaymentEnabled == _this.mockPaymentEnabled)&&(identical(other.testingToolkit, _this.testingToolkit) || other.testingToolkit == _this.testingToolkit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ConfigFeaturesModel;
  return Object.hash(runtimeType,_this.mockAiEnabled,_this.mockOtpEnabled,_this.mockPaymentEnabled,_this.testingToolkit);
}

@override
String toString() {
  final _this = this as ConfigFeaturesModel;
  return 'ConfigFeaturesModel(mockAiEnabled: ${_this.mockAiEnabled}, mockOtpEnabled: ${_this.mockOtpEnabled}, mockPaymentEnabled: ${_this.mockPaymentEnabled}, testingToolkit: ${_this.testingToolkit})';
}


}

/// @nodoc
abstract mixin class $ConfigFeaturesModelCopyWith<$Res>  {
  factory $ConfigFeaturesModelCopyWith(ConfigFeaturesModel value, $Res Function(ConfigFeaturesModel) _then) = _$ConfigFeaturesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'mock_ai_enabled') bool mockAiEnabled,@JsonKey(name: 'mock_otp_enabled') bool mockOtpEnabled,@JsonKey(name: 'mock_payment_enabled') bool mockPaymentEnabled,@JsonKey(name: 'testing_toolkit') bool testingToolkit
});




}
/// @nodoc
class _$ConfigFeaturesModelCopyWithImpl<$Res>
    implements $ConfigFeaturesModelCopyWith<$Res> {
  _$ConfigFeaturesModelCopyWithImpl(this._self, this._then);

  final ConfigFeaturesModel _self;
  final $Res Function(ConfigFeaturesModel) _then;

/// Create a copy of ConfigFeaturesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mockAiEnabled = null,Object? mockOtpEnabled = null,Object? mockPaymentEnabled = null,Object? testingToolkit = null,}) {
  return _then(ConfigFeaturesModel(
mockAiEnabled: null == mockAiEnabled ? _self.mockAiEnabled : mockAiEnabled // ignore: cast_nullable_to_non_nullable
as bool,mockOtpEnabled: null == mockOtpEnabled ? _self.mockOtpEnabled : mockOtpEnabled // ignore: cast_nullable_to_non_nullable
as bool,mockPaymentEnabled: null == mockPaymentEnabled ? _self.mockPaymentEnabled : mockPaymentEnabled // ignore: cast_nullable_to_non_nullable
as bool,testingToolkit: null == testingToolkit ? _self.testingToolkit : testingToolkit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfigFeaturesModel].
extension ConfigFeaturesModelPatterns on ConfigFeaturesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfigFeaturesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfigFeaturesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfigFeaturesModel value)  $default,){
final _that = this;
switch (_that) {
case _ConfigFeaturesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfigFeaturesModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConfigFeaturesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'mock_ai_enabled')  bool mockAiEnabled, @JsonKey(name: 'mock_otp_enabled')  bool mockOtpEnabled, @JsonKey(name: 'mock_payment_enabled')  bool mockPaymentEnabled, @JsonKey(name: 'testing_toolkit')  bool testingToolkit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfigFeaturesModel() when $default != null:
return $default(_that.mockAiEnabled,_that.mockOtpEnabled,_that.mockPaymentEnabled,_that.testingToolkit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'mock_ai_enabled')  bool mockAiEnabled, @JsonKey(name: 'mock_otp_enabled')  bool mockOtpEnabled, @JsonKey(name: 'mock_payment_enabled')  bool mockPaymentEnabled, @JsonKey(name: 'testing_toolkit')  bool testingToolkit)  $default,) {final _that = this;
switch (_that) {
case _ConfigFeaturesModel():
return $default(_that.mockAiEnabled,_that.mockOtpEnabled,_that.mockPaymentEnabled,_that.testingToolkit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'mock_ai_enabled')  bool mockAiEnabled, @JsonKey(name: 'mock_otp_enabled')  bool mockOtpEnabled, @JsonKey(name: 'mock_payment_enabled')  bool mockPaymentEnabled, @JsonKey(name: 'testing_toolkit')  bool testingToolkit)?  $default,) {final _that = this;
switch (_that) {
case _ConfigFeaturesModel() when $default != null:
return $default(_that.mockAiEnabled,_that.mockOtpEnabled,_that.mockPaymentEnabled,_that.testingToolkit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfigFeaturesModel extends ConfigFeaturesModel {
  const _ConfigFeaturesModel({@JsonKey(name: 'mock_ai_enabled') required this.mockAiEnabled, @JsonKey(name: 'mock_otp_enabled') required this.mockOtpEnabled, @JsonKey(name: 'mock_payment_enabled') required this.mockPaymentEnabled, @JsonKey(name: 'testing_toolkit') required this.testingToolkit}): super._();
  factory _ConfigFeaturesModel.fromJson(Map<String, dynamic> json) => _$ConfigFeaturesModelFromJson(json);

@override@JsonKey(name: 'mock_ai_enabled') final  bool mockAiEnabled;
@override@JsonKey(name: 'mock_otp_enabled') final  bool mockOtpEnabled;
@override@JsonKey(name: 'mock_payment_enabled') final  bool mockPaymentEnabled;
@override@JsonKey(name: 'testing_toolkit') final  bool testingToolkit;

/// Create a copy of ConfigFeaturesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfigFeaturesModelCopyWith<_ConfigFeaturesModel> get copyWith => __$ConfigFeaturesModelCopyWithImpl<_ConfigFeaturesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfigFeaturesModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfigFeaturesModel&&(identical(other.mockAiEnabled, mockAiEnabled) || other.mockAiEnabled == mockAiEnabled)&&(identical(other.mockOtpEnabled, mockOtpEnabled) || other.mockOtpEnabled == mockOtpEnabled)&&(identical(other.mockPaymentEnabled, mockPaymentEnabled) || other.mockPaymentEnabled == mockPaymentEnabled)&&(identical(other.testingToolkit, testingToolkit) || other.testingToolkit == testingToolkit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,mockAiEnabled,mockOtpEnabled,mockPaymentEnabled,testingToolkit);
}

@override
String toString() {
    return 'ConfigFeaturesModel(mockAiEnabled: $mockAiEnabled, mockOtpEnabled: $mockOtpEnabled, mockPaymentEnabled: $mockPaymentEnabled, testingToolkit: $testingToolkit)';
}


}

/// @nodoc
abstract mixin class _$ConfigFeaturesModelCopyWith<$Res> implements $ConfigFeaturesModelCopyWith<$Res> {
  factory _$ConfigFeaturesModelCopyWith(_ConfigFeaturesModel value, $Res Function(_ConfigFeaturesModel) _then) = __$ConfigFeaturesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'mock_ai_enabled') bool mockAiEnabled,@JsonKey(name: 'mock_otp_enabled') bool mockOtpEnabled,@JsonKey(name: 'mock_payment_enabled') bool mockPaymentEnabled,@JsonKey(name: 'testing_toolkit') bool testingToolkit
});




}
/// @nodoc
class __$ConfigFeaturesModelCopyWithImpl<$Res>
    implements _$ConfigFeaturesModelCopyWith<$Res> {
  __$ConfigFeaturesModelCopyWithImpl(this._self, this._then);

  final _ConfigFeaturesModel _self;
  final $Res Function(_ConfigFeaturesModel) _then;

/// Create a copy of ConfigFeaturesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mockAiEnabled = null,Object? mockOtpEnabled = null,Object? mockPaymentEnabled = null,Object? testingToolkit = null,}) {
  return _then(_ConfigFeaturesModel(
mockAiEnabled: null == mockAiEnabled ? _self.mockAiEnabled : mockAiEnabled // ignore: cast_nullable_to_non_nullable
as bool,mockOtpEnabled: null == mockOtpEnabled ? _self.mockOtpEnabled : mockOtpEnabled // ignore: cast_nullable_to_non_nullable
as bool,mockPaymentEnabled: null == mockPaymentEnabled ? _self.mockPaymentEnabled : mockPaymentEnabled // ignore: cast_nullable_to_non_nullable
as bool,testingToolkit: null == testingToolkit ? _self.testingToolkit : testingToolkit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ConfigServicesModel {

 String get ai; String get auth; String get catalog; String get chat; String get commerce; String get media; String get notifications; String get payments; String get unified;
/// Create a copy of ConfigServicesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigServicesModelCopyWith<ConfigServicesModel> get copyWith => _$ConfigServicesModelCopyWithImpl<ConfigServicesModel>(this as ConfigServicesModel, _$identity);

  /// Serializes this ConfigServicesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ConfigServicesModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigServicesModel&&(identical(other.ai, _this.ai) || other.ai == _this.ai)&&(identical(other.auth, _this.auth) || other.auth == _this.auth)&&(identical(other.catalog, _this.catalog) || other.catalog == _this.catalog)&&(identical(other.chat, _this.chat) || other.chat == _this.chat)&&(identical(other.commerce, _this.commerce) || other.commerce == _this.commerce)&&(identical(other.media, _this.media) || other.media == _this.media)&&(identical(other.notifications, _this.notifications) || other.notifications == _this.notifications)&&(identical(other.payments, _this.payments) || other.payments == _this.payments)&&(identical(other.unified, _this.unified) || other.unified == _this.unified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ConfigServicesModel;
  return Object.hash(runtimeType,_this.ai,_this.auth,_this.catalog,_this.chat,_this.commerce,_this.media,_this.notifications,_this.payments,_this.unified);
}

@override
String toString() {
  final _this = this as ConfigServicesModel;
  return 'ConfigServicesModel(ai: ${_this.ai}, auth: ${_this.auth}, catalog: ${_this.catalog}, chat: ${_this.chat}, commerce: ${_this.commerce}, media: ${_this.media}, notifications: ${_this.notifications}, payments: ${_this.payments}, unified: ${_this.unified})';
}


}

/// @nodoc
abstract mixin class $ConfigServicesModelCopyWith<$Res>  {
  factory $ConfigServicesModelCopyWith(ConfigServicesModel value, $Res Function(ConfigServicesModel) _then) = _$ConfigServicesModelCopyWithImpl;
@useResult
$Res call({
 String ai, String auth, String catalog, String chat, String commerce, String media, String notifications, String payments, String unified
});




}
/// @nodoc
class _$ConfigServicesModelCopyWithImpl<$Res>
    implements $ConfigServicesModelCopyWith<$Res> {
  _$ConfigServicesModelCopyWithImpl(this._self, this._then);

  final ConfigServicesModel _self;
  final $Res Function(ConfigServicesModel) _then;

/// Create a copy of ConfigServicesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ai = null,Object? auth = null,Object? catalog = null,Object? chat = null,Object? commerce = null,Object? media = null,Object? notifications = null,Object? payments = null,Object? unified = null,}) {
  return _then(ConfigServicesModel(
ai: null == ai ? _self.ai : ai // ignore: cast_nullable_to_non_nullable
as String,auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as String,catalog: null == catalog ? _self.catalog : catalog // ignore: cast_nullable_to_non_nullable
as String,chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as String,commerce: null == commerce ? _self.commerce : commerce // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as String,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as String,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as String,unified: null == unified ? _self.unified : unified // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfigServicesModel].
extension ConfigServicesModelPatterns on ConfigServicesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfigServicesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfigServicesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfigServicesModel value)  $default,){
final _that = this;
switch (_that) {
case _ConfigServicesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfigServicesModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConfigServicesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ai,  String auth,  String catalog,  String chat,  String commerce,  String media,  String notifications,  String payments,  String unified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfigServicesModel() when $default != null:
return $default(_that.ai,_that.auth,_that.catalog,_that.chat,_that.commerce,_that.media,_that.notifications,_that.payments,_that.unified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ai,  String auth,  String catalog,  String chat,  String commerce,  String media,  String notifications,  String payments,  String unified)  $default,) {final _that = this;
switch (_that) {
case _ConfigServicesModel():
return $default(_that.ai,_that.auth,_that.catalog,_that.chat,_that.commerce,_that.media,_that.notifications,_that.payments,_that.unified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ai,  String auth,  String catalog,  String chat,  String commerce,  String media,  String notifications,  String payments,  String unified)?  $default,) {final _that = this;
switch (_that) {
case _ConfigServicesModel() when $default != null:
return $default(_that.ai,_that.auth,_that.catalog,_that.chat,_that.commerce,_that.media,_that.notifications,_that.payments,_that.unified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfigServicesModel extends ConfigServicesModel {
  const _ConfigServicesModel({required this.ai, required this.auth, required this.catalog, required this.chat, required this.commerce, required this.media, required this.notifications, required this.payments, required this.unified}): super._();
  factory _ConfigServicesModel.fromJson(Map<String, dynamic> json) => _$ConfigServicesModelFromJson(json);

@override final  String ai;
@override final  String auth;
@override final  String catalog;
@override final  String chat;
@override final  String commerce;
@override final  String media;
@override final  String notifications;
@override final  String payments;
@override final  String unified;

/// Create a copy of ConfigServicesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfigServicesModelCopyWith<_ConfigServicesModel> get copyWith => __$ConfigServicesModelCopyWithImpl<_ConfigServicesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfigServicesModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfigServicesModel&&(identical(other.ai, ai) || other.ai == ai)&&(identical(other.auth, auth) || other.auth == auth)&&(identical(other.catalog, catalog) || other.catalog == catalog)&&(identical(other.chat, chat) || other.chat == chat)&&(identical(other.commerce, commerce) || other.commerce == commerce)&&(identical(other.media, media) || other.media == media)&&(identical(other.notifications, notifications) || other.notifications == notifications)&&(identical(other.payments, payments) || other.payments == payments)&&(identical(other.unified, unified) || other.unified == unified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,ai,auth,catalog,chat,commerce,media,notifications,payments,unified);
}

@override
String toString() {
    return 'ConfigServicesModel(ai: $ai, auth: $auth, catalog: $catalog, chat: $chat, commerce: $commerce, media: $media, notifications: $notifications, payments: $payments, unified: $unified)';
}


}

/// @nodoc
abstract mixin class _$ConfigServicesModelCopyWith<$Res> implements $ConfigServicesModelCopyWith<$Res> {
  factory _$ConfigServicesModelCopyWith(_ConfigServicesModel value, $Res Function(_ConfigServicesModel) _then) = __$ConfigServicesModelCopyWithImpl;
@override @useResult
$Res call({
 String ai, String auth, String catalog, String chat, String commerce, String media, String notifications, String payments, String unified
});




}
/// @nodoc
class __$ConfigServicesModelCopyWithImpl<$Res>
    implements _$ConfigServicesModelCopyWith<$Res> {
  __$ConfigServicesModelCopyWithImpl(this._self, this._then);

  final _ConfigServicesModel _self;
  final $Res Function(_ConfigServicesModel) _then;

/// Create a copy of ConfigServicesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ai = null,Object? auth = null,Object? catalog = null,Object? chat = null,Object? commerce = null,Object? media = null,Object? notifications = null,Object? payments = null,Object? unified = null,}) {
  return _then(_ConfigServicesModel(
ai: null == ai ? _self.ai : ai // ignore: cast_nullable_to_non_nullable
as String,auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as String,catalog: null == catalog ? _self.catalog : catalog // ignore: cast_nullable_to_non_nullable
as String,chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as String,commerce: null == commerce ? _self.commerce : commerce // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as String,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as String,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as String,unified: null == unified ? _self.unified : unified // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
