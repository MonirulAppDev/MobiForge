import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobiforge/features/splash/domain/entities/mobile_config_entity.dart';

part 'mobile_config_model.freezed.dart';
part 'mobile_config_model.g.dart';

/// Top-level API response envelope for `/mobile/config`.
@freezed
abstract class MobileConfigResponseModel with _$MobileConfigResponseModel {
  const factory MobileConfigResponseModel({
    required bool success,
    required String message,
    required MobileConfigDataModel data,
    ConfigMetaModel? meta,
  }) = _MobileConfigResponseModel;

  factory MobileConfigResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MobileConfigResponseModelFromJson(json);
}

/// Metadata payload containing tracking and timestamp details.
@freezed
abstract class ConfigMetaModel with _$ConfigMetaModel {
  const factory ConfigMetaModel({
    @JsonKey(name: 'request_id') String? requestId,
    String? timestamp,
  }) = _ConfigMetaModel;

  factory ConfigMetaModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigMetaModelFromJson(json);
}

/// Dynamic mobile configuration data payload.
@freezed
abstract class MobileConfigDataModel with _$MobileConfigDataModel {
  const MobileConfigDataModel._();

  const factory MobileConfigDataModel({
    @JsonKey(name: 'api_version') required String apiVersion,
    required String environment,
    @JsonKey(name: 'force_update') required bool forceUpdate,
    @JsonKey(name: 'latest_app_version') required String latestAppVersion,
    @JsonKey(name: 'maintenance_message') required String maintenanceMessage,
    @JsonKey(name: 'maintenance_mode') required bool maintenanceMode,
    @JsonKey(name: 'minimum_app_version') required String minimumAppVersion,
    @JsonKey(name: 'multi_listener') required bool multiListener,
    required ConfigFeaturesModel features,
    required ConfigServicesModel services,
  }) = _MobileConfigDataModel;

  factory MobileConfigDataModel.fromJson(Map<String, dynamic> json) =>
      _$MobileConfigDataModelFromJson(json);

  /// Converts this DTO to pure Domain Entity
  MobileConfigEntity toEntity() => MobileConfigEntity(
        apiVersion: apiVersion,
        environment: environment,
        forceUpdate: forceUpdate,
        latestAppVersion: latestAppVersion,
        minimumAppVersion: minimumAppVersion,
        maintenanceMode: maintenanceMode,
        maintenanceMessage: maintenanceMessage,
        multiListener: multiListener,
        features: features.toEntity(),
        services: services.toEntity(),
      );

  /// Converts pure Domain Entity back to Data DTO
  factory MobileConfigDataModel.fromEntity(MobileConfigEntity entity) =>
      MobileConfigDataModel(
        apiVersion: entity.apiVersion,
        environment: entity.environment,
        forceUpdate: entity.forceUpdate,
        latestAppVersion: entity.latestAppVersion,
        minimumAppVersion: entity.minimumAppVersion,
        maintenanceMode: entity.maintenanceMode,
        maintenanceMessage: entity.maintenanceMessage,
        multiListener: entity.multiListener,
        features: ConfigFeaturesModel.fromEntity(entity.features),
        services: ConfigServicesModel.fromEntity(entity.services),
      );
}

/// Feature flags sub-model
@freezed
abstract class ConfigFeaturesModel with _$ConfigFeaturesModel {
  const ConfigFeaturesModel._();

  const factory ConfigFeaturesModel({
    @JsonKey(name: 'mock_ai_enabled') required bool mockAiEnabled,
    @JsonKey(name: 'mock_otp_enabled') required bool mockOtpEnabled,
    @JsonKey(name: 'mock_payment_enabled') required bool mockPaymentEnabled,
    @JsonKey(name: 'testing_toolkit') required bool testingToolkit,
  }) = _ConfigFeaturesModel;

  factory ConfigFeaturesModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigFeaturesModelFromJson(json);

  ConfigFeaturesEntity toEntity() => ConfigFeaturesEntity(
        mockAiEnabled: mockAiEnabled,
        mockOtpEnabled: mockOtpEnabled,
        mockPaymentEnabled: mockPaymentEnabled,
        testingToolkit: testingToolkit,
      );

  factory ConfigFeaturesModel.fromEntity(ConfigFeaturesEntity entity) =>
      ConfigFeaturesModel(
        mockAiEnabled: entity.mockAiEnabled,
        mockOtpEnabled: entity.mockOtpEnabled,
        mockPaymentEnabled: entity.mockPaymentEnabled,
        testingToolkit: entity.testingToolkit,
      );
}

/// Service endpoints sub-model
@freezed
abstract class ConfigServicesModel with _$ConfigServicesModel {
  const ConfigServicesModel._();

  const factory ConfigServicesModel({
    required String ai,
    required String auth,
    required String catalog,
    required String chat,
    required String commerce,
    required String media,
    required String notifications,
    required String payments,
    required String unified,
  }) = _ConfigServicesModel;

  factory ConfigServicesModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigServicesModelFromJson(json);

  ConfigServicesEntity toEntity() => ConfigServicesEntity(
        ai: ai,
        auth: auth,
        catalog: catalog,
        chat: chat,
        commerce: commerce,
        media: media,
        notifications: notifications,
        payments: payments,
        unified: unified,
      );

  factory ConfigServicesModel.fromEntity(ConfigServicesEntity entity) =>
      ConfigServicesModel(
        ai: entity.ai,
        auth: entity.auth,
        catalog: entity.catalog,
        chat: entity.chat,
        commerce: entity.commerce,
        media: entity.media,
        notifications: entity.notifications,
        payments: entity.payments,
        unified: entity.unified,
      );
}
