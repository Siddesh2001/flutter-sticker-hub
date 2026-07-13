import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/image_picker_datasource.dart';
import '../../data/repository/image_repository_impl.dart';
import '../../domain/repository/image_repository.dart';

final imagePickerDataSourceProvider = Provider<ImagePickerDataSource>((ref) {
  return ImagePickerDataSource();
});

final imageRepositoryProvider = Provider<ImageRepository>((ref) {
  return ImageRepositoryImpl(
    dataSource: ref.read(imagePickerDataSourceProvider),
  );
});
