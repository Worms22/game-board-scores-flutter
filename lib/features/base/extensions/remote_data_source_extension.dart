import 'package:duckma_crow_flutter/duckma_crow_flutter.dart' show RemoteDataSource;
import 'package:duckma_client/duckma_client.dart' show HttpClient;
import 'package:game_board_scores/features/base/network/client_service.dart';
import 'package:get/get.dart' show Get, Inst;

extension RemoteDataSourceExtension on RemoteDataSource {
  HttpClient get client => Get.find<ClientService>().client;
}
