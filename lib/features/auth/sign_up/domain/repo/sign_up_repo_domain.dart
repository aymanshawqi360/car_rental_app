import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_response.dart';

abstract class SignUpRepoDomain {
  Future<ApiResulte<SignUpResponse>> singUp(SignUpRequestBody requestApiModel);
}
