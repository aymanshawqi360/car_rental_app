import 'package:car_rental_app/core/network/dio_factory.dart';
import 'package:car_rental_app/features/auth/verification_code/data/api/verification_constants.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/confirm_verify_code_request.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/request_verify_code.dart';
import 'package:dio/dio.dart';

class VerificationCodeApiService {
  final DioFactory dioFactory;

  VerificationCodeApiService({required this.dioFactory});

  Future<Response> checkIfPhoneNumber({
    required RequestVerifyCode request,
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

  Future<Response> confirmVerifyCode({
    required ConfirmVerifyCodeRequest request,
  }) async {
    try {
      final response = await dioFactory.post(
        VerificationConstants.confirmVerifyCode,
        body: request.toJson(request),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
