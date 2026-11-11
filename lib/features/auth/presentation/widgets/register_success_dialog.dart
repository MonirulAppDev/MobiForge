import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:mobiforge/core/constants/app_colors.dart';
import 'package:mobiforge/features/auth/domain/entities/user_entity.dart';

/// Modal dialog displaying successful registration details.
class RegisterSuccessDialog extends StatelessWidget {
  final UserEntity user;
  final VoidCallback onDismiss;

  const RegisterSuccessDialog({
    super.key,
    required this.user,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64.r,
              height: 64.r,
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_outline,
                color: AppColors.success,
                size: 36.r,
              ),
            ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
            Gap(16.h),
            Text(
              'Account Created!',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Gap(6.h),
            Text(
              'Welcome, ${user.fullName}!\nYour account has been registered successfully.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.sp, color: AppColors.textSecondary),
            ),
            Gap(18.h),
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.surfaceLight),
              ),
              child: Column(
                children: [
                  _infoRow('User ID', '#${user.id}'),
                  Gap(6.h),
                  _infoRow('Email', user.email),
                  Gap(6.h),
                  _infoRow('Phone', user.phone),
                  Gap(6.h),
                  _infoRow('Role', user.role.name),
                  Gap(6.h),
                  _infoRow('Country', user.country),
                ],
              ),
            ),
            Gap(20.h),
            SizedBox(
              width: double.infinity,
              height: 46.h,
              child: ElevatedButton(
                onPressed: onDismiss,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: AppColors.textMuted),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
