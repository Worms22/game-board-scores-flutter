import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crow/crow.dart';
import 'package:dio/dio.dart';
import 'package:duckma_client/duckma_client.dart';
import 'package:flutter_structure/features/base/api/api.dart';
import 'package:get/get.dart';

class ClientService extends Service {
  late Dio _dio;

  HttpClient get client => _client;
  late HttpClient _client;

  RequestRetrier get requestRetrier => _requestRetrier;
  late RequestRetrier _requestRetrier;

  Future<ClientService> init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: Api.baseUrl,
        receiveTimeout: 5000,
        connectTimeout: 5000,
        sendTimeout: 5000,
      ),
    );

    _dio.interceptors.addAll({});
    // TODO(any): add app intersepter.
    _requestRetrier = RequestRetrier(_dio);
    Get.put(_requestRetrier);
    Get.put(
      ConnectivityRequestRetrier(
        Get.find<RequestRetrier>(),
        Connectivity(),
      ),
    );

    _client = HttpClient(
      _dio,
      connectivityRequestRetrier: Get.find<ConnectivityRequestRetrier>(),
    );
    Get.put<HttpClient>(_client);

    return this;
  }
}
