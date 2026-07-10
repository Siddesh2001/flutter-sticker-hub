import 'package:create_sticker/features/auth/domain/entities/appUser.dart';
import 'package:create_sticker/features/auth/presentation/providers/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends AsyncNotifier<appuser?> {
  @override
  Future<appuser?> build() async {
    final repository = ref.read(authRepositoryProvider);
    return repository.getCurrentUser();
  }

  Future<void> refreshUser() async {
    final repository = ref.read(authRepositoryProvider);

    state = AsyncData(repository.getCurrentUser());
  }

  Future<void> signOut() async {
    final repository = ref.read(authRepositoryProvider);

    await repository.signOut();

    state = const AsyncData(null);
  }
}
