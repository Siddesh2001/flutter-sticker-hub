import 'package:create_sticker/features/auth/presentation/providers/home_provider.dart';
import 'package:create_sticker/features/sticker/presentation/providers/sticker_controller_provider.dart';
import 'package:create_sticker/features/sticker/presentation/widgets/sticker_pack_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(homeControllerProvider);
    final stickerState = ref.watch(stickerControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sticker Hub"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(homeControllerProvider.notifier).signOut();

              if (!context.mounted) return;

              context.go('/login');
            },
          ),
        ],
      ),

      body: userState.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, _) => Center(child: Text(error.toString())),

        data: (user) {
          if (user == null) {
            return const Center(child: Text("No user found"));
          }

          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome 👋",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 30),

                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text("Email"),
                    subtitle: Text(user.email ?? "No email"),
                  ),

                  ListTile(
                    leading: Icon(
                      user.isEmailVerified
                          ? Icons.verified
                          : Icons.error_outline,
                    ),
                    title: const Text("Email Status"),
                    subtitle: Text(
                      user.isEmailVerified ? "Verified" : "Not Verified",
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton.icon(
                      onPressed: () async {
                        // Next feature
                        context.push('/create-pack');
                        ref.invalidate(stickerControllerProvider);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Create Sticker Pack"),
                    ),
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    "Your Sticker Packs",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  stickerState.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),

                    error: (error, _) => Text(error.toString()),

                    data: (packs) {
                      if (packs.isEmpty) {
                        return const Text("No sticker packs yet.");
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: packs.length,
                        itemBuilder: (context, index) {
                          return StickerPackCard(
                            pack: packs[index],
                            onTap: () {
                              context.push(
                                '/pack-details',
                                extra: packs[index],
                              );
                            },

                            onRename: (newName) async {
                              await ref
                                  .read(stickerControllerProvider.notifier)
                                  .renamePack(
                                    packId: packs[index].id,
                                    newName: newName,
                                  );

                              if (!context.mounted) return;

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Sticker pack renamed"),
                                ),
                              );
                            },
                            onDelete: () async {
                              final shouldDelete = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Delete Sticker Pack"),
                                  content: Text(
                                    "Are you sure you want to delete '${packs[index].name}'?",
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

                              if (shouldDelete != true) return;

                              await ref
                                  .read(stickerControllerProvider.notifier)
                                  .deletePack(packs[index].id);

                              if (!context.mounted) return;

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Sticker pack deleted"),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
