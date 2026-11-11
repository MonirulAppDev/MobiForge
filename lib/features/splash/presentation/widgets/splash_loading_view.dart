import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobiforge/core/constants/app_colors.dart';

/// Minimal, elegant loader displayed during app bootstrap.
///
/// Follows Clean Architecture & Production Minimalism:
/// Eliminates cluttered status text, providing a smooth, high-fidelity spinner.
class SplashLoadingView extends StatelessWidget {
  const SplashLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28.r,
      height: 28.r,
      child: const CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
      ),
    );
  }
}
