import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_response.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_countries_entity.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_location_entity.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/repo/sign_up_repo_domain.dart';

class SignUpUseCases {
  final SignUpRepoDomain singUpRepoDomain;

  SignUpUseCases({required this.singUpRepoDomain});

  Future<ApiResulte<SignUpResponse>> singUp({
    required SignUpRequestBody requestApiModel,
  }) {
    return singUpRepoDomain.singUp(requestApiModel);
  }

  Future<ApiResulte<List<SignUpCountriesEntity>>> getCountires({
    required int query,
  }) {
    return singUpRepoDomain.getCountries(query: query);
  }

  Future<ApiResulte<List<SignUpLocationEntity>>> getLocation({
    required int query,
  }) {
    return singUpRepoDomain.getLocation(query: query);
  }
}
