import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:mobiforge/core/config/app_config_manager.dart';
import 'package:mobiforge/core/di/injection_container.dart';
import 'package:mobiforge/features/splash/domain/entities/mobile_config_entity.dart';
import 'package:mobiforge/features/splash/domain/usecases/get_mobile_config_usecase.dart';

part 'splash_controller.g.dart';

/// Bridges the Domain UseCase from GetIt into Riverpod's provider tree.
///
/// Enables seamless mock overrides in widget and unit tests without touching GetIt.
@riverpod
GetMobileConfigUseCase getMobileConfigUseCase(Ref ref) {
  return sl<GetMobileConfigUseCase>();
}

/// Declarative Riverpod AsyncNotifier managing dynamic mobile configuration bootstrap.
///
/// Automatically provides an [AsyncValue<MobileConfigEntity>] with pattern-matching [.when()].
@riverpod
class SplashController extends _$SplashController {
  @override
  FutureOr<MobileConfigEntity> build() async {
    return _fetchConfig();
  }

  Future<MobileConfigEntity> _fetchConfig() async {
    final useCase = ref.read(getMobileConfigUseCaseProvider);
    final result = await useCase();

    return result.fold(
      (failure) => throw failure,
      (config) {
        // Cache loaded config into centralized AppConfigManager for downstream features
        AppConfigManager.instance.updateConfig(config);
        return config;
      },
    );
  }

  /// Re-triggers the configuration fetch with a fresh [AsyncLoading] state.
  Future<void> retry() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchConfig());
  }
}
