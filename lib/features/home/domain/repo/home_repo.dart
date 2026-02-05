import 'package:car_rental_app/core/Shared/api_response.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/home/domain/entity/best_car_entity.dart';
import 'package:car_rental_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_rental_app/features/home/domain/entity/car_details.dart';

abstract class HomeRepo {
  Future<ApiResulte<List<BrandEntity>>> getBrands();
  Future<ApiResulte<List<BestCarEntity>>> getBestCars();
  Future<ApiResulte<CarDetatilsEntity>> getCarDetails({required String carId});
  Future<ApiResulte<ApiResponse>> getReviews({required String carId});
}
