import 'package:create_sticker/features/sticker/data/domain/entity/sticker_pack.dart';
import 'package:create_sticker/features/sticker/presentation/providers/sticker_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StickerController extends AsyncNotifier<List<StickerPack>> {
  @override
  Future<List<StickerPack>> build() async {
    return ref.read(stickerRepositoryProvider).getStickerPacks();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    final packs = await ref.read(stickerRepositoryProvider).getStickerPacks();

    state = AsyncData(packs);
  }

  Future<void> createPack({
    required String name,
    required String author,
  }) async {
    await ref
        .read(stickerRepositoryProvider)
        .createPack(name: name, author: author);

    await refresh();
  }

  Future<void> renamePack({
    required String packId,
    required String newName,
  }) async {
    await ref
        .read(stickerRepositoryProvider)
        .renamePack(packId: packId, newName: newName);

    await refresh();
  }

  Future<void> deletePack(String id) async {
    await ref.read(stickerRepositoryProvider).deletePack(id);

    await refresh();
  }

  Future<void> setCoverImage({
    required String packId,
    required String imageUrl,
  }) async {
    await ref
        .read(stickerRepositoryProvider)
        .setCoverImage(packId: packId, imageUrl: imageUrl);

    await refresh();
  }
}
