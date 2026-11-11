import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobiforge/features/auth/domain/entities/role_entity.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

/// Data Transfer Object representing the user role.
@freezed
abstract class RoleModel with _$RoleModel {
  const RoleModel._();

  const factory RoleModel({
    required int id,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    required String name,
    required String description,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  RoleEntity toEntity() => RoleEntity(
        id: id,
        name: name,
        description: description,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  factory RoleModel.fromEntity(RoleEntity entity) => RoleModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}
