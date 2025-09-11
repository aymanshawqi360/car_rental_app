import 'package:car_rental_app/core/error/api_error_handler.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/sing_up/data/api/api_singup_service.dart';
import 'package:car_rental_app/features/auth/sing_up/data/models/singup_request_body.dart';
import 'package:car_rental_app/features/auth/sing_up/data/models/sing_up_response.dart';
import 'package:car_rental_app/features/auth/sing_up/domain/repo/singup_repo_domain.dart';

class SingUpRepoImplementation extends SingUpRepoDomain {
  final ApiSingUpService apiService;

  SingUpRepoImplementation({required this.apiService});
  @override
  Future<ApiResulte<SingUpResponse>> singUp(
    SingUpRequestBody requestApiModel,
  ) async {
    try {
      final response = await apiService.singUp(
        requestApiModel: requestApiModel,
      );
      return ApiResulte.success(SingUpResponse.fromJson(response.data));
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }
}
