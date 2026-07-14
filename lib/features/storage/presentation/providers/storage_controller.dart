import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'storage_providers.dart';

class StorageController extends AsyncNotifier<String?> {
  @override
  Future<String?> build() async {
    return null;
  }

  Future<String?> uploadSticker(Uint8List bytes) async {
    state = const AsyncLoading();

    try {
      final fileName = 'sticker_${DateTime.now().millisecondsSinceEpoch}.png';
      final url = await ref
          .read(storageRepositoryProvider)
          .uploadSticker(imageBytes: bytes, fileName: fileName);

      state = AsyncData(url);

      return url;
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }
}

final storageControllerProvider =
    AsyncNotifierProvider<StorageController, String?>(StorageController.new);
