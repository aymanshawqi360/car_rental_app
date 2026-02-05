import 'package:car_rental_app/core/Shared/user_data_response.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/confirm_verify_code_request.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/verification_code_api_response.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/request_verify_code.dart';

abstract class VerificationCodeRepo {
  Future<ApiResulte<VerificationCodeApiResponse>> checkIfPhoneNumber(
    RequestVerifyCode request,
  );
  Future<ApiResulte<UserDataResponse>> confirmVerifyCode(
    ConfirmVerifyCodeRequest request,
  );
}
