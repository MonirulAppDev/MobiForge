// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterResponseModel _$RegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => _RegisterResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: UserModel.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : AuthMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterResponseModelToJson(
  _RegisterResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_AuthMetaModel _$AuthMetaModelFromJson(Map<String, dynamic> json) =>
    _AuthMetaModel(
      requestId: json['request_id'] as String?,
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$AuthMetaModelToJson(_AuthMetaModel instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'timestamp': instance.timestamp,
    };
