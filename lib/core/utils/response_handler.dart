import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/resources/data_state.dart';
import 'package:control_card_prototype/core/utils/network_utils.dart';
import 'package:retrofit/dio.dart';

/// Utility to validate HTTP + App status and return either success or failure wrapper.
DataState<E> handleResponse<T, E>({
  required HttpResponse<T> response,
  required E Function(T model) toEntity,
}) {
  final ResponseCode? responseCode = ResponseCode.getByValue(
    response.response.statusCode,
  );
  final dynamic body = response.response.data;
  final StatusCode? statusCode = StatusCode.getByValue(body?['status']);
  // handle http response code
  if (responseCode == ResponseCode.success) {
    // some responses does not have any status code ignoring it
    if (statusCode == null) {
      final E entity = toEntity(response.data);
      return DataSuccess<E>(entity);
    }
    final bool isAppSuccess =
        statusCode == StatusCode.success ||
        statusCode == StatusCode.snsSuccess ||
        statusCode == StatusCode.otherSuccess;

    if (isAppSuccess) {
      final E entity = toEntity(response.data);
      return DataSuccess<E>(entity);
    } else {
      return DataFailed<E>(status: statusCode);
    }
  } else {
    return DataFailed<E>(status: StatusCode.values.first);
  }
}

/// safe api call with exception handling
Future<DataState<T>> safeApiCall<T>(
  Future<DataState<T>> Function() operation, {
  bool checkInternet = false,
}) async {
  try {
    if (checkInternet) {
      if (await NetworkUtils.isConnected()) {
        return await operation();
      } else {
        return NetworkFailed<T>(status: StatusCode.internetError);
      }
    } else {
      return await operation();
    }
  } on DioException catch (e) {
    debugPrint('safeApiCall DioException ${e.stackTrace}');
    final dynamic body = e.response?.data;
    final StatusCode? statusCode = StatusCode.getByValue(body?['status']);
    debugPrint('safeApiCall appStatusCode $statusCode');
    return DataFailed<T>(status: statusCode ?? StatusCode.values.first);
  }
  // on TypeError catch (e) {
  //   debugPrint('safeApiCall TypeError ${e.stackTrace}');
  //   return DataFailed<T>(status: StatusCode.values.first);
  // }
  on FormatException catch (e) {
    debugPrint('safeApiCall FormatException ${e.toString()}');
    return DataFailed<T>(status: StatusCode.values.first);
  } on Exception catch (e) {
    debugPrint('safeApiCall Generic exception ${e.toString()}');
    return DataFailed<T>(status: StatusCode.values.first);
  }
}
