import 'dart:typed_data';

abstract class StorageRepository {
  Future<String> uploadSticker({
    required Uint8List imageBytes,
    required String fileName,
  });
}
