import 'package:drift/drift.dart';

class StickerPacks extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get author => text()();

  TextColumn get coverImageCloudUrl => text().withDefault(const Constant(''))();

  TextColumn get coverImageLocalPath =>
      text().withDefault(const Constant(''))();

  IntColumn get stickerCount => integer().withDefault(const Constant(0))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  DateTimeColumn get lastSynced => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
