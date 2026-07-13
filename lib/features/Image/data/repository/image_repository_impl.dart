import 'dart:typed_data';

import '../../domain/repository/image_repository.dart';
import '../datasource/image_picker_datasource.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImagePickerDataSource dataSource;

  ImageRepositoryImpl({required this.dataSource});

  @override
  Future<Uint8List?> pickImageFromGallery() {
    return dataSource.pickImageFromGallery();
  }

  @override
  Future<Uint8List?> pickImageFromCamera() {
    return dataSource.pickImageFromCamera();
  }
}
