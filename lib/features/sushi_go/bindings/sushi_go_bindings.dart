import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:game_board_scores/features/home/data/data_sources/home_remote_data_source_impl.dart';
import 'package:game_board_scores/features/home/data/home_repository_impl.dart';
import 'package:game_board_scores/features/home/domain/home_repository.dart';
import 'package:game_board_scores/features/home/presentation/view_models/home_view_model.dart';
import 'package:game_board_scores/features/sushi_go/presentation/view_models/sushi_go_view_model.dart';
import 'package:get/get.dart';


class SushiGoBinding extends Binding {
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
          SushiGoViewModel.new,
    );

  }
}
