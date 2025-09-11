import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/sing_up/data/models/singup_request_body.dart';
import 'package:car_rental_app/features/auth/sing_up/data/models/sing_up_response.dart';
import 'package:car_rental_app/features/auth/sing_up/domain/repo/singup_repo_domain.dart';

class SingUpUseCases {
  final SingUpRepoDomain singUpRepoDomain;

  SingUpUseCases({required this.singUpRepoDomain});

  Future<ApiResulte<SingUpResponse>> singUp({
    required SingUpRequestBody requestApiModel,
  }) {
    return singUpRepoDomain.singUp(requestApiModel);
  }
}
