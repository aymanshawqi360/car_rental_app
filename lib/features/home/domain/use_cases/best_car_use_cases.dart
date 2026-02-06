import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/home/domain/entity/best_car_entity.dart';
import 'package:car_rental_app/features/home/domain/repo/home_repo.dart';

class BestCarUseCases {
  final HomeRepo homeRepo;

  BestCarUseCases({required this.homeRepo});

  Future<ApiResulte<List<BestCarEntity>>> getBestCars() {
    return homeRepo.getBestCars();
  }
}
