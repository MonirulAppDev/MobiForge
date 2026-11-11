import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobiforge/core/config/env_config.dart';
import 'package:mobiforge/core/constants/app_colors.dart';
import 'package:mobiforge/core/constants/app_constants.dart';
import 'package:mobiforge/core/di/injection_container.dart';
import 'package:mobiforge/core/logging/riverpod_talker_observer.dart';
import 'package:mobiforge/core/routes/app_router.dart';
import 'package:mobiforge/core/theme/app_theme.dart';

/// Centralized application bootstrap routine parameterized by [AppFlavor].
Future<void> bootstrap({required AppFlavor flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Configure System UI Overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.background,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  // 2. Load Flavor-specific Environment Variables (Fail-Fast)
  await EnvConfig.init(flavor: flavor);

  // 3. Configure Compile-Time Dependency Injection
  await configureDependencies();

  // 4. Run Application with Riverpod Scope and Talker Diagnostics
  runApp(
    ProviderScope(
      observers: [AppRiverpodObserver()],
      child: const MobiForgeApp(),
    ),
  );
}

/// Default entry point runs the development flavor.
void main() => bootstrap(flavor: AppFlavor.dev);

class MobiForgeApp extends StatelessWidget {
  const MobiForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final titleSuffix = EnvConfig.isDev
        ? ' (Dev)'
        : EnvConfig.isStaging
            ? ' (Staging)'
            : '';

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: '${AppConstants.appName}$titleSuffix',
          debugShowCheckedModeBanner: EnvConfig.isDev,
          routerConfig: appRouter,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
        );
      },
    );
  }
}
