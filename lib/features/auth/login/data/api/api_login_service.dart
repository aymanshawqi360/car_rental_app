import 'package:car_rental_app/core/network/dio_factory.dart';
import 'package:car_rental_app/features/auth/login/data/api/api_login_constants.dart';
import 'package:car_rental_app/features/auth/login/data/model/login_request_body.dart';
import 'package:dio/dio.dart';

class ApiLoginService {
  final DioFactory dioFactory;

  ApiLoginService({required this.dioFactory});

  Future<Response> login({required LoginRequestBody loginRequestBody}) async {
    try {
      final resulte = await dioFactory.post(
        ApiLoginConstants.login,
        body: loginRequestBody.toJson(loginRequestBody),
      );
      return resulte;
    } catch (e) {
      rethrow;
    }
  }
}
