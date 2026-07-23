class StickerPack {
  final String id;
  final String name;
  final String author;

  /// Cloudinary URL
  final String coverImageCloudUrl;

  /// Cached local file
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
    required this.lastSynced,
  });
}
