import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_response.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_countries_entity.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_location_entity.dart';

abstract class SignUpRepoDomain {
  Future<ApiResulte<SignUpResponse>> singUp(SignUpRequestBody requestApiModel);
  Future<ApiResulte<List<SignUpCountriesEntity>>> getCountries({
    required int query,
  });
  Future<ApiResulte<List<SignUpLocationEntity>>> getLocation({
    required int query,
  });
}
