// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $StickerPacksTable extends StickerPacks
    with TableInfo<$StickerPacksTable, StickerPack> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StickerPacksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _coverImageCloudUrlMeta =
      const VerificationMeta('coverImageCloudUrl');
  @override
  late final GeneratedColumn<String> coverImageCloudUrl =
      GeneratedColumn<String>(
        'cover_image_cloud_url',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _coverImageLocalPathMeta =
      const VerificationMeta('coverImageLocalPath');
  @override
  late final GeneratedColumn<String> coverImageLocalPath =
      GeneratedColumn<String>(
        'cover_image_local_path',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _stickerCountMeta = const VerificationMeta(
    'stickerCount',
  );
  @override
  late final GeneratedColumn<int> stickerCount = GeneratedColumn<int>(
    'sticker_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _lastSyncedMeta = const VerificationMeta(
    'lastSynced',
  );
  @override
  late final GeneratedColumn<DateTime> lastSynced = GeneratedColumn<DateTime>(
    'last_synced',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    author,
    coverImageCloudUrl,
    coverImageLocalPath,
    stickerCount,
    createdAt,
    updatedAt,
    isSynced,
    lastSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sticker_packs';
  @override
  VerificationContext validateIntegrity(
    Insertable<StickerPack> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('cover_image_cloud_url')) {
      context.handle(
        _coverImageCloudUrlMeta,
        coverImageCloudUrl.isAcceptableOrUnknown(
          data['cover_image_cloud_url']!,
          _coverImageCloudUrlMeta,
        ),
      );
    }
    if (data.containsKey('cover_image_local_path')) {
      context.handle(
        _coverImageLocalPathMeta,
        coverImageLocalPath.isAcceptableOrUnknown(
          data['cover_image_local_path']!,
          _coverImageLocalPathMeta,
        ),
      );
    }
    if (data.containsKey('sticker_count')) {
      context.handle(
        _stickerCountMeta,
        stickerCount.isAcceptableOrUnknown(
          data['sticker_count']!,
          _stickerCountMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('last_synced')) {
      context.handle(
        _lastSyncedMeta,
        lastSynced.isAcceptableOrUnknown(data['last_synced']!, _lastSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StickerPack map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StickerPack(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      )!,
      coverImageCloudUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_image_cloud_url'],
      )!,
      coverImageLocalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_image_local_path'],
      )!,
      stickerCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sticker_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      lastSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced'],
      ),
    );
  }

  @override
  $StickerPacksTable createAlias(String alias) {
    return $StickerPacksTable(attachedDatabase, alias);
  }
}

class StickerPack extends DataClass implements Insertable<StickerPack> {
  final String id;
  final String name;
  final String author;
  final String coverImageCloudUrl;
  final String coverImageLocalPath;
  final int stickerCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  final DateTime? lastSynced;
  const StickerPack({
    required this.id,
    required this.name,
    required this.author,
    required this.coverImageCloudUrl,
    required this.coverImageLocalPath,
    required this.stickerCount,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
    this.lastSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['author'] = Variable<String>(author);
    map['cover_image_cloud_url'] = Variable<String>(coverImageCloudUrl);
    map['cover_image_local_path'] = Variable<String>(coverImageLocalPath);
    map['sticker_count'] = Variable<int>(stickerCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    if (!nullToAbsent || lastSynced != null) {
      map['last_synced'] = Variable<DateTime>(lastSynced);
    }
    return map;
  }

  StickerPacksCompanion toCompanion(bool nullToAbsent) {
    return StickerPacksCompanion(
      id: Value(id),
      name: Value(name),
      author: Value(author),
      coverImageCloudUrl: Value(coverImageCloudUrl),
      coverImageLocalPath: Value(coverImageLocalPath),
      stickerCount: Value(stickerCount),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
      lastSynced: lastSynced == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSynced),
    );
  }

  factory StickerPack.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StickerPack(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      author: serializer.fromJson<String>(json['author']),
      coverImageCloudUrl: serializer.fromJson<String>(
        json['coverImageCloudUrl'],
      ),
      coverImageLocalPath: serializer.fromJson<String>(
        json['coverImageLocalPath'],
      ),
      stickerCount: serializer.fromJson<int>(json['stickerCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      lastSynced: serializer.fromJson<DateTime?>(json['lastSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'author': serializer.toJson<String>(author),
      'coverImageCloudUrl': serializer.toJson<String>(coverImageCloudUrl),
      'coverImageLocalPath': serializer.toJson<String>(coverImageLocalPath),
      'stickerCount': serializer.toJson<int>(stickerCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'lastSynced': serializer.toJson<DateTime?>(lastSynced),
    };
  }

  StickerPack copyWith({
    String? id,
    String? name,
    String? author,
    String? coverImageCloudUrl,
    String? coverImageLocalPath,
    int? stickerCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
    Value<DateTime?> lastSynced = const Value.absent(),
  }) => StickerPack(
    id: id ?? this.id,
    name: name ?? this.name,
    author: author ?? this.author,
    coverImageCloudUrl: coverImageCloudUrl ?? this.coverImageCloudUrl,
    coverImageLocalPath: coverImageLocalPath ?? this.coverImageLocalPath,
    stickerCount: stickerCount ?? this.stickerCount,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
    lastSynced: lastSynced.present ? lastSynced.value : this.lastSynced,
  );
  StickerPack copyWithCompanion(StickerPacksCompanion data) {
    return StickerPack(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      author: data.author.present ? data.author.value : this.author,
      coverImageCloudUrl: data.coverImageCloudUrl.present
          ? data.coverImageCloudUrl.value
          : this.coverImageCloudUrl,
      coverImageLocalPath: data.coverImageLocalPath.present
          ? data.coverImageLocalPath.value
          : this.coverImageLocalPath,
      stickerCount: data.stickerCount.present
          ? data.stickerCount.value
          : this.stickerCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      lastSynced: data.lastSynced.present
          ? data.lastSynced.value
          : this.lastSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StickerPack(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('author: $author, ')
          ..write('coverImageCloudUrl: $coverImageCloudUrl, ')
          ..write('coverImageLocalPath: $coverImageLocalPath, ')
          ..write('stickerCount: $stickerCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('lastSynced: $lastSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    author,
    coverImageCloudUrl,
    coverImageLocalPath,
    stickerCount,
    createdAt,
    updatedAt,
    isSynced,
    lastSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StickerPack &&
          other.id == this.id &&
          other.name == this.name &&
          other.author == this.author &&
          other.coverImageCloudUrl == this.coverImageCloudUrl &&
          other.coverImageLocalPath == this.coverImageLocalPath &&
          other.stickerCount == this.stickerCount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced &&
          other.lastSynced == this.lastSynced);
}

class StickerPacksCompanion extends UpdateCompanion<StickerPack> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> author;
  final Value<String> coverImageCloudUrl;
  final Value<String> coverImageLocalPath;
  final Value<int> stickerCount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<DateTime?> lastSynced;
  final Value<int> rowid;
  const StickerPacksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.author = const Value.absent(),
    this.coverImageCloudUrl = const Value.absent(),
    this.coverImageLocalPath = const Value.absent(),
    this.stickerCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.lastSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StickerPacksCompanion.insert({
    required String id,
    required String name,
    required String author,
    this.coverImageCloudUrl = const Value.absent(),
    this.coverImageLocalPath = const Value.absent(),
    this.stickerCount = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.lastSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       author = Value(author),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<StickerPack> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? author,
    Expression<String>? coverImageCloudUrl,
    Expression<String>? coverImageLocalPath,
    Expression<int>? stickerCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<DateTime>? lastSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (author != null) 'author': author,
      if (coverImageCloudUrl != null)
        'cover_image_cloud_url': coverImageCloudUrl,
      if (coverImageLocalPath != null)
        'cover_image_local_path': coverImageLocalPath,
      if (stickerCount != null) 'sticker_count': stickerCount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (lastSynced != null) 'last_synced': lastSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StickerPacksCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? author,
    Value<String>? coverImageCloudUrl,
    Value<String>? coverImageLocalPath,
    Value<int>? stickerCount,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<DateTime?>? lastSynced,
    Value<int>? rowid,
  }) {
    return StickerPacksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      coverImageCloudUrl: coverImageCloudUrl ?? this.coverImageCloudUrl,
      coverImageLocalPath: coverImageLocalPath ?? this.coverImageLocalPath,
      stickerCount: stickerCount ?? this.stickerCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      lastSynced: lastSynced ?? this.lastSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (coverImageCloudUrl.present) {
      map['cover_image_cloud_url'] = Variable<String>(coverImageCloudUrl.value);
    }
    if (coverImageLocalPath.present) {
      map['cover_image_local_path'] = Variable<String>(
        coverImageLocalPath.value,
      );
    }
    if (stickerCount.present) {
      map['sticker_count'] = Variable<int>(stickerCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (lastSynced.present) {
      map['last_synced'] = Variable<DateTime>(lastSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StickerPacksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('author: $author, ')
          ..write('coverImageCloudUrl: $coverImageCloudUrl, ')
          ..write('coverImageLocalPath: $coverImageLocalPath, ')
          ..write('stickerCount: $stickerCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('lastSynced: $lastSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StickersTable extends Stickers with TableInfo<$StickersTable, Sticker> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StickersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _packIdMeta = const VerificationMeta('packId');
  @override
  late final GeneratedColumn<String> packId = GeneratedColumn<String>(
    'pack_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cloudUrlMeta = const VerificationMeta(
    'cloudUrl',
  );
  @override
  late final GeneratedColumn<String> cloudUrl = GeneratedColumn<String>(
    'cloud_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDownloadedMeta = const VerificationMeta(
    'isDownloaded',
  );
  @override
  late final GeneratedColumn<bool> isDownloaded = GeneratedColumn<bool>(
    'is_downloaded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_downloaded" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _lastSyncedMeta = const VerificationMeta(
    'lastSynced',
  );
  @override
  late final GeneratedColumn<DateTime> lastSynced = GeneratedColumn<DateTime>(
    'last_synced',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    packId,
    cloudUrl,
    localPath,
    createdAt,
    isDownloaded,
    isSynced,
    lastSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stickers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Sticker> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pack_id')) {
      context.handle(
        _packIdMeta,
        packId.isAcceptableOrUnknown(data['pack_id']!, _packIdMeta),
      );
    } else if (isInserting) {
      context.missing(_packIdMeta);
    }
    if (data.containsKey('cloud_url')) {
      context.handle(
        _cloudUrlMeta,
        cloudUrl.isAcceptableOrUnknown(data['cloud_url']!, _cloudUrlMeta),
      );
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_downloaded')) {
      context.handle(
        _isDownloadedMeta,
        isDownloaded.isAcceptableOrUnknown(
          data['is_downloaded']!,
          _isDownloadedMeta,
        ),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('last_synced')) {
      context.handle(
        _lastSyncedMeta,
        lastSynced.isAcceptableOrUnknown(data['last_synced']!, _lastSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Sticker map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Sticker(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      packId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pack_id'],
      )!,
      cloudUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cloud_url'],
      )!,
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      isDownloaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_downloaded'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      lastSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced'],
      ),
    );
  }

  @override
  $StickersTable createAlias(String alias) {
    return $StickersTable(attachedDatabase, alias);
  }
}

class Sticker extends DataClass implements Insertable<Sticker> {
  final String id;
  final String packId;
  final String cloudUrl;
  final String localPath;
  final DateTime createdAt;
  final bool isDownloaded;
  final bool isSynced;
  final DateTime? lastSynced;
  const Sticker({
    required this.id,
    required this.packId,
    required this.cloudUrl,
    required this.localPath,
    required this.createdAt,
    required this.isDownloaded,
    required this.isSynced,
    this.lastSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pack_id'] = Variable<String>(packId);
    map['cloud_url'] = Variable<String>(cloudUrl);
    map['local_path'] = Variable<String>(localPath);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_downloaded'] = Variable<bool>(isDownloaded);
    map['is_synced'] = Variable<bool>(isSynced);
    if (!nullToAbsent || lastSynced != null) {
      map['last_synced'] = Variable<DateTime>(lastSynced);
    }
    return map;
  }

  StickersCompanion toCompanion(bool nullToAbsent) {
    return StickersCompanion(
      id: Value(id),
      packId: Value(packId),
      cloudUrl: Value(cloudUrl),
      localPath: Value(localPath),
      createdAt: Value(createdAt),
      isDownloaded: Value(isDownloaded),
      isSynced: Value(isSynced),
      lastSynced: lastSynced == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSynced),
    );
  }

  factory Sticker.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sticker(
      id: serializer.fromJson<String>(json['id']),
      packId: serializer.fromJson<String>(json['packId']),
      cloudUrl: serializer.fromJson<String>(json['cloudUrl']),
      localPath: serializer.fromJson<String>(json['localPath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isDownloaded: serializer.fromJson<bool>(json['isDownloaded']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      lastSynced: serializer.fromJson<DateTime?>(json['lastSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'packId': serializer.toJson<String>(packId),
      'cloudUrl': serializer.toJson<String>(cloudUrl),
      'localPath': serializer.toJson<String>(localPath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isDownloaded': serializer.toJson<bool>(isDownloaded),
      'isSynced': serializer.toJson<bool>(isSynced),
      'lastSynced': serializer.toJson<DateTime?>(lastSynced),
    };
  }

  Sticker copyWith({
    String? id,
    String? packId,
    String? cloudUrl,
    String? localPath,
    DateTime? createdAt,
    bool? isDownloaded,
    bool? isSynced,
    Value<DateTime?> lastSynced = const Value.absent(),
  }) => Sticker(
    id: id ?? this.id,
    packId: packId ?? this.packId,
    cloudUrl: cloudUrl ?? this.cloudUrl,
    localPath: localPath ?? this.localPath,
    createdAt: createdAt ?? this.createdAt,
    isDownloaded: isDownloaded ?? this.isDownloaded,
    isSynced: isSynced ?? this.isSynced,
    lastSynced: lastSynced.present ? lastSynced.value : this.lastSynced,
  );
  Sticker copyWithCompanion(StickersCompanion data) {
    return Sticker(
      id: data.id.present ? data.id.value : this.id,
      packId: data.packId.present ? data.packId.value : this.packId,
      cloudUrl: data.cloudUrl.present ? data.cloudUrl.value : this.cloudUrl,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isDownloaded: data.isDownloaded.present
          ? data.isDownloaded.value
          : this.isDownloaded,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      lastSynced: data.lastSynced.present
          ? data.lastSynced.value
          : this.lastSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Sticker(')
          ..write('id: $id, ')
          ..write('packId: $packId, ')
          ..write('cloudUrl: $cloudUrl, ')
          ..write('localPath: $localPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDownloaded: $isDownloaded, ')
          ..write('isSynced: $isSynced, ')
          ..write('lastSynced: $lastSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    packId,
    cloudUrl,
    localPath,
    createdAt,
    isDownloaded,
    isSynced,
    lastSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sticker &&
          other.id == this.id &&
          other.packId == this.packId &&
          other.cloudUrl == this.cloudUrl &&
          other.localPath == this.localPath &&
          other.createdAt == this.createdAt &&
          other.isDownloaded == this.isDownloaded &&
          other.isSynced == this.isSynced &&
          other.lastSynced == this.lastSynced);
}

class StickersCompanion extends UpdateCompanion<Sticker> {
  final Value<String> id;
  final Value<String> packId;
  final Value<String> cloudUrl;
  final Value<String> localPath;
  final Value<DateTime> createdAt;
  final Value<bool> isDownloaded;
  final Value<bool> isSynced;
  final Value<DateTime?> lastSynced;
  final Value<int> rowid;
  const StickersCompanion({
    this.id = const Value.absent(),
    this.packId = const Value.absent(),
    this.cloudUrl = const Value.absent(),
    this.localPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isDownloaded = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.lastSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StickersCompanion.insert({
    required String id,
    required String packId,
    this.cloudUrl = const Value.absent(),
    this.localPath = const Value.absent(),
    required DateTime createdAt,
    this.isDownloaded = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.lastSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       packId = Value(packId),
       createdAt = Value(createdAt);
  static Insertable<Sticker> custom({
    Expression<String>? id,
    Expression<String>? packId,
    Expression<String>? cloudUrl,
    Expression<String>? localPath,
    Expression<DateTime>? createdAt,
    Expression<bool>? isDownloaded,
    Expression<bool>? isSynced,
    Expression<DateTime>? lastSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (packId != null) 'pack_id': packId,
      if (cloudUrl != null) 'cloud_url': cloudUrl,
      if (localPath != null) 'local_path': localPath,
      if (createdAt != null) 'created_at': createdAt,
      if (isDownloaded != null) 'is_downloaded': isDownloaded,
      if (isSynced != null) 'is_synced': isSynced,
      if (lastSynced != null) 'last_synced': lastSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StickersCompanion copyWith({
    Value<String>? id,
    Value<String>? packId,
    Value<String>? cloudUrl,
    Value<String>? localPath,
    Value<DateTime>? createdAt,
    Value<bool>? isDownloaded,
    Value<bool>? isSynced,
    Value<DateTime?>? lastSynced,
    Value<int>? rowid,
  }) {
    return StickersCompanion(
      id: id ?? this.id,
      packId: packId ?? this.packId,
      cloudUrl: cloudUrl ?? this.cloudUrl,
      localPath: localPath ?? this.localPath,
      createdAt: createdAt ?? this.createdAt,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      isSynced: isSynced ?? this.isSynced,
      lastSynced: lastSynced ?? this.lastSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (packId.present) {
      map['pack_id'] = Variable<String>(packId.value);
    }
    if (cloudUrl.present) {
      map['cloud_url'] = Variable<String>(cloudUrl.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isDownloaded.present) {
      map['is_downloaded'] = Variable<bool>(isDownloaded.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (lastSynced.present) {
      map['last_synced'] = Variable<DateTime>(lastSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StickersCompanion(')
          ..write('id: $id, ')
          ..write('packId: $packId, ')
          ..write('cloudUrl: $cloudUrl, ')
          ..write('localPath: $localPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDownloaded: $isDownloaded, ')
          ..write('isSynced: $isSynced, ')
          ..write('lastSynced: $lastSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StickerPacksTable stickerPacks = $StickerPacksTable(this);
  late final $StickersTable stickers = $StickersTable(this);
  late final StickerPackDao stickerPackDao = StickerPackDao(
    this as AppDatabase,
  );
  late final StickerDao stickerDao = StickerDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [stickerPacks, stickers];
}

typedef $$StickerPacksTableCreateCompanionBuilder =
    StickerPacksCompanion Function({
      required String id,
      required String name,
      required String author,
      Value<String> coverImageCloudUrl,
      Value<String> coverImageLocalPath,
      Value<int> stickerCount,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<DateTime?> lastSynced,
      Value<int> rowid,
    });
typedef $$StickerPacksTableUpdateCompanionBuilder =
    StickerPacksCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> author,
      Value<String> coverImageCloudUrl,
      Value<String> coverImageLocalPath,
      Value<int> stickerCount,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<DateTime?> lastSynced,
      Value<int> rowid,
    });

class $$StickerPacksTableFilterComposer
    extends Composer<_$AppDatabase, $StickerPacksTable> {
  $$StickerPacksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverImageCloudUrl => $composableBuilder(
    column: $table.coverImageCloudUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverImageLocalPath => $composableBuilder(
    column: $table.coverImageLocalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stickerCount => $composableBuilder(
    column: $table.stickerCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSynced => $composableBuilder(
    column: $table.lastSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StickerPacksTableOrderingComposer
    extends Composer<_$AppDatabase, $StickerPacksTable> {
  $$StickerPacksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverImageCloudUrl => $composableBuilder(
    column: $table.coverImageCloudUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverImageLocalPath => $composableBuilder(
    column: $table.coverImageLocalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stickerCount => $composableBuilder(
    column: $table.stickerCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSynced => $composableBuilder(
    column: $table.lastSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StickerPacksTableAnnotationComposer
    extends Composer<_$AppDatabase, $StickerPacksTable> {
  $$StickerPacksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get coverImageCloudUrl => $composableBuilder(
    column: $table.coverImageCloudUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverImageLocalPath => $composableBuilder(
    column: $table.coverImageLocalPath,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stickerCount => $composableBuilder(
    column: $table.stickerCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSynced => $composableBuilder(
    column: $table.lastSynced,
    builder: (column) => column,
  );
}

class $$StickerPacksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StickerPacksTable,
          StickerPack,
          $$StickerPacksTableFilterComposer,
          $$StickerPacksTableOrderingComposer,
          $$StickerPacksTableAnnotationComposer,
          $$StickerPacksTableCreateCompanionBuilder,
          $$StickerPacksTableUpdateCompanionBuilder,
          (
            StickerPack,
            BaseReferences<_$AppDatabase, $StickerPacksTable, StickerPack>,
          ),
          StickerPack,
          PrefetchHooks Function()
        > {
  $$StickerPacksTableTableManager(_$AppDatabase db, $StickerPacksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StickerPacksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StickerPacksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StickerPacksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> author = const Value.absent(),
                Value<String> coverImageCloudUrl = const Value.absent(),
                Value<String> coverImageLocalPath = const Value.absent(),
                Value<int> stickerCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime?> lastSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StickerPacksCompanion(
                id: id,
                name: name,
                author: author,
                coverImageCloudUrl: coverImageCloudUrl,
                coverImageLocalPath: coverImageLocalPath,
                stickerCount: stickerCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                lastSynced: lastSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String author,
                Value<String> coverImageCloudUrl = const Value.absent(),
                Value<String> coverImageLocalPath = const Value.absent(),
                Value<int> stickerCount = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime?> lastSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StickerPacksCompanion.insert(
                id: id,
                name: name,
                author: author,
                coverImageCloudUrl: coverImageCloudUrl,
                coverImageLocalPath: coverImageLocalPath,
                stickerCount: stickerCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                lastSynced: lastSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StickerPacksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StickerPacksTable,
      StickerPack,
      $$StickerPacksTableFilterComposer,
      $$StickerPacksTableOrderingComposer,
      $$StickerPacksTableAnnotationComposer,
      $$StickerPacksTableCreateCompanionBuilder,
      $$StickerPacksTableUpdateCompanionBuilder,
      (
        StickerPack,
        BaseReferences<_$AppDatabase, $StickerPacksTable, StickerPack>,
      ),
      StickerPack,
      PrefetchHooks Function()
    >;
typedef $$StickersTableCreateCompanionBuilder =
    StickersCompanion Function({
      required String id,
      required String packId,
      Value<String> cloudUrl,
      Value<String> localPath,
      required DateTime createdAt,
      Value<bool> isDownloaded,
      Value<bool> isSynced,
      Value<DateTime?> lastSynced,
      Value<int> rowid,
    });
typedef $$StickersTableUpdateCompanionBuilder =
    StickersCompanion Function({
      Value<String> id,
      Value<String> packId,
      Value<String> cloudUrl,
      Value<String> localPath,
      Value<DateTime> createdAt,
      Value<bool> isDownloaded,
      Value<bool> isSynced,
      Value<DateTime?> lastSynced,
      Value<int> rowid,
    });

class $$StickersTableFilterComposer
    extends Composer<_$AppDatabase, $StickersTable> {
  $$StickersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get packId => $composableBuilder(
    column: $table.packId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cloudUrl => $composableBuilder(
    column: $table.cloudUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDownloaded => $composableBuilder(
    column: $table.isDownloaded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSynced => $composableBuilder(
    column: $table.lastSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StickersTableOrderingComposer
    extends Composer<_$AppDatabase, $StickersTable> {
  $$StickersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get packId => $composableBuilder(
    column: $table.packId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cloudUrl => $composableBuilder(
    column: $table.cloudUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDownloaded => $composableBuilder(
    column: $table.isDownloaded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSynced => $composableBuilder(
    column: $table.lastSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StickersTableAnnotationComposer
    extends Composer<_$AppDatabase, $StickersTable> {
  $$StickersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get packId =>
      $composableBuilder(column: $table.packId, builder: (column) => column);

  GeneratedColumn<String> get cloudUrl =>
      $composableBuilder(column: $table.cloudUrl, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isDownloaded => $composableBuilder(
    column: $table.isDownloaded,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSynced => $composableBuilder(
    column: $table.lastSynced,
    builder: (column) => column,
  );
}

class $$StickersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StickersTable,
          Sticker,
          $$StickersTableFilterComposer,
          $$StickersTableOrderingComposer,
          $$StickersTableAnnotationComposer,
          $$StickersTableCreateCompanionBuilder,
          $$StickersTableUpdateCompanionBuilder,
          (Sticker, BaseReferences<_$AppDatabase, $StickersTable, Sticker>),
          Sticker,
          PrefetchHooks Function()
        > {
  $$StickersTableTableManager(_$AppDatabase db, $StickersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StickersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StickersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StickersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> packId = const Value.absent(),
                Value<String> cloudUrl = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isDownloaded = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime?> lastSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StickersCompanion(
                id: id,
                packId: packId,
                cloudUrl: cloudUrl,
                localPath: localPath,
                createdAt: createdAt,
                isDownloaded: isDownloaded,
                isSynced: isSynced,
                lastSynced: lastSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String packId,
                Value<String> cloudUrl = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                required DateTime createdAt,
                Value<bool> isDownloaded = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime?> lastSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StickersCompanion.insert(
                id: id,
                packId: packId,
                cloudUrl: cloudUrl,
                localPath: localPath,
                createdAt: createdAt,
                isDownloaded: isDownloaded,
                isSynced: isSynced,
                lastSynced: lastSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StickersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StickersTable,
      Sticker,
      $$StickersTableFilterComposer,
      $$StickersTableOrderingComposer,
      $$StickersTableAnnotationComposer,
      $$StickersTableCreateCompanionBuilder,
      $$StickersTableUpdateCompanionBuilder,
      (Sticker, BaseReferences<_$AppDatabase, $StickersTable, Sticker>),
      Sticker,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StickerPacksTableTableManager get stickerPacks =>
      $$StickerPacksTableTableManager(_db, _db.stickerPacks);
  $$StickersTableTableManager get stickers =>
      $$StickersTableTableManager(_db, _db.stickers);
}
