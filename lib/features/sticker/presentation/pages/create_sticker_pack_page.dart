import 'package:create_sticker/features/sticker/presentation/providers/sticker_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateStickerPackPage extends ConsumerStatefulWidget {
  const CreateStickerPackPage({super.key});

  @override
  ConsumerState<CreateStickerPackPage> createState() =>
      _CreateStickerPackPageState();
}

class _CreateStickerPackPageState extends ConsumerState<CreateStickerPackPage> {
  final _formKey = GlobalKey<FormState>();

  final _packNameController = TextEditingController();

  final _authorController = TextEditingController();

  @override
  void dispose() {
    _packNameController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stickerState = ref.watch(stickerControllerProvider);
    final isLoading = stickerState.isLoading;
    return Scaffold(
      appBar: AppBar(title: const Text("Create Sticker Pack")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _packNameController,
                decoration: const InputDecoration(
                  labelText: 'Pack Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter pack name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(
                  labelText: 'Author',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter author name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          await ref
                              .read(stickerControllerProvider.notifier)
                              .createPack(
                                name: _packNameController.text.trim(),
                                author: _authorController.text.trim(),
                              );

                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Sticker Pack Created Successfully",
                              ),
                            ),
                          );

                          context.pop();
                        },
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text("Create Sticker Pack"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
