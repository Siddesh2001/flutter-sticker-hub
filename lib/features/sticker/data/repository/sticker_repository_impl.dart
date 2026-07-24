import 'package:create_sticker/features/sticker/data/datasource/sticker_remote_datasource.dart';
import 'package:create_sticker/features/sticker/data/domain/entity/sticker.dart';
import 'package:create_sticker/features/sticker/data/domain/repository/sticker_repository.dart';
import 'package:create_sticker/features/sticker/data/domain/entity/sticker_pack.dart';
import 'package:create_sticker/features/sticker/data/local/dao/sticker_pack_dao.dart';
import 'package:create_sticker/features/sticker/data/local/dao/sticker_dao.dart';
import 'package:create_sticker/features/sticker/data/local/mapper/sticker_pack_mapper.dart';

class StickerRepositoryImpl implements StickerRepository {
  final StickerRemoteDataSource remoteDataSource;
  final StickerPackDao stickerPackDao;
  final StickerDao stickerDao;

  StickerRepositoryImpl({
    required this.remoteDataSource,
    required this.stickerPackDao,
    required this.stickerDao,
  });

  @override
  Future<void> createPack({required String name, required String author}) {
    return remoteDataSource.createPack(name: name, author: author);
  }

  @override
  Future<List<StickerPack>> getStickerPacks() async {
    // Read local database first

    // Fetch from Firestore
    final remotePacks = await remoteDataSource.getStickerPacks();

    // Save to local database
    for (final pack in remotePacks) {
      await stickerPackDao.insertPack(pack.toCompanion());
    }

    // Return freshly downloaded data
    return remotePacks;
  }

  @override
  Future<void> deleteSticker({
    required String packId,
    required String stickerId,
  }) {
    return remoteDataSource.deleteSticker(packId: packId, stickerId: stickerId);
  }

  @override
  Future<void> deletePack(String packId) {
    return remoteDataSource.deletePack(packId);
  }

  @override
  Future<void> addSticker({required String packId, required String imageUrl}) {
    return remoteDataSource.addSticker(packId: packId, imageUrl: imageUrl);
  }

  @override
  Future<List<Sticker>> getStickers(String packId) {
    return remoteDataSource.getStickers(packId);
  }

  @override
  Future<void> renamePack({required String packId, required String newName}) {
    return remoteDataSource.renamePack(packId: packId, newName: newName);
  }

  @override
  Future<void> setCoverImage({
    required String packId,
    required String imageUrl,
  }) {
    return remoteDataSource.setCoverImage(packId: packId, imageUrl: imageUrl);
  }
}
