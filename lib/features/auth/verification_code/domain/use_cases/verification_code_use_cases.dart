import 'package:car_rental_app/features/auth/verification_code/data/model/verification_code_request_body.dart';
import 'package:car_rental_app/features/auth/verification_code/domain/repo/verification_code_repo.dart';

class VerificationCodeUseCases {
  final VerificationCodeRepo verificationCodeRepo;

  VerificationCodeUseCases({required this.verificationCodeRepo});

  Future<dynamic> checkIfPhoneNumber({
    required VerificationCodeRequestBody request,
  }) {
    final respose = verificationCodeRepo.checkIfPhoneNumber(request);
    return respose;
  }
}
