import 'package:create_sticker/features/sticker/data/domain/entity/sticker_pack.dart';
import 'package:create_sticker/features/sticker/presentation/controller/sticker_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stickerControllerProvider =
    AsyncNotifierProvider<StickerController, List<StickerPack>>(
      StickerController.new,
    );
