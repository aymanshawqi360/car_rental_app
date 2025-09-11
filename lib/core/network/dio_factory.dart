import 'package:car_rental_app/core/network/api_consumer.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory extends ApiConsumer {
  final Dio dio;

  DioFactory({required this.dio}) {
    final time = const Duration(seconds: 30);
    dio.options = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      connectTimeout: time,
      receiveTimeout: time,
      //  headers: {'Content-Type': 'application/json'},
    );

    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }

  @override
  Future<Response> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await dio.post(path, data: body);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
