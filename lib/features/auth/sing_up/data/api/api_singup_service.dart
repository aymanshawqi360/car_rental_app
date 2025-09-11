import 'package:car_rental_app/core/network/dio_factory.dart';
import 'package:car_rental_app/features/auth/sing_up/data/api/api_singup_constants.dart';
import 'package:car_rental_app/features/auth/sing_up/data/model/request_api_model.dart';
import 'package:dio/dio.dart';

class ApiSingUpService {
  final DioFactory dioFactory;

  ApiSingUpService({required this.dioFactory});

  Future<Response> singUp({required RequestApiModel requestApiModel}) async {
    try {
      final response = await dioFactory.post(
        ApiSingupConstants.singUpPath,
        body: requestApiModel.toJson(requestApiModel),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
