import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:mobiforge/core/constants/app_colors.dart';
import 'package:mobiforge/core/constants/app_constants.dart';

/// Atomic Brand Identity component for Splash Screen.
///
/// Follows Single Responsibility Principle (SRP):
/// Encapsulates brand icon, typography, and entry animations in an isolated,
/// reusable widget rather than polluting the parent screen's build method.
class SplashBrandHeader extends StatelessWidget {
  const SplashBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 84.r,
          height: 84.r,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(22.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.35),
                blurRadius: 28,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Icon(
            Icons.shopping_bag_outlined,
            size: 42.r,
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
}
