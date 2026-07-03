import 'package:create_sticker/core/routes/app_router.dart';
import 'package:flutter/material.dart';

class StickerHubApp extends StatelessWidget {
  const StickerHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sticker Hub',

      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),

      routerConfig: appRouter,
    );
  }
}
