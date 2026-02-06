import 'package:car_rental_app/core/error/api_error_handler.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/new_password/data/api/new_password_service.dart';
import 'package:car_rental_app/features/auth/new_password/data/model/new_password_request.dart';
import 'package:car_rental_app/features/auth/new_password/domain/repo/new_password_repo_domain.dart';

class NewPasswordRepoImplementation extends NewPasswordRepoDomain {
  final NewPasswordService newPasswordService;

  NewPasswordRepoImplementation({required this.newPasswordService});

  @override
  Future<ApiResulte<String>> getNewPassword({
    required NewPasswordRequest newPasswordRequest,
  }) async {
    try {
      final response = await newPasswordService.getNewPassword(
        newPasswordRequest: newPasswordRequest,
      );

      return ApiResulte.success(response.data['message'] as String);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }
}
