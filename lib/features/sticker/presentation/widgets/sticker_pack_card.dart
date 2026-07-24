import 'dart:io';

import 'package:create_sticker/features/sticker/data/domain/entity/sticker_pack.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StickerPackCard extends StatelessWidget {
  final StickerPack pack;
  final VoidCallback? onTap;
  final Future<void> Function(String newName) onRename;
  final VoidCallback onDelete;

  const StickerPackCard({
    super.key,
    required this.pack,
    required this.onTap,
    required this.onRename,
    required this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    Future<void> _showRenameDialog(BuildContext context) async {
      final controller = TextEditingController(text: pack.name);

      final newName = await showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Rename Sticker Pack"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: "Pack Name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context, controller.text.trim());
              },
              child: const Text("Save"),
            ),
          ],
        ),
      );

      if (newName == null || newName.isEmpty) return;
      await onRename(newName.trim());
      // We'll connect this in the next step.
    }

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: onTap,

        onLongPress: () async {
          final action = await showModalBottomSheet<String>(
            context: context,
            builder: (_) => SafeArea(
              child: Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text("Rename"),
                    onTap: () => Navigator.pop(context, "rename"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete, color: Colors.red),
                    title: const Text("Delete"),
                    onTap: () => Navigator.pop(context, "delete"),
                  ),
                ],
              ),
            ),
          );

          if (action == "rename") {
            await _showRenameDialog(context);
          }

          if (action == "delete") {
            onDelete();
          }
        },

        leading: pack.coverImageLocalPath.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(pack.coverImageLocalPath),
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              )
            : pack.coverImageCloudUrl.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  pack.coverImageCloudUrl,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              )
            : const CircleAvatar(child: Icon(Icons.collections)),
        title: Text(pack.name),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Author: ${pack.author}"),
            Text("${pack.stickerCount} Stickers"),
          ],
        ),

        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
