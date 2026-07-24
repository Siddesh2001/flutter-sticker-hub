import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_sticker/features/sticker/data/local/providers/local_provider.dart';
import 'package:create_sticker/features/sticker/data/repository/sticker_repository_impl.dart';
import 'package:create_sticker/features/auth/presentation/providers/auth_providers.dart';
import 'package:create_sticker/features/sticker/data/datasource/sticker_remote_datasource.dart';
import 'package:create_sticker/features/sticker/data/domain/repository/sticker_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final stickerRemoteDataSourceProvider = Provider<StickerRemoteDataSource>((
  ref,
) {
  return StickerRemoteDataSource(
    firestore: ref.read(firebaseFirestoreProvider),
    firebaseAuth: ref.read(firebaseAuthProvider),
  );
});

final stickerRepositoryProvider = Provider<StickerRepository>((ref) {
  return StickerRepositoryImpl(
    remoteDataSource: ref.read(stickerRemoteDataSourceProvider),
    stickerPackDao: ref.read(stickerPackDaoProvider),
    stickerDao: ref.read(stickerDaoProvider),
  );
});
