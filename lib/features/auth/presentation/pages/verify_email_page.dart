import 'package:create_sticker/features/auth/presentation/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailPage extends ConsumerWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mark_email_unread_outlined, size: 100),

            const SizedBox(height: 24),

            const Text(
              'Verify your email',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            const Text(
              'We have sent a verification email to your registered email address.\n\n'
              'Please verify your email before continuing.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            FilledButton(
              onPressed: () async {
                final verified = await ref
                    .read(authControllerProvider.notifier)
                    .checkEmailVerification();

                if (!context.mounted) return;

                if (verified) {
                  context.go('/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Your email is not verified yet.'),
                    ),
                  );
                }
              },
              child: const Text("I've Verified My Email"),
            ),

            const SizedBox(height: 12),

            TextButton(
              onPressed: () {
                // Resend verification email
              },
              child: const Text("Resend Email"),
            ),
          ],
        ),
      ),
    );
  }
}
