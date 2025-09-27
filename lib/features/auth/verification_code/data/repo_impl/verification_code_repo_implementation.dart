import 'package:car_rental_app/config/Shared/user_data_response.dart';
import 'package:car_rental_app/core/error/api_error_handler.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/verification_code/data/api/verification_code_api_service.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/confirm_verify_code_request.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/verification_code_api_response.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/request_verify_code.dart';
import 'package:car_rental_app/features/auth/verification_code/domain/repo/verification_code_repo.dart';

class VerificationCodeRepoImplementation extends VerificationCodeRepo {
  final VerificationCodeApiService verificationCodeApiService;

  VerificationCodeRepoImplementation({
    required this.verificationCodeApiService,
  });
  @override
  Future<ApiResulte<VerificationCodeApiResponse>> checkIfPhoneNumber(
    RequestVerifyCode request,
  ) async {
    try {
      final response = await verificationCodeApiService.checkIfPhoneNumber(
        request: request,
      );

      return ApiResulte.success(
        VerificationCodeApiResponse.fromJson(response.data),
      );
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }

  @override
  Future<ApiResulte<UserDataResponse>> confirmVerifyCode(
    ConfirmVerifyCodeRequest request,
  ) async {
    try {
      final response = await verificationCodeApiService.confirmVerifyCode(
        request: request,
      );
      return ApiResulte.success(UserDataResponse.fromJson(response.data));
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }
}
