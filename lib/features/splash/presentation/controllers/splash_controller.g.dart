// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bridges the Domain UseCase from GetIt into Riverpod's provider tree.
///
/// Enables seamless mock overrides in widget and unit tests without touching GetIt.

@ProviderFor(checkServerHealthUseCase)
final checkServerHealthUseCaseProvider = CheckServerHealthUseCaseProvider._();

/// Bridges the Domain UseCase from GetIt into Riverpod's provider tree.
///
/// Enables seamless mock overrides in widget and unit tests without touching GetIt.

final class CheckServerHealthUseCaseProvider
    extends
        $FunctionalProvider<
          CheckServerHealthUseCase,
          CheckServerHealthUseCase,
          CheckServerHealthUseCase
        >
    with $Provider<CheckServerHealthUseCase> {
  /// Bridges the Domain UseCase from GetIt into Riverpod's provider tree.
  ///
  /// Enables seamless mock overrides in widget and unit tests without touching GetIt.
  CheckServerHealthUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkServerHealthUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkServerHealthUseCaseHash();

  @$internal
  @override
  $ProviderElement<CheckServerHealthUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CheckServerHealthUseCase create(Ref ref) {
    return checkServerHealthUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckServerHealthUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckServerHealthUseCase>(value),
    );
  }
}

String _$checkServerHealthUseCaseHash() =>
    r'aba67fd3af7bc0d195fb607f0e8d558ea82a949b';

/// Declarative Riverpod AsyncNotifier managing the backend server health verification.
///
/// Automatically provides an [AsyncValue<HealthEntity>] with pattern-matching [.when()].

@ProviderFor(SplashController)
final splashControllerProvider = SplashControllerProvider._();

/// Declarative Riverpod AsyncNotifier managing the backend server health verification.
///
/// Automatically provides an [AsyncValue<HealthEntity>] with pattern-matching [.when()].
final class SplashControllerProvider
    extends $AsyncNotifierProvider<SplashController, HealthEntity> {
  /// Declarative Riverpod AsyncNotifier managing the backend server health verification.
  ///
  /// Automatically provides an [AsyncValue<HealthEntity>] with pattern-matching [.when()].
  SplashControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashControllerHash();

  @$internal
  @override
  SplashController create() => SplashController();
}

String _$splashControllerHash() => r'0d6ecc1b8b12920b33ed2e6cde436169ef4bb6c6';

/// Declarative Riverpod AsyncNotifier managing the backend server health verification.
///
/// Automatically provides an [AsyncValue<HealthEntity>] with pattern-matching [.when()].

abstract class _$SplashController extends $AsyncNotifier<HealthEntity> {
  FutureOr<HealthEntity> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HealthEntity>, HealthEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HealthEntity>, HealthEntity>,
              AsyncValue<HealthEntity>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
