import 'package:mobiforge/core/config/env_config.dart';
import 'package:mobiforge/main.dart';

/// Entry point for Staging Flavor (`staging`).
///
/// Loads `.env.staging` and connects to staging/QA backend.
void main() => bootstrap(flavor: AppFlavor.staging);
