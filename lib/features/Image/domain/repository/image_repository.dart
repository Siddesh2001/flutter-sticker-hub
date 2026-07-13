import 'dart:typed_data';

abstract class ImageRepository {
  Future<Uint8List?> pickImageFromGallery();

  Future<Uint8List?> pickImageFromCamera();
}
