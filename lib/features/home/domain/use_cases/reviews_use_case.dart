import 'package:car_rental_app/core/Shared/api_response.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/home/domain/repo/home_repo.dart';

class ReviewsUseCase {
  final HomeRepo homeRepo;

  ReviewsUseCase({required this.homeRepo});

  Future<ApiResulte<ApiResponse>> getReviews({required String carId}) async {
    return homeRepo.getReviews(carId: carId);
  }
}
