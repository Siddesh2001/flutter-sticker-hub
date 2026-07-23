import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:create_sticker/features/sticker/data/local/database/app_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();

  ref.onDispose(() {
    database.close();
  });

  return database;
});
