// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bridges the Domain UseCase from GetIt into Riverpod's provider graph.

@ProviderFor(registerUseCase)
final registerUseCaseProvider = RegisterUseCaseProvider._();

/// Bridges the Domain UseCase from GetIt into Riverpod's provider graph.

final class RegisterUseCaseProvider
    extends
        $FunctionalProvider<RegisterUseCase, RegisterUseCase, RegisterUseCase>
    with $Provider<RegisterUseCase> {
  /// Bridges the Domain UseCase from GetIt into Riverpod's provider graph.
  RegisterUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerUseCaseHash();

  @$internal
  @override
  $ProviderElement<RegisterUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RegisterUseCase create(Ref ref) {
    return registerUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterUseCase>(value),
    );
  }
}

String _$registerUseCaseHash() => r'97ce81503f4d33ddc93cab30d70b3e1828a9cc7e';

/// Declarative Riverpod AsyncNotifier managing the user registration flow.

@ProviderFor(RegisterController)
final registerControllerProvider = RegisterControllerProvider._();

/// Declarative Riverpod AsyncNotifier managing the user registration flow.
final class RegisterControllerProvider
    extends $AsyncNotifierProvider<RegisterController, UserEntity?> {
  /// Declarative Riverpod AsyncNotifier managing the user registration flow.
  RegisterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerControllerHash();

  @$internal
  @override
  RegisterController create() => RegisterController();
}

String _$registerControllerHash() =>
    r'7b91daf94dd078eacda7a771511665aa8c2e6ac4';

/// Declarative Riverpod AsyncNotifier managing the user registration flow.

abstract class _$RegisterController extends $AsyncNotifier<UserEntity?> {
  FutureOr<UserEntity?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserEntity?>, UserEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserEntity?>, UserEntity?>,
              AsyncValue<UserEntity?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
