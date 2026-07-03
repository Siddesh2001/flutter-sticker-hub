abstract class AuthRepository {
  Future<void> signUp({required String email, required String password});

  Future<void> signIn({required String email, required String password});

  Future<void> signOut();

  Future<void> sendEmailVerification();

  Future<void> sendPasswordResetEmail({required String email});

  Stream<bool> authStateChanges();

  bool get isLoggedIn;
}
