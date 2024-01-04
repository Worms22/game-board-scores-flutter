import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/seven_wonders/presentation/view_models/seven_wonders_view_model.dart';
import 'package:get/get.dart';


class SevenWondersBinding extends Binding {
  @override
  void dependencies() {
    /*
    Get.lazyPut<HomeRemoteDataSource>(HomeRemoteDataSourceImpl.new);

    Get.lazyPut<HomeRepository>(
          () => HomeRepositoryImpl(
        Get.find<HomeRemoteDataSource>(),
      ),
    );
*/
    Get.lazyPut(
          SevenWondersViewModel.new,
    );

  }
}
