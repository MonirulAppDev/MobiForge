import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:mobiforge/core/constants/app_colors.dart';
import 'package:mobiforge/core/errors/failures.dart';
import 'package:mobiforge/features/auth/presentation/controllers/register_controller.dart';
import 'package:mobiforge/features/auth/presentation/widgets/register_footer.dart';
import 'package:mobiforge/features/auth/presentation/widgets/register_form.dart';
import 'package:mobiforge/features/auth/presentation/widgets/register_header.dart';
import 'package:mobiforge/features/auth/presentation/widgets/register_success_dialog.dart';

/// Full-screen registration view for new shoppers.
class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (user) {
          if (user != null) {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => RegisterSuccessDialog(
                user: user,
                onDismiss: () {
                  Navigator.of(ctx).pop();
                  ref.read(registerControllerProvider.notifier).reset();
                },
              ),
            );
          }
        },
        error: (error, _) {
          final message = error is Failure ? error.message : error.toString();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.error_outline, color: Colors.white, size: 20),
                  Gap(10.w),
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(fontSize: 13.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
              backgroundColor: AppColors.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          );
        },
      );
    });

    final registerState = ref.watch(registerControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const RegisterHeader(),
              Gap(28.h),
              RegisterForm(
                isLoading: registerState.isLoading,
                onSubmit: ({
                  required fullName,
                  required email,
                  required phone,
                  required password,
                }) {
                  ref.read(registerControllerProvider.notifier).register(
                        fullName: fullName,
                        email: email,
                        phone: phone,
                        password: password,
                      );
                },
              ),
              Gap(24.h),
              const RegisterFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
