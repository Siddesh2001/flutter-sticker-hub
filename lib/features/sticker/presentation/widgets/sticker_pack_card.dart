import 'package:create_sticker/features/sticker/data/domain/entity/sticker_pack.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StickerPackCard extends StatelessWidget {
  final StickerPack pack;
  final VoidCallback? onTap;

  const StickerPackCard({super.key, required this.pack, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: () {
          context.push('/pack-details', extra: pack);
        },
        leading: const CircleAvatar(child: Icon(Icons.collections)),
        title: Text(pack.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Author: ${pack.author}"),
            Text("Stickers: ${pack.stickerCount}"),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
