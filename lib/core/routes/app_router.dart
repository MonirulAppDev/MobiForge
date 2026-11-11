import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:mobiforge/features/auth/presentation/screens/register_screen.dart';
import 'package:mobiforge/features/splash/presentation/screens/splash_screen.dart';

/// Centralized application routing declarations via GoRouter.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (BuildContext context, GoRouterState state) =>
          const RegisterScreen(),
    ),
  ],
);
