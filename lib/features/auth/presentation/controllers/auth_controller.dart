import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/auth_repository.dart';
import '../providers/auth_providers.dart';

class AuthController extends AsyncNotifier<void> {
  late final AuthRepository _repository;

  @override
  void build() {
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

  Future<bool> checkEmailVerification() async {
    return await _repository.isEmailVerified();
  }

  Future<bool> isLoggedIn() async {
    return _repository.isLoggedIn;
  }

  Future<bool> signIn({required String email, required String password}) async {
    state = const AsyncLoading();

    try {
      await _repository.signIn(email: email, password: password);

      state = const AsyncData(null);

      return true;
    } on FirebaseAuthException catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      return false;
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      return false;
    }
  }
}
