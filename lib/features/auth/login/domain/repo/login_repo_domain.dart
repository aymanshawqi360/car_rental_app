import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/login/data/model/login_request_body.dart';
import 'package:car_rental_app/features/auth/login/data/model/login_response.dart';

abstract class LoginRepoDomain {
  Future<ApiResulte<LoginResponse>> login({
    required LoginRequestBody loginRequestBody,
  });
}
