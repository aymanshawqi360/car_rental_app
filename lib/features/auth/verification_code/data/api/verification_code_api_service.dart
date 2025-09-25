import 'package:car_rental_app/core/network/dio_factory.dart';
import 'package:car_rental_app/features/auth/verification_code/data/api/verification_constants.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/verification_code_request_body.dart';
import 'package:dio/dio.dart';

class VerificationCodeApiService {
  final DioFactory dioFactory;

  VerificationCodeApiService({required this.dioFactory});

  Future<Response> checkIfPhoneNumber({
    required VerificationCodeRequestBody request,
  }) async {
    try {
      final response = await dioFactory.post(
        VerificationConstants.requestVerifyCode,
        body: request.toJson(request),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
