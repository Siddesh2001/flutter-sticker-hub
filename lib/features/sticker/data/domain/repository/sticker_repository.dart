import 'package:create_sticker/features/sticker/data/domain/entity/sticker.dart';
import 'package:create_sticker/features/sticker/data/domain/entity/sticker_pack.dart';

abstract class StickerRepository {
  Future<void> createPack({required String name, required String author});

  Future<List<StickerPack>> getStickerPacks();

  Future<void> deletePack(String packId);

  Future<void> addSticker({required String packId, required String imageUrl});

  Future<List<Sticker>> getStickers(String packId);

  Future<void> deleteSticker({
    required String packId,
    required String stickerId,
  });
}
