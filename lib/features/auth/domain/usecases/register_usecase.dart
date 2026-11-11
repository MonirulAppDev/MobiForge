import 'package:mobiforge/core/usecase/usecase.dart';
import 'package:mobiforge/core/utils/typedefs.dart';
import 'package:mobiforge/features/auth/domain/entities/register_params.dart';
import 'package:mobiforge/features/auth/domain/entities/user_entity.dart';
import 'package:mobiforge/features/auth/domain/repositories/auth_repository.dart';

/// Encapsulates the business logic for user registration.
///
/// Follows Single Responsibility Principle (SRP):
/// Exactly one use case per discrete business operation.
class RegisterUseCase extends UseCaseWithParams<UserEntity, RegisterParams> {
  final AuthRepository repository;

  const RegisterUseCase(this.repository);

  @override
  ResultFuture<UserEntity> call(RegisterParams params) => repository.register(params);
}
