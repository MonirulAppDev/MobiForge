import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:mobiforge/core/constants/app_colors.dart';
import 'package:mobiforge/features/splash/domain/entities/mobile_config_entity.dart';
import 'package:mobiforge/features/splash/presentation/widgets/splash_loading_view.dart';

/// Minimal, executive-grade representation of the bootstrap success state.
///
/// Follows User Directive:
/// Eliminates cluttered response dumps, status badges, app/env/status tags.
/// Seamlessly continues spinner transition when operational, or gates behind
/// Maintenance / Force Update if mandated by backend.
class SplashSuccessView extends StatelessWidget {
  final MobileConfigEntity config;

  const SplashSuccessView({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    if (config.maintenanceMode) {
      return _buildMaintenanceCard();
    }

    if (config.forceUpdate) {
      return _buildForceUpdateCard();
    }

    // Fully operational: keep smooth minimal loader during transition
    return const SplashLoadingView();
  }

  /// Clean Maintenance mode gatekeeper
  Widget _buildMaintenanceCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.engineering_rounded, size: 40.r, color: AppColors.warning),
          Gap(12.h),
          Text(
            'System Maintenance',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          Gap(8.h),
          Text(
            config.maintenanceMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1, end: 0);
  }

  /// Force Update mandated card
  Widget _buildForceUpdateCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.system_update_rounded,
            size: 40.r,
            color: AppColors.primary,
          ),
          Gap(12.h),
          Text(
            'Update Required',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          Gap(8.h),
          Text(
            'Please update to version ${config.latestAppVersion} to continue using MobiForge.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.sp, color: AppColors.textSecondary),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }
}
