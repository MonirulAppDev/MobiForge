import 'package:mobiforge/core/config/env_config.dart';
import 'package:mobiforge/main.dart';

/// Entry point for Production Flavor (`prod`).
///
/// Loads `.env.prod` and connects to live production backend.
void main() => bootstrap(flavor: AppFlavor.prod);
