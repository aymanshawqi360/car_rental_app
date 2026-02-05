import 'package:car_rental_app/core/error/api_error_handler.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/reset_password/data/api/reset_password_service.dart';
import 'package:car_rental_app/features/auth/reset_password/data/model/request_password_reset_code.dart';
import 'package:car_rental_app/features/auth/reset_password/data/model/reset_password_response.dart';
import 'package:car_rental_app/features/auth/reset_password/domain/repo/reset_password_repo_domain.dart';

class ResetPasswordRepoImplementation extends ResetPasswordRepoDomain {
  final ResetPasswordService resetPasswordService;

  ResetPasswordRepoImplementation({required this.resetPasswordService});
  @override
  Future<ApiResulte<ResetPasswordResponse>> resetPassword({
    required RequestPasswordResetCode requestPasswordResetCode,
  }) async {
    try {
      final response = await resetPasswordService.resetPassword(
        requestPasswordResetCode: requestPasswordResetCode,
      );

      return ApiResulte.success(ResetPasswordResponse.fromJson(response.data));
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }
}
