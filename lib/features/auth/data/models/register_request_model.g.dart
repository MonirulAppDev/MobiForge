// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterRequestModel _$RegisterRequestModelFromJson(
  Map<String, dynamic> json,
) => _RegisterRequestModel(
  email: json['email'] as String,
  password: json['password'] as String,
  fullName: json['full_name'] as String,
  phone: json['phone'] as String,
);

Map<String, dynamic> _$RegisterRequestModelToJson(
  _RegisterRequestModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'full_name': instance.fullName,
  'phone': instance.phone,
};
