import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/sing_up/data/models/singup_request_body.dart';
import 'package:car_rental_app/features/auth/sing_up/data/models/sing_up_response.dart';

abstract class SingUpRepoDomain {
  Future<ApiResulte<SingUpResponse>> singUp(SingUpRequestBody requestApiModel);
}
