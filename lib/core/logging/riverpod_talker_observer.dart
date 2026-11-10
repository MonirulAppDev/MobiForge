import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_talker.dart';

/// Riverpod Observer integrating state transitions into centralized [AppTalker].
base class AppRiverpodObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    AppTalker.instance.debug(
      '[Riverpod] ${context.provider.name ?? context.provider.runtimeType} -> $newValue',
    );
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    AppTalker.instance.error(
      '[Riverpod Error] ${context.provider.name ?? context.provider.runtimeType} failed: $error',
      error,
      stackTrace,
    );
  }
}
