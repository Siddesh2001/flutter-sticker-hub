import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/database/app_database.dart';
import '../../data/local/datasource/sticker_local_datasource.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final stickerLocalDataSourceProvider = Provider<StickerLocalDataSource>((ref) {
  return StickerLocalDataSource(ref.read(appDatabaseProvider));
});
