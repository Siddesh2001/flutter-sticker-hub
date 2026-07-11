class StickerPack {
  final String id;
  final String name;
  final String author;
  final DateTime createdAt;
  final int stickerCount;
  final String coverImage;

  StickerPack({
    required this.id,
    required this.name,
    required this.author,
    required this.createdAt,
    required this.stickerCount,
    required this.coverImage,
  });
}
