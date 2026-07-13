import 'package:create_sticker/features/sticker/data/domain/entity/sticker_pack.dart';
import 'package:flutter/material.dart';

class StickerPackDetailsPage extends StatelessWidget {
  final StickerPack pack;
  const StickerPackDetailsPage({super.key, required this.pack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sticker Pack")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pack.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Text("Author: ${pack.author}"),

              const SizedBox(height: 10),

              Text("Stickers: ${pack.stickerCount}"),

              const SizedBox(height: 10),

              Text("Created: ${pack.createdAt}"),
            ],
          ),
        ),
      ),
    );
  }
}
