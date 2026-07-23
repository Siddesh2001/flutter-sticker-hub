class Sticker {
  final String id;

  /// Cloudinary URL
  final String cloudUrl;

  /// Cached local image
  final String localPath;

  final DateTime createdAt;

  final bool isDownloaded;

  final bool isSynced;

  final DateTime? lastSynced;

  const Sticker({
    required this.id,
    required this.cloudUrl,
    required this.localPath,
    required this.createdAt,
    required this.isDownloaded,
    required this.isSynced,
    required this.lastSynced,
  });
}
