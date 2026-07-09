// import 'package:create_sticker/features/home/presentation/pages/HomePage.dart';
import 'package:create_sticker/features/auth/presentation/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final controller = ref.read(authControllerProvider.notifier);

    final loggedIn = await controller.isLoggedIn();

    if (!mounted) return;

    if (!loggedIn) {
      context.go('/login');
      return;
    }

    final verified = await controller.checkEmailVerification();

    if (!mounted) return;

    if (verified) {
      context.go('/home');
    } else {
      context.go('/verify-email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: FlutterLogo(size: 120)));
  }
}
