import 'dart:typed_data';

import 'package:create_sticker/features/Image/presentation/providers/image_controller.dart';
import 'package:create_sticker/features/sticker/data/domain/entity/sticker_pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class StickerPackDetailsPage extends ConsumerStatefulWidget {
  final StickerPack pack;
  StickerPackDetailsPage({super.key, required this.pack});

  @override
  ConsumerState<StickerPackDetailsPage> createState() =>
      _StickerPackDetailsPageState();
}

class _StickerPackDetailsPageState
    extends ConsumerState<StickerPackDetailsPage> {
  final ImagePicker _picker = ImagePicker();
  Uint8List? selectedImage;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    debugPrint("Selected Image: ${image.path}");
  }

  @override
  Widget build(BuildContext context) {
    final imageState = ref.watch(imageControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Sticker Pack")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.pack.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Text("Author: ${widget.pack.author}"),

              const SizedBox(height: 10),

              Text("Stickers: ${widget.pack.stickerCount}"),

              const SizedBox(height: 10),

              Text("Created: ${widget.pack.createdAt}"),
              SizedBox(height: 20),
              FilledButton.icon(
                onPressed: () async {
                  final bytes = await ref
                      .read(imageControllerProvider.notifier)
                      .pickFromGallery();

                  if (bytes != null) {
                    setState(() {
                      selectedImage = bytes;
                    });
                  }
                },
                icon: const Icon(Icons.add_photo_alternate),
                label: const Text("Add Sticker"),
              ),
              const SizedBox(height: 20),

              if (selectedImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.memory(
                    selectedImage!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
