import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/Shared/api_response.dart';
import 'package:car_rental_app/core/error/api_error_handler.dart';
import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/home/domain/use_cases/reviews_use_case.dart';
import 'package:car_rental_app/features/home/presentation/reviews_cubit/reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final ReviewsUseCase reviewsUseCase;
  ReviewsCubit({required this.reviewsUseCase}) : super(ReviewsInitial());
  Future<void> getReviews({required String carId}) async {
    emit(ReviewsLoading());

    final response = await reviewsUseCase.getReviews(carId: carId);
    if (response is Success<ApiResponse<dynamic>>) {
      emit(ReviewsSuccess());
    } else if (response is Failure<ApiResponse<dynamic>>) {
      emit(
        ReviewsFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }
}
