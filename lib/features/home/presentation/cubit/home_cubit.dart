import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_rental_app/features/home/domain/user_cases/brands_user_case.dart';
import 'package:car_rental_app/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BrandsUserCase brandsUserCase;
  HomeCubit({required this.brandsUserCase}) : super(HomeInitial());

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
}
