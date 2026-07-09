import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseAuth firebaseAuth;
  AuthRemoteDataSource({required this.firebaseAuth});

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) {
    return firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) {
    return firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    return firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    await firebaseAuth.currentUser?.sendEmailVerification();
  }

  Future<void> sendPasswordResetEmail({required String email}) {
    return firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Stream<bool> authStateChanges() {
    return firebaseAuth.authStateChanges().map((user) => user != null);
  }

  Future<void> reloadUser() async {
    await firebaseAuth.currentUser?.reload();
  }

  Future<bool> isEmailVerified() async {
    await firebaseAuth.currentUser?.reload();

    return firebaseAuth.currentUser?.emailVerified ?? false;
  }

  bool get isLoggedIn => firebaseAuth.currentUser != null;
}
