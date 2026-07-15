import 'dart:typed_data';

import 'package:create_sticker/features/Image/presentation/providers/image_controller.dart';
import 'package:create_sticker/features/sticker/data/domain/entity/sticker_pack.dart';
import 'package:create_sticker/features/sticker/presentation/providers/sticker_details_controller.dart';
import 'package:create_sticker/features/storage/presentation/providers/storage_controller.dart';
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
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(stickerDetailsControllerProvider.notifier)
          .loadStickers(widget.pack.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageState = ref.watch(imageControllerProvider);
    final stickerState = ref.watch(stickerDetailsControllerProvider);
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

                  if (bytes == null) return;
                  try {
                    final imageUrl = await ref
                        .read(storageControllerProvider.notifier)
                        .uploadSticker(bytes);

                    if (imageUrl == null) {
                      throw Exception("Image upload failed");
                    }

                    await ref
                        .read(stickerDetailsControllerProvider.notifier)
                        .addSticker(packId: widget.pack.id, imageUrl: imageUrl);

                    debugPrint("Sticker saved successfully");
                  } catch (e, st) {
                    debugPrint("Error: $e");
                    debugPrintStack(stackTrace: st);
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
              SizedBox(height: 20),

              const SizedBox(height: 30),

              const Text(
                "Stickers",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              Expanded(
                child: stickerState.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),

                  error: (e, _) => Center(child: Text(e.toString())),

                  data: (stickers) {
                    if (stickers.isEmpty) {
                      return const Center(child: Text("No stickers yet"));
                    }

                    return GridView.builder(
                      itemCount: stickers.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemBuilder: (context, index) {
                        final sticker = stickers[index];

                        return GestureDetector(
                          onLongPress: () async {
                            final shouldDelete = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Delete Sticker"),
                                content: const Text(
                                  "Are you sure you want to delete this sticker?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: const Text("Cancel"),
                                  ),
                                  FilledButton(
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                    child: const Text("Delete"),
                                  ),
                                ],
                              ),
                            );

                            if (shouldDelete == true) {
                              await ref
                                  .read(
                                    stickerDetailsControllerProvider.notifier,
                                  )
                                  .deleteSticker(
                                    packId: widget.pack.id,
                                    stickerId: sticker.id,
                                  );

                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Sticker deleted"),
                                  ),
                                );
                              }
                            }
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              sticker.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
