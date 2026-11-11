import 'package:equatable/equatable.dart';
import 'package:mobiforge/features/auth/domain/entities/role_entity.dart';

/// Pure Domain Entity representing a registered user account.
///
/// Follows Clean Architecture:
/// Free from external serialization and presentation libraries.
class UserEntity extends Equatable {
  final int id;
  final String email;
  final String phone;
  final String fullName;
  final String? avatarUrl;
  final int roleId;
  final RoleEntity role;
  final bool isActive;
  final String language;
  final String timezone;
  final String country;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserEntity({
    required this.id,
    required this.email,
    required this.phone,
    required this.fullName,
    this.avatarUrl,
    required this.roleId,
    required this.role,
    required this.isActive,
    required this.language,
    required this.timezone,
    required this.country,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        phone,
        fullName,
        avatarUrl,
        roleId,
        role,
        isActive,
        language,
        timezone,
        country,
        createdAt,
        updatedAt,
      ];
}
