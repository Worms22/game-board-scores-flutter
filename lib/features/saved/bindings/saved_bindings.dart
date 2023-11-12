import 'package:crow/crow.dart';
import 'package:flutter_structure/features/saved/data/data_sources/saved_remote_data_source.dart';
import 'package:flutter_structure/features/saved/data/data_sources/saved_remote_data_source_impl.dart';
import 'package:flutter_structure/features/saved/data/saved_repository_impl.dart';
import 'package:flutter_structure/features/saved/domain/saved_repository.dart';
import 'package:flutter_structure/features/saved/presentation/view_models/saved_view_model.dart';
import 'package:get/get.dart';


class SavedBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut<SavedRemoteDataSource>(SavedRemoteDataSourceImpl.new);

    Get.lazyPut<SavedRepository>(
          () => SavedRepositoryImpl(
        Get.find<SavedRemoteDataSource>(),
      ),
    );

    Get.lazyPut(
          () => SavedViewModel(
        Get.find<SavedRepository>(),
      ),
    );
  }
}
