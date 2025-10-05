import 'package:car_rental_app/core/Shared/api_response.dart';
import 'package:car_rental_app/core/error/api_error_handler.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/home/data/api/home_api_service.dart';
import 'package:car_rental_app/features/home/data/mappers/home_mappers.dart';
import 'package:car_rental_app/features/home/data/model/brand_response.dart';
import 'package:car_rental_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_rental_app/features/home/domain/repo/home_repo.dart';

class HomeRepoImplementaion implements HomeRepo {
  final HomeApiService homeApiService;

  HomeRepoImplementaion({required this.homeApiService});
  @override
  Future<ApiResulte<List<BrandEntity>>> getBrands() async {
    try {
      final response = await homeApiService.getBrands();

      List<BrandEntity>? brands = ApiResponse.fromJson(
        response.data,
        BrandResponse.fromJson,
      ).data?.map((json) => HomeMappers.getBrandEntity(json)).toList();
      return ApiResulte.success(brands ?? []);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }
}
