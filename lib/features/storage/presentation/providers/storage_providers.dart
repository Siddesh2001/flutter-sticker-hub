import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/cloudinary_datasource.dart';
import '../../data/repository/storage_repository_impl.dart';
import '../../domain/repository/storage_repository.dart';

final cloudinaryDataSourceProvider = Provider<CloudinaryDataSource>((ref) {
  return CloudinaryDataSource();
});

final storageRepositoryProvider = Provider<StorageRepository>((ref) {
  return StorageRepositoryImpl(
    dataSource: ref.read(cloudinaryDataSourceProvider),
  );
});
