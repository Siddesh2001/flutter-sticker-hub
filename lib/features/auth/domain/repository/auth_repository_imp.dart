import 'package:create_sticker/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:create_sticker/features/auth/presentation/providers/auth_providers.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> signUp({required String email, required String password}) {
    return remoteDataSource.signUp(email: email, password: password);
  }

  @override
  Future<void> signIn({required String email, required String password}) {
    return remoteDataSource.signIn(email: email, password: password);
  }

  @override
  Future<void> signOut() {
    return remoteDataSource.signOut();
  }

  @override
  Future<void> sendEmailVerification() {
    return remoteDataSource.sendEmailVerification();
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) {
    return remoteDataSource.sendPasswordResetEmail(email: email);
  }

  @override
  Stream<bool> authStateChanges() {
    return remoteDataSource.authStateChanges();
  }

  @override
  Future<void> reloadUser() {
    return remoteDataSource.reloadUser();
  }

  @override
  Future<bool> isEmailVerified() {
    return remoteDataSource.isEmailVerified();
  }

  @override
  bool get isLoggedIn => remoteDataSource.isLoggedIn;
}
