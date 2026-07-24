import 'package:create_sticker/features/sticker/data/local/tables/stickers.dart';
import 'package:drift/drift.dart';

import '../database/app_database.dart';

part 'sticker_dao.g.dart';

@DriftAccessor(tables: [Stickers])
class StickerDao extends DatabaseAccessor<AppDatabase> with _$StickerDaoMixin {
  StickerDao(AppDatabase db) : super(db);

  Future<List<Sticker>> getStickers(String packId) {
    return (select(stickers)..where((tbl) => tbl.packId.equals(packId))).get();
  }

  Stream<List<Sticker>> watchStickers(String packId) {
    return (select(
      stickers,
    )..where((tbl) => tbl.packId.equals(packId))).watch();
  }

  Future<void> insertSticker(StickersCompanion sticker) async {
    await into(stickers).insertOnConflictUpdate(sticker);
  }

  Future<void> deleteSticker(String stickerId) async {
    await (delete(stickers)..where((tbl) => tbl.id.equals(stickerId))).go();
  }

  Future<void> deleteByPack(String packId) async {
    await (delete(stickers)..where((tbl) => tbl.packId.equals(packId))).go();
  }
}
