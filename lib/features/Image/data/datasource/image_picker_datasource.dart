import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class ImagePickerDataSource {
  final ImagePicker _picker = ImagePicker();

  Future<Uint8List?> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    return await image.readAsBytes();
  }

  Future<Uint8List?> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image == null) return null;

    return await image.readAsBytes();
  }
}
