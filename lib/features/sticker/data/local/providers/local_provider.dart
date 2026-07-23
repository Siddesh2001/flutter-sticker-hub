import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../local/datasource/sticker_local_datasource.dart';
import '../../../../../core/providers/database_provider.dart';

final stickerLocalDataSourceProvider = Provider<StickerLocalDataSource>((ref) {
  return StickerLocalDataSource(ref.read(appDatabaseProvider));
});
