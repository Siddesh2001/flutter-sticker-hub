import 'package:create_sticker/features/sticker/data/local/dao/sticker_dao.dart';
import 'package:create_sticker/features/sticker/data/local/dao/sticker_pack_dao.dart';
import 'package:create_sticker/features/sticker/data/local/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../local/datasource/sticker_local_datasource.dart';
import '../../../../../core/providers/database_provider.dart';

final stickerLocalDataSourceProvider = Provider<StickerLocalDataSource>((ref) {
  return StickerLocalDataSource(ref.read(appDatabaseProvider));
});

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final stickerPackDaoProvider = Provider<StickerPackDao>((ref) {
  return StickerPackDao(ref.read(appDatabaseProvider));
});

final stickerDaoProvider = Provider<StickerDao>((ref) {
  return StickerDao(ref.read(appDatabaseProvider));
});
