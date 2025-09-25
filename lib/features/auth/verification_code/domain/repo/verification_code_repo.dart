import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/verification_code_request_body.dart';

abstract class VerificationCodeRepo {
  Future<ApiResulte<void>> checkIfPhoneNumber(
    VerificationCodeRequestBody request,
  );
}
