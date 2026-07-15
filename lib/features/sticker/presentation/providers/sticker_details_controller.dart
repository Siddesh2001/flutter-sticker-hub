import 'package:create_sticker/features/sticker/data/domain/entity/sticker.dart';
import 'package:create_sticker/features/sticker/presentation/providers/sticker_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StickerDetailsController extends AsyncNotifier<List<Sticker>> {
  @override
  Future<List<Sticker>> build() async {
    return [];
  }

  Future<void> loadStickers(String packId) async {
    state = const AsyncLoading();

    try {
      debugPrint("Loading stickers for pack: $packId");

      final stickers = await ref
          .read(stickerRepositoryProvider)
          .getStickers(packId);

      debugPrint("Loaded ${stickers.length} stickers");

      state = AsyncData(stickers);
    } catch (e, st) {
      debugPrint("ERROR LOADING STICKERS");
      debugPrint(e.toString());
      debugPrintStack(stackTrace: st);

      state = AsyncError(e, st);
    }
  }

  Future<void> addSticker({
    required String packId,
    required String imageUrl,
  }) async {
    await ref
        .read(stickerRepositoryProvider)
        .addSticker(packId: packId, imageUrl: imageUrl);

    await loadStickers(packId);
  }

  Future<void> deleteSticker({
    required String packId,
    required String stickerId,
  }) async {
    await ref
        .read(stickerRepositoryProvider)
        .deleteSticker(packId: packId, stickerId: stickerId);

    await loadStickers(packId);
  }
}

final stickerDetailsControllerProvider =
    AsyncNotifierProvider<StickerDetailsController, List<Sticker>>(
      StickerDetailsController.new,
    );
