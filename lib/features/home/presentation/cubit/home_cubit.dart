import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/home/domain/entity/best_car_entity.dart';
import 'package:car_rental_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_rental_app/features/home/domain/use_cases/best_car_use_cases.dart';
import 'package:car_rental_app/features/home/domain/use_cases/brands_use_case.dart';
import 'package:car_rental_app/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BrandsUseCase brandsUserCase;
  final BestCarUseCases bestCarUseCases;
  HomeCubit({required this.brandsUserCase, required this.bestCarUseCases})
    : super(HomeInitial());

  void brandState() async {
    emit(HomeBrandLoading());

    final result = await brandsUserCase.getBrands();
    if (result is Success<List<BrandEntity>>) {
      emit(HomeBrandSuccess(brands: result.data ?? []));
    } else if (result is Failure<List<BrandEntity>>) {
      emit(
        HomeBrandFailure(
          errorMessage: ApiErrorModel(
            errorMessage: result.apiErrorModel.errorMessage,
            errors: result.apiErrorModel.errors,
          ),
        ),
      );
    }
  }

  void bestCarState() async {
    emit(HomeBestCarLoading());
    final response = await bestCarUseCases.getBestCars();
    if (response is Success<List<BestCarEntity>>) {
      emit(HomeBestCarSuccess(bestCars: response.data ?? []));
    } else if (response is Failure<List<BestCarEntity>>) {
      emit(
        HomeBestCarFailure(
          errorMessage: ApiErrorModel(
            errors: response.apiErrorModel.errors,
            errorMessage: response.apiErrorModel.errorMessage,
          ),
        ),
      );
    }
  }
}
