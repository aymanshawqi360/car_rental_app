import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/login/data/model/login_request_body.dart';
import 'package:car_rental_app/features/auth/login/data/model/login_response.dart';
import 'package:car_rental_app/features/auth/login/domain/repo/login_repo_domain.dart';

class LoginUseCases {
  final LoginRepoDomain loginRepoDomain;

  LoginUseCases({required this.loginRepoDomain});

  Future<ApiResulte<LoginResponse>> login(LoginRequestBody loginRequestBody) {
    final response = loginRepoDomain.login(loginRequestBody: loginRequestBody);

    return response;
  }
}
