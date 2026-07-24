import 'package:drift/drift.dart';

import '../../domain/entity/sticker.dart' as entity;
import '../database/app_database.dart';

extension StickerMapper on entity.Sticker {
  StickersCompanion toCompanion({required String packId}) {
    return StickersCompanion.insert(
      id: id,
      packId: packId,
      cloudUrl: Value(cloudUrl),
      localPath: Value(localPath),
      createdAt: createdAt,
      isDownloaded: Value(isDownloaded),
      isSynced: Value(isSynced),
      lastSynced: Value(lastSynced),
    );
  }
}
