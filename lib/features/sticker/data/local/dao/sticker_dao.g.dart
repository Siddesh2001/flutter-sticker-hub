// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_dao.dart';

// ignore_for_file: type=lint
mixin _$StickerDaoMixin on DatabaseAccessor<AppDatabase> {
  $StickersTable get stickers => attachedDatabase.stickers;
  StickerDaoManager get managers => StickerDaoManager(this);
}

class StickerDaoManager {
  final _$StickerDaoMixin _db;
  StickerDaoManager(this._db);
  $$StickersTableTableManager get stickers =>
      $$StickersTableTableManager(_db.attachedDatabase, _db.stickers);
}
