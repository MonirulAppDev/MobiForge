import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobiforge/features/splash/domain/entities/health_entity.dart';

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

  factory HealthModel.fromJson(Map<String, dynamic> json) =>
      _$HealthModelFromJson(json);

  factory HealthModel.fromEntity(HealthEntity entity) => HealthModel(
        app: entity.app,
        environment: entity.environment,
        status: entity.status,
        time: entity.time,
      );

  HealthEntity toEntity() => HealthEntity(
        app: app,
        environment: environment,
        status: status,
        time: time,
      );
}
