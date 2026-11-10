import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart';

/// Central Service Locator instance (GetIt)
final sl = GetIt.instance;

/// Configures and wires the entire dependency injection graph at application startup.
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: true,
)
Future<void> configureDependencies() async => sl.init();
