import 'package:drift/drift.dart';

import '../../domain/entity/sticker.dart';
import '../database/app_database.dart';

extension StickerMapper on Sticker {
  StickersCompanion toCompanion({required String packId}) {
    return StickersCompanion.insert(
      id: id,
      packId: packId,
      imageUrl: imageUrl,
      createdAt: createdAt,
    );
  }
}
