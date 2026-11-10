import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/health_entity.dart';

part 'health_model.freezed.dart';
part 'health_model.g.dart';

/// Immutable Data Transfer Object (DTO) generated via Freezed & JsonSerializable.
@freezed
abstract class HealthModel with _$HealthModel {
  const HealthModel._();

  const factory HealthModel({
    required String app,
    required String environment,
    required String status,
    required String time,
  }) = _HealthModel;

  /// Factory constructor for deserialization from JSON Map
  factory HealthModel.fromJson(Map<String, dynamic> json) =>
      _$HealthModelFromJson(json);

  /// Bidirectional Mapper: Converts a pure Domain [HealthEntity] into [HealthModel]
  factory HealthModel.fromEntity(HealthEntity entity) => HealthModel(
        app: entity.app,
        environment: entity.environment,
        status: entity.status,
        time: entity.time,
      );

  /// Domain Mapper: Converts Data DTO into pure [HealthEntity]
  HealthEntity toEntity() => HealthEntity(
        app: app,
        environment: environment,
        status: status,
        time: time,
      );
}
