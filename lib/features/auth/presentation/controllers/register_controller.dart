import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:mobiforge/core/di/injection_container.dart';
import 'package:mobiforge/features/auth/domain/entities/register_params.dart';
import 'package:mobiforge/features/auth/domain/entities/user_entity.dart';
import 'package:mobiforge/features/auth/domain/usecases/register_usecase.dart';

part 'register_controller.g.dart';

/// Bridges the Domain UseCase from GetIt into Riverpod's provider graph.
@riverpod
RegisterUseCase registerUseCase(Ref ref) {
  return sl<RegisterUseCase>();
}

/// Declarative Riverpod AsyncNotifier managing the user registration flow.
@riverpod
class RegisterController extends _$RegisterController {
  @override
  FutureOr<UserEntity?> build() {
    return null; // Idle initial state
  }

  /// Executes user registration with input parameters.
  Future<bool> register({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    state = const AsyncLoading();

    final useCase = ref.read(registerUseCaseProvider);
    final params = RegisterParams(
      email: email.trim(),
      password: password,
      fullName: fullName.trim(),
      phone: phone.trim(),
    );

    final result = await useCase(params);

    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (user) {
        state = AsyncData(user);
        return true;
      },
    );
  }

  /// Resets state back to idle.
  void reset() {
    state = const AsyncData(null);
  }
}
