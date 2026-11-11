import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:mobiforge/core/constants/app_colors.dart';
import 'package:mobiforge/core/constants/app_constants.dart';
import 'package:mobiforge/core/logging/app_talker.dart';
import 'package:mobiforge/features/splash/presentation/controllers/splash_controller.dart';
import 'package:mobiforge/features/splash/presentation/widgets/splash_brand_header.dart';
import 'package:mobiforge/features/splash/presentation/widgets/splash_error_view.dart';
import 'package:mobiforge/features/splash/presentation/widgets/splash_loading_view.dart';
import 'package:mobiforge/features/splash/presentation/widgets/splash_success_view.dart';

/// Full-screen Splash View handling remote bootstrap configuration.
///
/// Follows Clean Architecture & SOLID (SRP):
/// - Delegated atomic brand rendering to [SplashBrandHeader].
/// - Pure build method returning declarative widget tree.
/// - Zero technical metadata clutter (app, env, status tags).
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen for bootstrap resolution and trigger navigation side-effect
    ref.listen(splashControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (config) {
          AppTalker.instance.info(
            'Mobile Config Loaded: env=${config.environment}, apiVersion=${config.apiVersion}',
          );
          if (config.isOperational) {
            Future.delayed(AppConstants.splashDelay, () {
              if (context.mounted) {
                context.go('/register');
              }
            });
          }
        },
        error: (error, _) {
          AppTalker.instance.error('Mobile Config Bootstrap Failed: $error');
        },
      );
    });

    final configState = ref.watch(splashControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const Spacer(flex: 3),

              // Brand Icon & Identity (Isolated Atomic Widget)
              const SplashBrandHeader(),

              const Spacer(flex: 2),

              // Declarative Pattern-Matched State Rendering
              configState.when(
                data: (config) => SplashSuccessView(config: config),
                loading: () => const SplashLoadingView(),
                error: (error, _) => SplashErrorView(
                  error: error,
                  onRetry: () =>
                      ref.read(splashControllerProvider.notifier).retry(),
                ),
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
