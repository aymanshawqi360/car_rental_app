import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/reset_password/data/model/request_password_reset_code.dart';
import 'package:car_rental_app/features/auth/reset_password/data/model/reset_password_response.dart';
import 'package:car_rental_app/features/auth/reset_password/domain/repo/reset_password_repo_domain.dart';

class ResetPasswordUseCases {
  final ResetPasswordRepoDomain resetPasswordRepo;

  ResetPasswordUseCases({required this.resetPasswordRepo});

  Future<ApiResulte<ResetPasswordResponse>> resetPassword({
    required RequestPasswordResetCode requestPasswordResetCode,
  }) {
    return resetPasswordRepo.resetPassword(
      requestPasswordResetCode: requestPasswordResetCode,
    );
  }
}
