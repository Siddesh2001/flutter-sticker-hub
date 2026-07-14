import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_sticker/features/sticker/data/domain/entity/sticker.dart';

class StickerModel extends Sticker {
  const StickerModel({
    required super.id,
    required super.imageUrl,
    required super.createdAt,
  });

  factory StickerModel.fromMap(Map<String, dynamic> map, String id) {
    return StickerModel(
      id: id,
      imageUrl: map['imageUrl'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {'imageUrl': imageUrl, 'createdAt': Timestamp.fromDate(createdAt)};
  }
}
