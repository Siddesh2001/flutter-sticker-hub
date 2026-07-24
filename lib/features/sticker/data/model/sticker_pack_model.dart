import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/entity/sticker_pack.dart';

class StickerPackModel extends StickerPack {
  const StickerPackModel({
    required super.id,
    required super.name,
    required super.author,
    required super.createdAt,
    required super.stickerCount,
    required super.coverImageCloudUrl,
    required super.coverImageLocalPath,
    required super.updatedAt,
    required super.isSynced,
    required super.lastSynced,
  });

  factory StickerPackModel.fromMap(String id, Map<String, dynamic> map) {
    return StickerPackModel(
      id: id,
      name: map['name'] ?? '',
      author: map['author'] ?? '',

      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),

      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),

      stickerCount: map['stickerCount'] ?? 0,

      // Existing Firestore field
      coverImageCloudUrl: map['coverImage'] ?? '',

      // Local cache path (not stored in Firestore)
      coverImageLocalPath: '',

      // Existing data in Firestore is already synced
      isSynced: true,

      lastSynced: (map['lastSynced'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'author': author,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'stickerCount': stickerCount,
      'coverImage': coverImageCloudUrl,
      'lastSynced': lastSynced != null ? Timestamp.fromDate(lastSynced!) : null,
    };
  }
}
