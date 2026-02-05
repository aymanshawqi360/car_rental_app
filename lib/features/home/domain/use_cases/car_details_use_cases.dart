import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/home/domain/entity/car_details.dart';
import 'package:car_rental_app/features/home/domain/repo/home_repo.dart';

class CarDetailsUseCases {
  final HomeRepo homeRepo;

  CarDetailsUseCases({required this.homeRepo});
  Future<ApiResulte<CarDetatilsEntity>> getCarDetails({
    required String carId,
  }) async {
    return homeRepo.getCarDetails(carId: carId);
  }
}
