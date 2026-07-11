import '../domain/entity/sticker_pack.dart';

abstract class StickerPackRepository {
  Future<void> createPack({required String name, required String author});

  Future<List<StickerPack>> getPacks();

  Future<void> deletePack(String id);
}
