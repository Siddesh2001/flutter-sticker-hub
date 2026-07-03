import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/auth_repository.dart';
import 'auth_providers.dart';

class AuthController extends AsyncNotifier<void> {
  late final AuthRepository _repository;

  @override
  Future<void> build() async {
    _repository = ref.read(authRepositoryProvider);
  }

  Future<bool> signUp({required String email, required String password}) async {
    state = const AsyncLoading();

    try {
      await _repository.signUp(email: email, password: password);

      await _repository.sendEmailVerification();

      state = const AsyncData(null);

      return true;
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      return false;
    }
  }
}
