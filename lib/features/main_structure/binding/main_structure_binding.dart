import 'package:duckma_crow_flutter/duckma_crow_flutter.dart';
import 'package:game_board_scores/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:game_board_scores/features/home/data/data_sources/home_remote_data_source_impl.dart';
import 'package:game_board_scores/features/home/data/home_repository_impl.dart';
import 'package:game_board_scores/features/home/domain/home_repository.dart';
import 'package:game_board_scores/features/home/presentation/view_models/home_view_model.dart';
import 'package:game_board_scores/features/main_structure/data/data_sources/main_structure_data_source.dart';
import 'package:game_board_scores/features/main_structure/data/data_sources/main_structure_data_source_impl.dart';
import 'package:game_board_scores/features/main_structure/data/main_structure_repository_impl.dart';
import 'package:game_board_scores/features/main_structure/domain/main_structure_repository.dart';
import 'package:game_board_scores/features/main_structure/main_view_model.dart';
import 'package:game_board_scores/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:game_board_scores/features/profile/data/data_sources/profile_remote_data_source_impl.dart';
import 'package:game_board_scores/features/profile/data/profile_repository_impl.dart';
import 'package:game_board_scores/features/profile/domain/profile_repository.dart';
import 'package:game_board_scores/features/profile/presentation/view_models/profile_view_model.dart';
import 'package:game_board_scores/features/saved/data/data_sources/saved_remote_data_source.dart';
import 'package:game_board_scores/features/saved/data/data_sources/saved_remote_data_source_impl.dart';
import 'package:game_board_scores/features/saved/data/saved_repository_impl.dart';
import 'package:game_board_scores/features/saved/domain/saved_repository.dart';
import 'package:game_board_scores/features/saved/presentation/view_models/saved_view_model.dart';
import 'package:get/get.dart';



class MainStructureBinding extends Binding {
  @override
  void dependencies() {

    //home bindings
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

    //saved binding
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

    //profile
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


    //main structure bindings
    Get.lazyPut<MainStructureDataSource>(MainStructureDataSourceImpl.new);

    Get.lazyPut<MainStructureRepository>(
          () => MainStructureRepositoryImpl(
        Get.find<MainStructureDataSource>(),
      ),
    );

    Get.lazyPut(
          () => MainViewModel(
        Get.find<MainStructureRepository>(),
      ),
    );
  }
}
