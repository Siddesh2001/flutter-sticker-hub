import 'dart:typed_data';

import '../../domain/repository/storage_repository.dart';
import '../datasource/cloudinary_datasource.dart';

class StorageRepositoryImpl implements StorageRepository {
  final CloudinaryDataSource dataSource;

  StorageRepositoryImpl({required this.dataSource});

  @override
  Future<String> uploadSticker({
    required Uint8List imageBytes,
    required String fileName,
  }) {
    return dataSource.uploadSticker(imageBytes: imageBytes, fileName: fileName);
  }
}
