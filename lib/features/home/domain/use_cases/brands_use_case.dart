import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_rental_app/features/home/domain/repo/home_repo.dart';

class BrandsUseCase {
  final HomeRepo homeRepo;

  BrandsUseCase({required this.homeRepo});

  Future<ApiResulte<List<BrandEntity>>> getBrands() {
    return homeRepo.getBrands();
  }
}
