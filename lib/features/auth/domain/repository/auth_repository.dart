import 'package:create_sticker/features/auth/domain/entities/appUser.dart';

abstract class AuthRepository {
  appuser? getCurrentUser();

  Future<void> signUp({required String email, required String password});

  Future<void> signIn({required String email, required String password});

  Future<void> signOut();

  Future<void> sendEmailVerification();

  Future<void> sendPasswordResetEmail({required String email});

  Future<bool> isEmailVerified();

  Future<void> reloadUser();

  Stream<bool> authStateChanges();

  bool get isLoggedIn;
}
