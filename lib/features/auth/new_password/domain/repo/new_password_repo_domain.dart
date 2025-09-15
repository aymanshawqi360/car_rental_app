import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/new_password/data/model/new_password_request.dart';

abstract class NewPasswordRepoDomain {
  Future<ApiResulte<String>> getNewPassword({
    required NewPasswordRequest newPasswordRequest,
  });
}
