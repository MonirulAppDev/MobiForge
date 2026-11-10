import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:mobiforge/core/di/injection_container.dart';
import 'package:mobiforge/features/splash/domain/entities/health_entity.dart';
import 'package:mobiforge/features/splash/domain/usecases/check_server_health_usecase.dart';

part 'splash_controller.g.dart';

/// Bridges the Domain UseCase from GetIt into Riverpod's provider tree.
///
/// Enables seamless mock overrides in widget and unit tests without touching GetIt.
@riverpod
CheckServerHealthUseCase checkServerHealthUseCase(Ref ref) {
  return sl<CheckServerHealthUseCase>();
}

/// Declarative Riverpod AsyncNotifier managing the backend server health verification.
///
/// Automatically provides an [AsyncValue<HealthEntity>] with pattern-matching [.when()].
@riverpod
class SplashController extends _$SplashController {
  @override
  FutureOr<HealthEntity> build() async {
    return _checkHealth();
  }

  Future<HealthEntity> _checkHealth() async {
    final useCase = ref.read(checkServerHealthUseCaseProvider);
    final result = await useCase();

    return result.fold(
      (failure) => throw failure,
      (health) => health,
    );
  }

  /// Re-triggers the health check with a fresh [AsyncLoading] state.
  Future<void> retry() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _checkHealth());
  }
}
