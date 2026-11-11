// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HealthModel _$HealthModelFromJson(Map<String, dynamic> json) => _HealthModel(
  app: json['app'] as String,
  environment: json['environment'] as String,
  status: json['status'] as String,
  time: json['time'] as String,
);

Map<String, dynamic> _$HealthModelToJson(_HealthModel instance) =>
    <String, dynamic>{
      'app': instance.app,
      'environment': instance.environment,
      'status': instance.status,
      'time': instance.time,
    };
