import 'package:create_sticker/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:create_sticker/features/auth/presentation/pages/login_page.dart';
import 'package:create_sticker/features/auth/presentation/pages/verify_email_page.dart';
import 'package:create_sticker/features/home/presentation/pages/HomePage.dart';
import 'package:create_sticker/features/home/presentation/pages/signUp.dart';
import 'package:create_sticker/features/home/presentation/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashPage()),

    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),

    GoRoute(path: '/signup', builder: (context, state) => const SignupPage()),

    GoRoute(
      path: '/verify-email',
      builder: (context, state) => const VerifyEmailPage(),
    ),

    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordPage(),
    ),

    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  ],

  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
);
