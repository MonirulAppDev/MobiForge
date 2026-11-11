import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:mobiforge/core/constants/app_colors.dart';

/// Clean header section for registration screen.
class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Icon(
                Icons.person_add_alt_1_outlined,
                color: AppColors.primaryLight,
                size: 26.r,
              ),
            ),
            Gap(12.w),
            Text(
              'Join MobiForge',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryLight,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.1, end: 0),
        Gap(16.h),
        Text(
          'Create Your Account',
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            letterSpacing: -0.5,
          ),
        ).animate().fadeIn(delay: 100.ms, duration: 400.ms),
        Gap(6.h),
        Text(
          'Enter your details to create an enterprise-grade mobile shopper profile.',
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.textSecondary,
            height: 1.4,
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
      ],
    );
  }
}
