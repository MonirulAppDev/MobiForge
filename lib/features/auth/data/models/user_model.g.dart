// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: (json['id'] as num).toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  email: json['email'] as String,
  phone: json['phone'] as String,
  fullName: json['full_name'] as String,
  avatarUrl: json['avatar_url'] as String?,
  roleId: (json['role_id'] as num).toInt(),
  role: RoleModel.fromJson(json['role'] as Map<String, dynamic>),
  isActive: json['is_active'] as bool,
  language: json['language'] as String,
  timezone: json['timezone'] as String,
  country: json['country'] as String,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'email': instance.email,
      'phone': instance.phone,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'role_id': instance.roleId,
      'role': instance.role,
      'is_active': instance.isActive,
      'language': instance.language,
      'timezone': instance.timezone,
      'country': instance.country,
    };
