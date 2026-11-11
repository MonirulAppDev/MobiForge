import 'package:equatable/equatable.dart';

/// Pure Domain Entity representing a user role.
///
/// Follows Clean Architecture:
/// Pure business logic, zero UI dependencies, zero JSON serialization.
class RoleEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const RoleEntity({
    required this.id,
    required this.name,
    required this.description,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name, description, createdAt, updatedAt];
}
