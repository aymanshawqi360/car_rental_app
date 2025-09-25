import 'package:car_rental_app/core/error/api_error_handler.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/verification_code/data/api/verification_code_api_service.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/verification_code_request_body.dart';
import 'package:car_rental_app/features/auth/verification_code/domain/repo/verification_code_repo.dart';

class VerificationCodeRepoImplementation extends VerificationCodeRepo {
  final VerificationCodeApiService verificationCodeApiService;

  VerificationCodeRepoImplementation({
    required this.verificationCodeApiService,
  });
  @override
  Future<ApiResulte<dynamic>> checkIfPhoneNumber(
    VerificationCodeRequestBody request,
  ) async {
    try {
      final response = await verificationCodeApiService.checkIfPhoneNumber(
        request: request,
      );
      return ApiResulte.success(response);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }
}
