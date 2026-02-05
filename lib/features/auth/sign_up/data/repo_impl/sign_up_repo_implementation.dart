import 'package:car_rental_app/core/error/api_error_handler.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/sign_up/data/api/api_sign_up_service.dart';
import 'package:car_rental_app/features/auth/sign_up/data/mapper/sign_up_response_mapper.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_countries_response.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_location_response.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_response.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_countries_entity.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_location_entity.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/repo/sign_up_repo_domain.dart';

class SignUpRepoImplementation extends SignUpRepoDomain {
  final ApiSignUpService apiService;

  SignUpRepoImplementation({required this.apiService});
  @override
  Future<ApiResulte<SignUpResponse>> singUp(
    SignUpRequestBody requestApiModel,
  ) async {
    try {
      final response = await apiService.singUp(
        requestApiModel: requestApiModel,
      );
      return ApiResulte.success(SignUpResponse.fromJson(response.data));
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }

  @override
  Future<ApiResulte<List<SignUpCountriesEntity>>> getCountries({
    required query,
  }) async {
    try {
      final response = await apiService.countries(query: query);
      SignUpCountriesResponse responseOne = SignUpCountriesResponse.fromJson(
        response.data,
      );
      List<SignUpCountriesEntity>? countries = responseOne.data
          ?.map((e) => SignUpResponseMapper.signUppCountriesMapper(e))
          .toList();
      return ApiResulte.success(countries ?? []);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }

  @override
  Future<ApiResulte<List<SignUpLocationEntity>>> getLocation({
    required int query,
  }) async {
    try {
      final response = await apiService.getLocation(query: query);
      SignUpLocationResponse signUpLocationResponse =
          SignUpLocationResponse.fromJson(response.data);
      List<SignUpLocationEntity>? locationData = signUpLocationResponse.data
          ?.map((value) => SignUpResponseMapper.signUpLocationMapper(value))
          .toList();
      return ApiResulte.success(locationData ?? []);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }
}
