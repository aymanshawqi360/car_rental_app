import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:equatable/equatable.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoading extends ReviewsState {}

class ReviewsSuccess extends ReviewsState {}

class ReviewsFailure extends ReviewsState {
  final ApiErrorModel errorMessage;

  const ReviewsFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
