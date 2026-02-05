import 'package:car_rental_app/core/network/dio_factory.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/features/auth/sign_up/data/api/api_sign_up_constants.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:dio/dio.dart';

class ApiSignUpService {
  final DioFactory dioFactory;

  ApiSignUpService({required this.dioFactory});

  Future<Response> singUp({required SignUpRequestBody requestApiModel}) async {
    try {
      final response = await dioFactory.post(
        ApiSingUpConstants.singUpPath,
        body: requestApiModel.toJson(requestApiModel),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> countries({required int query}) async {
    try {
      final response = await dioFactory.get(
        ApiSingUpConstants.countries,
        queryParametes: {"page": query},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getLocation({required int query}) async {
    try {
      final response = await dioFactory.get(
        ApiSingUpConstants.location,
        queryParametes: {AppStrings.page: query},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
