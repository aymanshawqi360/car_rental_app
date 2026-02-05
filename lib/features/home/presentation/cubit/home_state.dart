import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/features/home/domain/entity/best_car_entity.dart';
import 'package:car_rental_app/features/home/domain/entity/brand_entity.dart';
import 'package:equatable/equatable.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeBrandLoading extends HomeState {}

class HomeBrandSuccess extends HomeState {
  final List<BrandEntity> brands;

  const HomeBrandSuccess({required this.brands});
  @override
  List<Object> get props => [brands];
}

class HomeBrandFailure extends HomeState {
  final ApiErrorModel errorMessage;

  const HomeBrandFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

//! BestCarCubit
class HomeBestCarLoading extends HomeState {}

class HomeBestCarSuccess extends HomeState {
  final List<BestCarEntity> bestCars;

  const HomeBestCarSuccess({required this.bestCars});
  @override
  List<Object> get props => [bestCars];
}

class HomeBestCarFailure extends HomeState {
  final ApiErrorModel errorMessage;

  const HomeBestCarFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
