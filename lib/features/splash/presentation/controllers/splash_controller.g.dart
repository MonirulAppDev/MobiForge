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

@ProviderFor(getMobileConfigUseCase)
final getMobileConfigUseCaseProvider = GetMobileConfigUseCaseProvider._();

/// Bridges the Domain UseCase from GetIt into Riverpod's provider tree.
///
/// Enables seamless mock overrides in widget and unit tests without touching GetIt.

final class GetMobileConfigUseCaseProvider
    extends
        $FunctionalProvider<
          GetMobileConfigUseCase,
          GetMobileConfigUseCase,
          GetMobileConfigUseCase
        >
    with $Provider<GetMobileConfigUseCase> {
  /// Bridges the Domain UseCase from GetIt into Riverpod's provider tree.
  ///
  /// Enables seamless mock overrides in widget and unit tests without touching GetIt.
  GetMobileConfigUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMobileConfigUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMobileConfigUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMobileConfigUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMobileConfigUseCase create(Ref ref) {
    return getMobileConfigUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMobileConfigUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMobileConfigUseCase>(value),
    );
  }
}

String _$getMobileConfigUseCaseHash() =>
    r'd4689e8e047ba2b4650b680c6d0ecce2cf8bc8ff';

/// Declarative Riverpod AsyncNotifier managing dynamic mobile configuration bootstrap.
///
/// Automatically provides an [AsyncValue<MobileConfigEntity>] with pattern-matching [.when()].

@ProviderFor(SplashController)
final splashControllerProvider = SplashControllerProvider._();

/// Declarative Riverpod AsyncNotifier managing dynamic mobile configuration bootstrap.
///
/// Automatically provides an [AsyncValue<MobileConfigEntity>] with pattern-matching [.when()].
final class SplashControllerProvider
    extends $AsyncNotifierProvider<SplashController, MobileConfigEntity> {
  /// Declarative Riverpod AsyncNotifier managing dynamic mobile configuration bootstrap.
  ///
  /// Automatically provides an [AsyncValue<MobileConfigEntity>] with pattern-matching [.when()].
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

String _$splashControllerHash() => r'be2412bcc440f052d52fd51b2060687577569314';

/// Declarative Riverpod AsyncNotifier managing dynamic mobile configuration bootstrap.
///
/// Automatically provides an [AsyncValue<MobileConfigEntity>] with pattern-matching [.when()].

abstract class _$SplashController extends $AsyncNotifier<MobileConfigEntity> {
  FutureOr<MobileConfigEntity> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<MobileConfigEntity>, MobileConfigEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MobileConfigEntity>, MobileConfigEntity>,
              AsyncValue<MobileConfigEntity>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
