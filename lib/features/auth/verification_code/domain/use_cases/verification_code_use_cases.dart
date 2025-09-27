import 'package:car_rental_app/config/Shared/user_data_response.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/confirm_verify_code_request.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/verification_code_api_response.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/request_verify_code.dart';
import 'package:car_rental_app/features/auth/verification_code/domain/repo/verification_code_repo.dart';

class VerificationCodeUseCases {
  final VerificationCodeRepo verificationCodeRepo;

  VerificationCodeUseCases({required this.verificationCodeRepo});

  Future<ApiResulte<VerificationCodeApiResponse>> checkIfPhoneNumber({
    required RequestVerifyCode request,
  }) {
    final respose = verificationCodeRepo.checkIfPhoneNumber(request);
    return respose;
  }

  Future<ApiResulte<UserDataResponse>> confirmVerifyCode({
    required ConfirmVerifyCodeRequest request,
  }) {
    final respose = verificationCodeRepo.confirmVerifyCode(request);
    return respose;
  }
}
