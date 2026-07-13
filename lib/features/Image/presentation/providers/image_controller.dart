import 'dart:typed_data';

import 'package:create_sticker/features/Image/presentation/providers/image_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageController extends AsyncNotifier<Uint8List?> {
  @override
  Future<Uint8List?> build() async {
    return null;
  }

  Future<Uint8List?> pickFromGallery() async {
    state = const AsyncLoading();

    final bytes = await ref
        .read(imageRepositoryProvider)
        .pickImageFromGallery();

    state = AsyncData(bytes);

    return bytes;
  }

  Future<Uint8List?> pickFromCamera() async {
    state = const AsyncLoading();

    final bytes = await ref.read(imageRepositoryProvider).pickImageFromCamera();

    state = AsyncData(bytes);

    return bytes;
  }
}

final imageControllerProvider =
    AsyncNotifierProvider<ImageController, Uint8List?>(ImageController.new);
