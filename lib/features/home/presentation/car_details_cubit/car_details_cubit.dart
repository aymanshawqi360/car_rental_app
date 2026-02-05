import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/home/domain/entity/car_details.dart';
import 'package:car_rental_app/features/home/domain/use_cases/car_details_use_cases.dart';
import 'package:car_rental_app/features/home/presentation/car_details_cubit/car_details_state.dart';

class CarDetailsCubit extends Cubit<CarDetailsState> {
  final CarDetailsUseCases carDetailsUseCases;
  CarDetailsCubit({required this.carDetailsUseCases})
    : super(CarDetailsInitial());

  void carDetails({required String carId}) async {
    emit(CarDetailsLoading());

    final response = await carDetailsUseCases.getCarDetails(carId: carId);
    if (response is Success<CarDetatilsEntity>) {
      emit(CarDetailsSuccess(carDetatilsEntity: response.data!));
    } else if (response is Failure<CarDetatilsEntity>) {
      emit(
        CarDetailsFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }

  int dotCount = 0;
  dotsLoader(int index) {
    dotCount = index;

    log(dotCount.toString());

    emit(DotsLoader(dotCount: index));
  }
}
