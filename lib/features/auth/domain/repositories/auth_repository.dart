import 'package:mobiforge/core/utils/typedefs.dart';
import 'package:mobiforge/features/auth/domain/entities/register_params.dart';
import 'package:mobiforge/features/auth/domain/entities/user_entity.dart';

/// Abstract Domain Repository contract for Authentication operations.
///
/// Follows Dependency Inversion Principle (DIP):
/// Domain layer defines the contract, Data layer provides the implementation.
abstract class AuthRepository {
  /// Registers a new user account with the remote backend.
  ResultFuture<UserEntity> register(RegisterParams params);
}
