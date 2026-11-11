// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HealthModel {

 String get app; String get environment; String get status; String get time;
/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthModelCopyWith<HealthModel> get copyWith => _$HealthModelCopyWithImpl<HealthModel>(this as HealthModel, _$identity);

  /// Serializes this HealthModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HealthModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthModel&&(identical(other.app, _this.app) || other.app == _this.app)&&(identical(other.environment, _this.environment) || other.environment == _this.environment)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.time, _this.time) || other.time == _this.time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HealthModel;
  return Object.hash(runtimeType,_this.app,_this.environment,_this.status,_this.time);
}

@override
String toString() {
  final _this = this as HealthModel;
  return 'HealthModel(app: ${_this.app}, environment: ${_this.environment}, status: ${_this.status}, time: ${_this.time})';
}


}

/// @nodoc
abstract mixin class $HealthModelCopyWith<$Res>  {
  factory $HealthModelCopyWith(HealthModel value, $Res Function(HealthModel) _then) = _$HealthModelCopyWithImpl;
@useResult
$Res call({
 String app, String environment, String status, String time
});




}
/// @nodoc
class _$HealthModelCopyWithImpl<$Res>
    implements $HealthModelCopyWith<$Res> {
  _$HealthModelCopyWithImpl(this._self, this._then);

  final HealthModel _self;
  final $Res Function(HealthModel) _then;

/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? app = null,Object? environment = null,Object? status = null,Object? time = null,}) {
  return _then(HealthModel(
app: null == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthModel].
extension HealthModelPatterns on HealthModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthModel value)  $default,){
final _that = this;
switch (_that) {
case _HealthModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthModel value)?  $default,){
final _that = this;
switch (_that) {
case _HealthModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String app,  String environment,  String status,  String time)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthModel() when $default != null:
return $default(_that.app,_that.environment,_that.status,_that.time);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String app,  String environment,  String status,  String time)  $default,) {final _that = this;
switch (_that) {
case _HealthModel():
return $default(_that.app,_that.environment,_that.status,_that.time);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String app,  String environment,  String status,  String time)?  $default,) {final _that = this;
switch (_that) {
case _HealthModel() when $default != null:
return $default(_that.app,_that.environment,_that.status,_that.time);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthModel extends HealthModel {
  const _HealthModel({required this.app, required this.environment, required this.status, required this.time}): super._();
  factory _HealthModel.fromJson(Map<String, dynamic> json) => _$HealthModelFromJson(json);

@override final  String app;
@override final  String environment;
@override final  String status;
@override final  String time;

/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthModelCopyWith<_HealthModel> get copyWith => __$HealthModelCopyWithImpl<_HealthModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthModel&&(identical(other.app, app) || other.app == app)&&(identical(other.environment, environment) || other.environment == environment)&&(identical(other.status, status) || other.status == status)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,app,environment,status,time);
}

@override
String toString() {
    return 'HealthModel(app: $app, environment: $environment, status: $status, time: $time)';
}


}

/// @nodoc
abstract mixin class _$HealthModelCopyWith<$Res> implements $HealthModelCopyWith<$Res> {
  factory _$HealthModelCopyWith(_HealthModel value, $Res Function(_HealthModel) _then) = __$HealthModelCopyWithImpl;
@override @useResult
$Res call({
 String app, String environment, String status, String time
});




}
/// @nodoc
class __$HealthModelCopyWithImpl<$Res>
    implements _$HealthModelCopyWith<$Res> {
  __$HealthModelCopyWithImpl(this._self, this._then);

  final _HealthModel _self;
  final $Res Function(_HealthModel) _then;

/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? app = null,Object? environment = null,Object? status = null,Object? time = null,}) {
  return _then(_HealthModel(
app: null == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
