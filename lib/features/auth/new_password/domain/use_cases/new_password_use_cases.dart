import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/new_password/data/model/new_password_request.dart';
import 'package:car_rental_app/features/auth/new_password/domain/repo/new_password_repo_domain.dart';

class NewPasswordUseCases {
  final NewPasswordRepoDomain newPasswordRepoDomain;

  NewPasswordUseCases({required this.newPasswordRepoDomain});

  Future<ApiResulte<String>> getNewPassword({
    required NewPasswordRequest newPasswordRequest,
  }) {
    return newPasswordRepoDomain.getNewPassword(
      newPasswordRequest: newPasswordRequest,
    );
  }
}
