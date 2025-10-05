import 'package:car_rental_app/core/constants/secure_storage.dart';
import 'package:car_rental_app/core/error/api_error_handler.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/core/network/base_url.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApiInterceptorsWrapper extends Interceptor {
  final Dio dio;

  ApiInterceptorsWrapper({required this.dio});
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final excludedEndpoints = ['/login', '/signup', '/token/refresh/'];

    // if (!excludedEndpoints.any((test) => options.path.contains(test))) {
    String accessToken =
        await SecureStorage.getData(token: Token.accessToken) ?? "";

    if (!accessToken.isNullOrEmp()) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      debugPrint("accessToken");
    } else {
      debugPrint("Error in [ONREQUEST]");
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
      "ERORR[${err.response?.statusCode}] => PATH : ${err.requestOptions.path}",
    );

    // err.requestOptions.path.contains(Routes.login) &&
    // err.requestOptions.path.contains(Routes.signUp)
    if (err.response?.statusCode == 401) {
      final refreshResult = await refreshToken(dio: dio);

      if (refreshResult is Success<String>) {
        RequestOptions requestOptions = err.requestOptions;
        await SecureStorage.setData(
          token: Token.refreshToken,
          value: refreshResult.data ?? "",
        );
        requestOptions.headers['Authorization'] =
            "Bearer ${refreshResult.data}";

        return handler.resolve(await dio.fetch(requestOptions));
      } else if (refreshResult is Failure<String>) {
        //! Delete [Access_token] Or [Refresh_token]

        await SecureStorage.delete(token: Token.accessToken);
        await SecureStorage.delete(token: Token.refreshToken);

        return handler.reject(err);
      }
    }

    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("[RESPONSE] : ${response.statusCode}");
    return handler.next(response);
  }

  Future<ApiResulte<String>> refreshToken({required Dio dio}) async {
    final responseRefreshToken = await SecureStorage.getData(
      token: Token.refreshToken,
    );
    try {
      final response = await dio.post(
        "${BaseUrl.baseUrl}auth/token/refresh/",
        data: {'refresh': responseRefreshToken},
      );

      return ApiResulte.success(response.data["access"]);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }
}
