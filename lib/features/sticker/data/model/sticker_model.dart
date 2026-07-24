import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_sticker/features/sticker/data/domain/entity/sticker.dart';

class StickerModel extends Sticker {
  const StickerModel({
    required super.id,
    required super.cloudUrl,
    required super.localPath,
    required super.createdAt,
    required super.isDownloaded,
    required super.isSynced,
    required super.lastSynced,
  });

  factory StickerModel.fromMap(Map<String, dynamic> map, String id) {
    return StickerModel(
      id: id,

      // Existing Firestore field
      cloudUrl: map['imageUrl'] ?? '',

      // Local cache path is not stored in Firestore
      localPath: '',

      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),

      // When downloaded from Firestore, it isn't cached locally yet
      isDownloaded: false,

      // Firestore data is considered synced
      isSynced: true,

      lastSynced: (map['lastSynced'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': cloudUrl,
      'createdAt': Timestamp.fromDate(createdAt),
      'lastSynced': lastSynced != null ? Timestamp.fromDate(lastSynced!) : null,
    };
  }
}
