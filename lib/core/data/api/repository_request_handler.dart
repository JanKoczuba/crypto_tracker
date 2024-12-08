import 'dart:async';

import 'package:crypto_tracker/core/app/safe_print.dart';
import 'package:crypto_tracker/core/data/api/failures/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class RepositoryRequestHandler {
  RepositoryRequestHandler();

  Future<Either<Failure, T>> makeRequest<T>({
    required Future<Either<Failure, T>> Function() request,
    Failure? customFailure,
  }) async {
    try {
      return await request();
    } catch (error) {
      safePrint(error.toString());

      final failure = customFailure ?? handleError(error);

      final String errorMessage = '\n$error, $failure\n';

      safePrint(errorMessage);

      return left(failure);
    }
  }

  Failure handleError(Object e) {
    safePrint("Exception (${e.runtimeType}): $e");

    if (kDebugMode && e is Error) {
      safePrint(e.stackTrace.toString());
    }

    if (e is DioException) {
      safePrint("Path: ${e.response?.requestOptions.path ?? 'Unknown'}");
      return _handleDioError(e);
    }

    if (e is TypeError) {
      return const Failure.invalidResponse();
    }

    return const Failure.unknown();
  }

  Failure _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return const Failure.serverConnectionFailure();
    }

    if (e.type == DioExceptionType.badResponse) {
      final Response? response = e.response;

      if (response == null) {
        return const Failure.serverError();
      }

      safePrint('DioErrorResponse: $response');

      final statusCode = response.statusCode;

      if (statusCode == 404) {
        return const Failure.notFound();
      }

      if (statusCode != null && statusCode >= 400 && statusCode <= 499) {
        return Failure.badRequest(message: _tryParseErrorMessage(response));
      }

      if (statusCode != null && statusCode >= 500 && statusCode <= 599) {
        return const Failure.serverError();
      }

      if (statusCode != 400) {
        return const Failure.invalidResponse();
      }

      safePrint('Data: ${_tryParseErrorMessage(response)}');
    }

    return const Failure.unknown();
  }

  String? _tryParseErrorMessage(Response<dynamic> response) {
    final data = response.data;
    if (data is! Map<String, dynamic>) {
      return null;
    }

    final errorMessage = data['message'];
    if (errorMessage is! String) {
      return null;
    }

    return errorMessage;
  }
}
