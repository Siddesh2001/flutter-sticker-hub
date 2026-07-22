import 'package:drift/drift.dart';

class Stickers extends Table {
  TextColumn get id => text()();

  TextColumn get packId => text()();

  TextColumn get cloudUrl => text().withDefault(const Constant(''))();

  TextColumn get localPath => text().withDefault(const Constant(''))();

  DateTimeColumn get createdAt => dateTime()();

  BoolColumn get isDownloaded => boolean().withDefault(const Constant(false))();

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  DateTimeColumn get lastSynced => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
