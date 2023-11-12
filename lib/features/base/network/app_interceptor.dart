import 'dart:io';

import 'package:dio/dio.dart';
import 'package:duckma_client/duckma_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/features/base/extensions/http_extension.dart';
import 'package:flutter_structure/features/base/extensions/localizations_extension.dart';
import 'package:flutter_structure/features/base/sevrices/navigation_service.dart';
import 'package:flutter_structure/features/base/token/domain/entity/token_entity.dart';
import 'package:flutter_structure/features/base/token/domain/token_repository.dart';
import 'package:flutter_structure/features/base/utils/logger.dart';
import 'package:get/get.dart' show ExtensionSnackbar, Get, Inst, SnackPosition;

class AppInterceptor extends Interceptor {
  String? accessToken;

  TokenRepository get _tokenRepository => Get.find<TokenRepository>();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final TokenEntity? tokenEntity = await _tokenRepository.getToken();
    accessToken = tokenEntity?.value;
    options.validateStatus = (int? status) {
      if (status == null) return false;
      if (status == HttpStatus.unauthorized) return false;
      if (status >= HttpStatus.internalServerError) return false;
      return true;
    };

    if (accessToken != null) {
      options.headers = <String, dynamic>{
        HttpHeaders.contentTypeHeader: ContentType.json.value,
        HttpHeaders.acceptHeader: ContentType.json.value,
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
      };
    } else {
      options.headers = <String, dynamic>{
        HttpHeaders.contentTypeHeader: ContentType.json.value,
        HttpHeaders.acceptHeader: ContentType.json.value,
      };
    }

    return handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    final RequestOptions options = response.requestOptions;
    if (response.hasError) {
      if (response.failure == null) return;
      Logger.failed(response.failure, options.path, runtimeType);
      Get.snackbar(
        NavigationService.context.tr.error,
        response.failure!.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
      );
      return handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          response: response,
        ),
      );
    }

    return handler.next(response);
  }
}
