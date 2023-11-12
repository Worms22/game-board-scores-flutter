import 'package:crow/crow.dart';
import 'package:flutter_structure/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:flutter_structure/features/profile/data/data_sources/profile_remote_data_source_impl.dart';
import 'package:flutter_structure/features/profile/data/profile_repository_impl.dart';
import 'package:flutter_structure/features/profile/domain/profile_repository.dart';
import 'package:flutter_structure/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:get/get.dart';


class ProfileBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut<ProfileRemoteDataSource>(ProfileRemoteDataSourceImpl.new);

    Get.lazyPut<ProfileRepository>(
          () => ProfileRepositoryImpl(
        Get.find<ProfileRemoteDataSource>(),
      ),
    );

    Get.lazyPut(
          () => ProfileViewModel(
        Get.find<ProfileRepository>(),
      ),
    );
  }
}
