import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:tcb_recru_task/data/networking/api_result.dart';
import 'package:tcb_recru_task/domain/app_error.dart';

typedef FactoryMethod<T> = T Function(Map<String, dynamic> json);

abstract final class ApiResponseResolver {
  static Response<ApiResult<T>> resolve<T>(
    Response<dynamic> response,
    FactoryMethod<T> factoryMethod,
  ) {
    final body = json.decode(response.body);

    try {
      final data = factoryMethod(body);
      return response.copyWith(body: ApiResultSuccess(data));
    } catch (_) {
      return response.copyWith(body: ApiResultFailure(apiError));
    }
  }

  static Response<ApiResult<List<T>>> resolveList<T>(
    Response<dynamic> response,
    FactoryMethod<T> factoryMethod,
  ) {
    final body = json.decode(response.body);

    switch (body) {
      case List<dynamic>():
        try {
          List<T> data = <T>[];
          for (final element in body) {
            if (element is Map<String, dynamic>) {
              data.add(factoryMethod(element));
            }
          }

          return response.copyWith(body: ApiResultSuccess(data));
        } catch (_) {
          return response.copyWith(body: ApiResultFailure(apiError));
        }

      default:
        return response.copyWith(body: ApiResultFailure(apiError));
    }
  }
}
