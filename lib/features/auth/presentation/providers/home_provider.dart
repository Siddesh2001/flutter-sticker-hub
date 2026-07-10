import 'package:create_sticker/features/auth/domain/entities/appUser.dart';
import 'package:create_sticker/features/auth/presentation/controllers/Home_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider = AsyncNotifierProvider<HomeController, appuser?>(
  HomeController.new,
);
