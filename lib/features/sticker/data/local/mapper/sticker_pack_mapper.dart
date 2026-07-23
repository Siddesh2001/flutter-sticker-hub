import 'package:drift/drift.dart';

import '../../domain/entity/sticker_pack.dart';
import '../database/app_database.dart';

extension StickerPackMapper on StickerPack {
  StickerPacksCompanion toCompanion() {
    return StickerPacksCompanion.insert(
      id: id,
      name: name,
      author: author,
      coverImageCloudUrl: Value(coverImage),
      coverImageLocalPath: const Value(''),
      stickerCount: Value(stickerCount),
      createdAt: createdAt,
    );
  }
}
