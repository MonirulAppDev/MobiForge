import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobiforge/features/auth/data/models/role_model.dart';
import 'package:mobiforge/features/auth/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Data Transfer Object representing a user account.
@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required int id,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    required String email,
    required String phone,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'role_id') required int roleId,
    required RoleModel role,
    @JsonKey(name: 'is_active') required bool isActive,
    required String language,
    required String timezone,
    required String country,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity toEntity() => UserEntity(
        id: id,
        email: email,
        phone: phone,
        fullName: fullName,
        avatarUrl: avatarUrl,
        roleId: roleId,
        role: role.toEntity(),
        isActive: isActive,
        language: language,
        timezone: timezone,
        country: country,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        id: entity.id,
        email: entity.email,
        phone: entity.phone,
        fullName: entity.fullName,
        avatarUrl: entity.avatarUrl,
        roleId: entity.roleId,
        role: RoleModel.fromEntity(entity.role),
        isActive: entity.isActive,
        language: entity.language,
        timezone: entity.timezone,
        country: entity.country,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}
