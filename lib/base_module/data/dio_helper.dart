import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../presentation/core/values/constants.dart';

class DioHelper {
  static Dio dio = _initializeDio();

  static Dio _initializeDio() {
    final dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: {},
      connectTimeout: const Duration(milliseconds: 3000000),
      receiveTimeout: const Duration(milliseconds: 1000000),
      followRedirects: true,
      responseType: ResponseType.json,
      receiveDataWhenStatusError: true,
      contentType: ResponseType.plain.toString(),
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        debugPrint(e.toString());
        Response res = _handleDioError(e);
        handler.resolve(res);
      },
    ));
    return dio;
  }

  static Response _handleDioError(DioException dioError) {
    String message;
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.unknown:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        switch (dioError.response!.statusCode) {
          case 400:
            message = 'Bad request';
            break;
          case 404:
            message = "404 bad request";
            break;
          case 422:
            message = "422 bad request";
            break;
          case 500:
            message = 'Internal server error';
            break;
          default:
            message = 'Oops something went wrong';
            break;
        }
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
    return Response(
        requestOptions: RequestOptions(path: ""),
        data: dioError.response?.data,
        statusMessage: message,
        statusCode: dioError.response?.statusCode ?? 500);
  }
}
