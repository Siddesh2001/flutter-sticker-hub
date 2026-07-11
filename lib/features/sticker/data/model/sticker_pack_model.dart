import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/entity/sticker_pack.dart';

class StickerPackModel extends StickerPack {
  StickerPackModel({
    required super.id,
    required super.name,
    required super.author,
    required super.createdAt,
    required super.stickerCount,
    required super.coverImage,
  });

  factory StickerPackModel.fromMap(String id, Map<String, dynamic> map) {
    return StickerPackModel(
      id: id,
      name: map['name'] ?? '',
      author: map['author'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      stickerCount: map['stickerCount'] ?? 0,
      coverImage: map['coverImage'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'author': author,
      'createdAt': Timestamp.fromDate(createdAt),
      'stickerCount': stickerCount,
      'coverImage': coverImage,
    };
  }
}
