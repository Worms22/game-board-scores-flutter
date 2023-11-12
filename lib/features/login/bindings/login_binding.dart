import 'package:crow/crow.dart';
import 'package:flutter_structure/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:flutter_structure/features/login/data/data_sources/login_remote_data_source_impl.dart';
import 'package:flutter_structure/features/login/data/login_repository_impl.dart';
import 'package:flutter_structure/features/login/domain/login_repository.dart';
import 'package:flutter_structure/features/login/presentation/view_models/login_view_model.dart';

import 'package:get/get.dart';

class LoginBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut<LoginRemoteDataSource>(LoginRemoteDataSourceImpl.new);

    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(
        Get.find<LoginRemoteDataSource>(),
      ),
    );

    Get.lazyPut(
      () => LoginViewModel(
        Get.find<LoginRepository>(),
      ),
    );
  }
}
