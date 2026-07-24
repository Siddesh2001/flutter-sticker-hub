// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_pack_dao.dart';

// ignore_for_file: type=lint
mixin _$StickerPackDaoMixin on DatabaseAccessor<AppDatabase> {
  $StickerPacksTable get stickerPacks => attachedDatabase.stickerPacks;
  StickerPackDaoManager get managers => StickerPackDaoManager(this);
}

class StickerPackDaoManager {
  final _$StickerPackDaoMixin _db;
  StickerPackDaoManager(this._db);
  $$StickerPacksTableTableManager get stickerPacks =>
      $$StickerPacksTableTableManager(_db.attachedDatabase, _db.stickerPacks);
}
