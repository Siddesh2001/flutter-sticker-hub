import 'package:drift/drift.dart';

import '../../domain/entity/sticker_pack.dart' as entity;
import '../database/app_database.dart';

extension StickerPackMapper on entity.StickerPack {
  StickerPacksCompanion toCompanion() {
    return StickerPacksCompanion.insert(
      id: id,
      name: name,
      author: author,
      coverImageCloudUrl: Value(coverImageCloudUrl),
      coverImageLocalPath: Value(coverImageLocalPath),
      stickerCount: Value(stickerCount),
      createdAt: createdAt,
      updatedAt: updatedAt,
      isSynced: Value(isSynced),
      lastSynced: Value(lastSynced),
    );
  }
}
