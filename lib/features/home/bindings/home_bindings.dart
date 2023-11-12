import 'package:crow/crow.dart';
import 'package:flutter_structure/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:flutter_structure/features/home/data/data_sources/home_remote_data_source_impl.dart';
import 'package:flutter_structure/features/home/data/home_repository_impl.dart';
import 'package:flutter_structure/features/home/domain/home_repository.dart';
import 'package:flutter_structure/features/home/presentation/view_models/home_view_model.dart';
import 'package:get/get.dart';


class HomeBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut<HomeRemoteDataSource>(HomeRemoteDataSourceImpl.new);

    Get.lazyPut<HomeRepository>(
          () => HomeRepositoryImpl(
        Get.find<HomeRemoteDataSource>(),
      ),
    );

    Get.lazyPut(
          () => HomeViewModel(
        Get.find<HomeRepository>(),
      ),
    );
  }
}
