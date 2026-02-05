import 'package:car_rental_app/core/Shared/api_response.dart';
import 'package:car_rental_app/core/error/api_error_handler.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/home/data/api/home_api_service.dart';
import 'package:car_rental_app/features/home/data/mappers/home_mappers.dart';
import 'package:car_rental_app/features/home/data/model/brand_response.dart';
import 'package:car_rental_app/features/home/data/model/car_collection_response.dart';
import 'package:car_rental_app/features/home/data/model/car_details_model.dart';
import 'package:car_rental_app/features/home/domain/entity/best_car_entity.dart';
import 'package:car_rental_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_rental_app/features/home/domain/entity/car_details.dart';
import 'package:car_rental_app/features/home/domain/repo/home_repo.dart';
import 'package:dio/dio.dart';

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
      ).data?.map((json) => HomeMappers.getBrandMapper(json)).toList();
      return ApiResulte.success(brands ?? []);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }

  @override
  Future<ApiResulte<List<BestCarEntity>>> getBestCars() async {
    try {
      final response = await homeApiService.getBestCars();
      CarsResponse rrr = CarsResponse.fromJson(response.data);
      List<BestCarEntity>? bestCars = rrr.data
          ?.map((value) => HomeMappers.getBestCarsMapper(value))
          .toList();

      return ApiResulte.success(bestCars ?? []);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }

  @override
  Future<ApiResulte<CarDetatilsEntity>> getCarDetails({
    required String carId,
  }) async {
    try {
      final response = await homeApiService.getCarDetails(carId: carId);
      CarDetails resultCar = CarDetails.fromJson(response.data);

      return ApiResulte.success(HomeMappers.getCarDetails(resultCar));
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }

  @override
  Future<ApiResulte<ApiResponse>> getReviews({required String carId}) async {
    try {
      final response = await homeApiService.getReviews(carId: carId);

      ApiResponse<Review> apiResponse = ApiResponse<Review>.fromJson(
        response.data,
        (e) => Review.fromJson(e),
      );

      return ApiResulte.success(apiResponse);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHandler(e));
    }
  }
}
