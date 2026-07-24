import 'package:create_sticker/features/sticker/data/local/tables/sticker_packs.dart';
import 'package:drift/drift.dart';

import '../database/app_database.dart';

part 'sticker_pack_dao.g.dart';

@DriftAccessor(tables: [StickerPacks])
class StickerPackDao extends DatabaseAccessor<AppDatabase>
    with _$StickerPackDaoMixin {
  StickerPackDao(AppDatabase db) : super(db);

  Future<List<StickerPack>> getAllPacks() {
    return select(stickerPacks).get();
  }

  Stream<List<StickerPack>> watchAllPacks() {
    return select(stickerPacks).watch();
  }

  Future<void> insertPack(StickerPacksCompanion pack) async {
    await into(stickerPacks).insertOnConflictUpdate(pack);
  }

  Future<void> deletePack(String id) async {
    await (delete(stickerPacks)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> renamePack(String id, String newName) async {
    await (update(stickerPacks)..where((tbl) => tbl.id.equals(id))).write(
      StickerPacksCompanion(name: Value(newName)),
    );
  }

  Future<void> updateStickerCount(String id, int count) async {
    await (update(stickerPacks)..where((tbl) => tbl.id.equals(id))).write(
      StickerPacksCompanion(stickerCount: Value(count)),
    );
  }

  Future<void> updateCoverImage(
    String id,
    String cloudUrl,
    String localPath,
  ) async {
    await (update(stickerPacks)..where((tbl) => tbl.id.equals(id))).write(
      StickerPacksCompanion(
        coverImageCloudUrl: Value(cloudUrl),
        coverImageLocalPath: Value(localPath),
      ),
    );
  }

  Future<void> setSyncStatus(String id, bool synced) async {
    await (update(stickerPacks)..where((tbl) => tbl.id.equals(id))).write(
      StickerPacksCompanion(
        isSynced: Value(synced),
        lastSynced: Value(DateTime.now()),
      ),
    );
  }
}
