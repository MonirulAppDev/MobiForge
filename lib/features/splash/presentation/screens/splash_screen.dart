import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:mobiforge/core/constants/app_colors.dart';
import 'package:mobiforge/core/constants/app_constants.dart';
import 'package:mobiforge/core/logging/app_talker.dart';
import 'package:mobiforge/features/splash/presentation/controllers/splash_controller.dart';
import 'package:mobiforge/features/splash/presentation/widgets/splash_error_view.dart';
import 'package:mobiforge/features/splash/presentation/widgets/splash_loading_view.dart';
import 'package:mobiforge/features/splash/presentation/widgets/splash_success_view.dart';

/// Full-screen Splash View handling remote bootstrap configuration.
///
/// Follows Clean Architecture:
/// Listens to [SplashController] and renders declarative states via [.when()].
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Listen for telemetry & routing side-effects
    ref.listen(splashControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (config) {
          AppTalker.instance.info(
            'Mobile Config Loaded: env=${config.environment}, apiVersion=${config.apiVersion}',
          );
        },
        error: (error, _) {
          AppTalker.instance.error('Mobile Config Bootstrap Failed: $error');
        },
      );
    });

    // 2. Watch active state
    final configState = ref.watch(splashControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const Spacer(flex: 3),

              // Brand Icon & Identity
              _buildBrandHeader(),

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

              // Footer Metadata
              _buildFooter(),
              Gap(16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80.r,
          height: 80.r,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.35),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Icon(
            Icons.shopping_bag_outlined,
            size: 40.r,
            color: Colors.white,
          ),
        )
            .animate()
            .scale(duration: 600.ms, curve: Curves.easeOutBack)
            .fadeIn(duration: 500.ms),
        Gap(20.h),
        Text(
          AppConstants.appName,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            letterSpacing: 0.5,
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 500.ms),
        Gap(6.h),
        Text(
          AppConstants.appTagline,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.textSecondary,
            letterSpacing: 0.2,
          ),
        ).animate().fadeIn(delay: 350.ms, duration: 500.ms),
      ],
    );
  }

  Widget _buildFooter() {
    return Text(
      'MobiForge Core v1.0.0 • Clean Architecture',
      style: TextStyle(
        fontSize: 11.sp,
        color: AppColors.textMuted,
        letterSpacing: 0.2,
      ),
    );
  }
}
