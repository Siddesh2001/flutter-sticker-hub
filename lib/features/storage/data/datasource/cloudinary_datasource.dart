import 'dart:convert';
import 'dart:typed_data';

import 'package:create_sticker/core/constants/cloudinary_constants.dart';
import 'package:http/http.dart' as http;

class CloudinaryDataSource {
  Future<String> uploadSticker({
    required Uint8List imageBytes,
    required String fileName,
  }) async {
    final uri = Uri.parse(
      'https://api.cloudinary.com/v1_1/${CloudinaryConstants.cloudName}/image/upload',
    );

    final request = http.MultipartRequest('POST', uri);

    request.fields['upload_preset'] = CloudinaryConstants.uploadPreset;

    request.files.add(
      http.MultipartFile.fromBytes('file', imageBytes, filename: fileName),
    );

    final response = await request.send();

    if (response.statusCode != 200) {
      throw Exception('Image upload failed');
    }

    final body = await response.stream.bytesToString();

    final data = jsonDecode(body);

    return data['secure_url'];
  }
}
