import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/features/home/domain/entity/car_details.dart';
import 'package:equatable/equatable.dart';

sealed class CarDetailsState extends Equatable {
  const CarDetailsState();

  @override
  List<Object> get props => [];
}

class CarDetailsInitial extends CarDetailsState {}

class CarDetailsLoading extends CarDetailsState {}

class CarDetailsSuccess extends CarDetailsState {
  final CarDetatilsEntity carDetatilsEntity;

  const CarDetailsSuccess({required this.carDetatilsEntity});
}

class CarDetailsFailure extends CarDetailsState {
  final ApiErrorModel errorMessage;

  const CarDetailsFailure({required this.errorMessage});
}

class DotsLoader extends CarDetailsState {
  final int dotCount;

  const DotsLoader({required this.dotCount});
  @override
  List<Object> get props => [dotCount];
}
