import 'package:create_sticker/features/auth/domain/repository/auth_repository_imp.dart';
import 'package:create_sticker/features/auth/presentation/providers/auth_controller.dart';
import 'package:create_sticker/features/auth/presentation/providers/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/datasource/auth_remote_datasource.dart';
import '../../domain/repository/auth_repository.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource(firebaseAuth: ref.read(firebaseAuthProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.read(authRemoteDataSourceProvider),
  );
});
final authControllerProvider = AsyncNotifierProvider<AuthController, void>(
  AuthController.new,
);
