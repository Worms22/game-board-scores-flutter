import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/signup/data/data_sources/signup_data_source.dart';
import 'package:game_board_scores/features/signup/data/data_sources/signup_data_source_impl.dart';
import 'package:game_board_scores/features/signup/data/signup_repository_impl.dart';
import 'package:game_board_scores/features/signup/domain/signup_repository.dart';
import 'package:game_board_scores/features/signup/presentation/view_models/signup_view_model.dart';

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
