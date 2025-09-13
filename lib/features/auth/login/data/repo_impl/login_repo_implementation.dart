import 'package:car_rental_app/core/error/api_error_handler.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/login/data/api/api_login_service.dart';
import 'package:car_rental_app/features/auth/login/data/model/login_request_body.dart';
import 'package:car_rental_app/features/auth/login/data/model/login_response.dart';
import 'package:car_rental_app/features/auth/login/domain/repo/login_repo_domain.dart';

class LoginRepoImplementation extends LoginRepoDomain {
  final ApiLoginService loginApiService;

  LoginRepoImplementation({required this.loginApiService});

  @override
  Future<ApiResulte<LoginResponse>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    try {
      final response = await loginApiService.login(
        loginRequestBody: loginRequestBody,
      );

      return ApiResulte.success(LoginResponse.fromJson(response.data));
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }
}
