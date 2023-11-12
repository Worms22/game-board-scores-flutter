import 'dart:developer' as developer;

import 'package:duckma_client/duckma_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_environment/flutter_environment.dart';
import 'package:flutter_structure/features/base/failures/server_failure/server_failure.dart';

enum LogStatus {
  tyring,
  success,
  failure,
}

abstract class Logger {
  /// Capture any error and log it.
  ///
  /// If the app is in [Environment.isProduction] this will sent the exception
  /// to sentry.
  ///
  /// * throwable, the throwable object.
  /// * runtimeType, This will help to have a localized message.
  /// * info, the custom information to sent sentry.
  /// * stackTrace, the stackTrace of the error.
  static void capture(
    Object throwable,
    Type runtimeType,
    StackTrace stackTrace, {
    String? info,
  }) {
    if (Environment.isProduction) {
      return;
    }

    if (throwable is HttpException) {
      _httpReportInfo(throwable);
    }

    developer.log(
      info ?? throwable.toString(),
      name: runtimeType.toString(),
      level: 2000,
      stackTrace: stackTrace,
    );
  }

  static bool get isActivate => !kReleaseMode;

  static void log(String message, {String title = '', LogStatus? status}) {
    if (!isActivate) return;
    final StringBuffer buffer = StringBuffer();

    buffer.writeln('timestamp: ${DateTime.now()}');
    if (status != null) buffer.writeln('status: ${status.name.toUpperCase()}');
    buffer.writeln('message: $message');

    final String result = buffer.toString();
    buffer.clear();

    developer.log(result, name: title);
  }

  static void errorLog(
      Object throwable,
      StackTrace stackTrace,
      Type scope, {
        String info = '',
      }) {
    if (!isActivate) return;
    developer.log(
      info,
      name: scope.toString(),
      level: 2000,
      stackTrace: stackTrace,
    );
  }

  static void httpLog(HttpException exception, Type scope) {
    if (!isActivate) return;
    final StringBuffer buffer = StringBuffer();

    buffer
      ..writeln()
      ..writeln('api_path: ${exception.requestOptions.path}')
      ..writeln('api_message: $exception')
      ..writeln()
      ..writeln('api_headers: ${exception.requestOptions.headers}')
      ..writeln()
      ..writeln('api_body: ${exception.requestOptions.data}')
      ..writeln()
      ..writeln('timestamp: ${DateTime.now()}');

    final String result = buffer.toString();
    buffer.clear();

    developer.log(
      result,
      name: scope.toString(),
      level: 2000,
      stackTrace: exception.stackTrace,
    );
  }

  static void trying(String methodName, Type runtimeType) {
    log(
      'Trying to $methodName.',
      title: '$runtimeType.$methodName',
      status: LogStatus.tyring,
    );
  }

  static void failed(
    ServerFailure? failure,
      String methodName,
      Type runtimeType,
      ) {
    if (!isActivate) return;
    if (failure == null) return;
    final StringBuffer buffer = StringBuffer();

    buffer
      ..writeln('timestamp: ${DateTime.now()}')
      ..writeln('status: ${LogStatus.failure.name.toUpperCase()}')
      ..writeln('message: ${failure.message}')
      ..writeln('code: ${failure.code}');

    final String result = buffer.toString();
    buffer.clear();

    developer.log(result, name: '$runtimeType.$methodName');
  }

  static void success(String methodName, Type runtimeType) {
    log(
      '$methodName has been successful.',
      title: '$runtimeType.$methodName',
      status: LogStatus.success,
    );
  }
}

String _httpReportInfo(HttpException exception) {
  final StringBuffer buffer = StringBuffer();

  buffer
    ..writeln('api_path: ${exception.requestOptions.path}')
    ..writeln('api_headers: ${exception.requestOptions.headers}')
    ..writeln('api_data: ${exception.requestOptions.data}')
    ..writeln('api_message: ${exception.message}')
    ..writeln('timestamp: ${DateTime.now()}');

  final String result = buffer.toString();
  buffer.clear();
  return result;
}
