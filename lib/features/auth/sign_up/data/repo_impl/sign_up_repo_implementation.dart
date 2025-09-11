import 'package:car_rental_app/core/error/api_error_handler.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/sign_up/data/api/api_sign_up_service.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_response.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/repo/sign_up_repo_domain.dart';

class SignUpRepoImplementation extends SingUpRepoDomain {
  final ApiSignUpService apiService;

  SignUpRepoImplementation({required this.apiService});
  @override
  Future<ApiResulte<SignUpResponse>> singUp(
    SignUpRequestBody requestApiModel,
  ) async {
    try {
      final response = await apiService.singUp(
        requestApiModel: requestApiModel,
      );
      return ApiResulte.success(SignUpResponse.fromJson(response.data));
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }
}
