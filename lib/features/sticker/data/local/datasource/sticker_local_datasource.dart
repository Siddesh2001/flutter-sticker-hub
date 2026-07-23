// import 'package:create_sticker/features/sticker/data/local/database/app_database.dart';
// import 'package:drift/drift.dart' as drift;

// class StickerLocalDataSource {
//   final AppDatabase database;

//   StickerLocalDataSource(this.database);

//   /// Returns all sticker packs
//   Future<List<StickerPack>> getStickerPacks() {
//     return database.select(database.stickerPacks).get();
//   }

//   /// Watches sticker packs for changes
//   Stream<List<StickerPack>> watchStickerPacks() {
//     return database.select(database.stickerPacks).watch();
//   }

//   /// Insert a sticker pack
//   Future<void> insertStickerPack(StickerPacksCompanion pack) async {
//     await database.into(database.stickerPacks).insert(pack);
//   }

//   /// Rename pack
//   Future<void> renameStickerPack(String id, String newName) async {
//     await (database.update(database.stickerPacks)
//           ..where((tbl) => tbl.id.equals(id)))
//         .write(StickerPacksCompanion(name: drift.Value(newName)));
//   }

//   /// Delete pack
//   Future<void> deleteStickerPack(String id) async {
//     await (database.delete(
//       database.stickerPacks,
//     )..where((tbl) => tbl.id.equals(id))).go();
//   }
// }

import 'package:drift/drift.dart';

import '../database/app_database.dart';

class StickerLocalDataSource {
  final AppDatabase database;

  StickerLocalDataSource(this.database);

  // ----------------------------
  // Sticker Packs
  // ----------------------------

  Future<List<StickerPack>> getStickerPacks() {
    return database.select(database.stickerPacks).get();
  }

  Stream<List<StickerPack>> watchStickerPacks() {
    return database.select(database.stickerPacks).watch();
  }

  Future<void> insertStickerPack(StickerPacksCompanion pack) async {
    await database.into(database.stickerPacks).insert(pack);
  }

  Future<void> updateStickerPack(StickerPacksCompanion pack) async {
    await database.update(database.stickerPacks).replace(pack);
  }

  Future<void> deleteStickerPack(String id) async {
    await (database.delete(
      database.stickerPacks,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  // ----------------------------
  // Stickers
  // ----------------------------

  Future<List<Sticker>> getStickers(String packId) {
    return (database.select(
      database.stickers,
    )..where((tbl) => tbl.packId.equals(packId))).get();
  }

  Stream<List<Sticker>> watchStickers(String packId) {
    return (database.select(
      database.stickers,
    )..where((tbl) => tbl.packId.equals(packId))).watch();
  }

  Future<void> insertSticker(StickersCompanion sticker) async {
    await database.into(database.stickers).insert(sticker);
  }

  Future<void> deleteSticker(String id) async {
    await (database.delete(
      database.stickers,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  // ----------------------------
  // Transactions
  // ----------------------------

  Future<void> runTransaction(Future<void> Function() action) {
    return database.transaction(action);
  }

  Future<void> clearStickerPacks() async {
    await database.delete(database.stickerPacks).go();
  }

  Future<void> clearStickers() async {
    await database.delete(database.stickers).go();
  }
}
