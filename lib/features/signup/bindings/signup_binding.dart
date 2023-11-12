import 'package:crow/crow.dart';
import 'package:flutter_structure/features/signup/data/data_sources/signup_data_source.dart';
import 'package:flutter_structure/features/signup/data/data_sources/signup_data_source_impl.dart';
import 'package:flutter_structure/features/signup/data/signup_repository_impl.dart';
import 'package:flutter_structure/features/signup/domain/signup_repository.dart';
import 'package:flutter_structure/features/signup/presentation/view_models/signup_view_model.dart';

import 'package:get/get.dart';

class SignupBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut<SignupDataSource>(SignupDataSourceImpl.new);

    Get.lazyPut<SignupRepository>(
      () => SignupRepositoryImpl(
        Get.find<SignupDataSource>(),
      ),
    );

    Get.lazyPut(
      () => SignupViewModel(
        Get.find<SignupRepository>(),
      ),
    );
  }
}
