// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MobileConfigResponseModel _$MobileConfigResponseModelFromJson(
  Map<String, dynamic> json,
) => _MobileConfigResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: MobileConfigDataModel.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ConfigMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MobileConfigResponseModelToJson(
  _MobileConfigResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_ConfigMetaModel _$ConfigMetaModelFromJson(Map<String, dynamic> json) =>
    _ConfigMetaModel(
      requestId: json['request_id'] as String?,
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$ConfigMetaModelToJson(_ConfigMetaModel instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'timestamp': instance.timestamp,
    };

_MobileConfigDataModel _$MobileConfigDataModelFromJson(
  Map<String, dynamic> json,
) => _MobileConfigDataModel(
  apiVersion: json['api_version'] as String,
  environment: json['environment'] as String,
  forceUpdate: json['force_update'] as bool,
  latestAppVersion: json['latest_app_version'] as String,
  maintenanceMessage: json['maintenance_message'] as String,
  maintenanceMode: json['maintenance_mode'] as bool,
  minimumAppVersion: json['minimum_app_version'] as String,
  multiListener: json['multi_listener'] as bool,
  features: ConfigFeaturesModel.fromJson(
    json['features'] as Map<String, dynamic>,
  ),
  services: ConfigServicesModel.fromJson(
    json['services'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$MobileConfigDataModelToJson(
  _MobileConfigDataModel instance,
) => <String, dynamic>{
  'api_version': instance.apiVersion,
  'environment': instance.environment,
  'force_update': instance.forceUpdate,
  'latest_app_version': instance.latestAppVersion,
  'maintenance_message': instance.maintenanceMessage,
  'maintenance_mode': instance.maintenanceMode,
  'minimum_app_version': instance.minimumAppVersion,
  'multi_listener': instance.multiListener,
  'features': instance.features,
  'services': instance.services,
};

_ConfigFeaturesModel _$ConfigFeaturesModelFromJson(Map<String, dynamic> json) =>
    _ConfigFeaturesModel(
      mockAiEnabled: json['mock_ai_enabled'] as bool,
      mockOtpEnabled: json['mock_otp_enabled'] as bool,
      mockPaymentEnabled: json['mock_payment_enabled'] as bool,
      testingToolkit: json['testing_toolkit'] as bool,
    );

Map<String, dynamic> _$ConfigFeaturesModelToJson(
  _ConfigFeaturesModel instance,
) => <String, dynamic>{
  'mock_ai_enabled': instance.mockAiEnabled,
  'mock_otp_enabled': instance.mockOtpEnabled,
  'mock_payment_enabled': instance.mockPaymentEnabled,
  'testing_toolkit': instance.testingToolkit,
};

_ConfigServicesModel _$ConfigServicesModelFromJson(Map<String, dynamic> json) =>
    _ConfigServicesModel(
      ai: json['ai'] as String,
      auth: json['auth'] as String,
      catalog: json['catalog'] as String,
      chat: json['chat'] as String,
      commerce: json['commerce'] as String,
      media: json['media'] as String,
      notifications: json['notifications'] as String,
      payments: json['payments'] as String,
      unified: json['unified'] as String,
    );

Map<String, dynamic> _$ConfigServicesModelToJson(
  _ConfigServicesModel instance,
) => <String, dynamic>{
  'ai': instance.ai,
  'auth': instance.auth,
  'catalog': instance.catalog,
  'chat': instance.chat,
  'commerce': instance.commerce,
  'media': instance.media,
  'notifications': instance.notifications,
  'payments': instance.payments,
  'unified': instance.unified,
};
