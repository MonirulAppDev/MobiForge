import 'package:mobiforge/core/config/env_config.dart';
import 'package:mobiforge/main.dart';

/// Entry point for Development Flavor (`dev`).
///
/// Loads `.env.dev` and connects to local/development backend.
void main() => bootstrap(flavor: AppFlavor.dev);
