import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/home/domain/entity/best_car_entity.dart';
import 'package:car_rental_app/features/home/domain/entity/brand_entity.dart';

abstract class HomeRepo {
  Future<ApiResulte<List<BrandEntity>>> getBrands();
  Future<ApiResulte<List<BestCarEntity>>> getBestCars();
}
