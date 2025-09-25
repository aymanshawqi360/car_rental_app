import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/verification_code_request_body.dart';
import 'package:car_rental_app/features/auth/verification_code/domain/use_cases/verification_code_use_cases.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/cubit/verification_code_state.dart';

class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  final VerificationCodeUseCases verificationCodeUseCases;
  VerificationCodeCubit({required this.verificationCodeUseCases})
    : super(VerificationCodeInitial());

  void checkIfPhoneNumber() async {
    emit(VerificationCodeLoading());

    final response = await verificationCodeUseCases.checkIfPhoneNumber(
      request: VerificationCodeRequestBody(phone: ""),
    );
    if (response is Success<dynamic>) {
      // response.data
      emit(VerificationCodeSuccess());
    } else if (response is Failure<dynamic>) {
      emit(
        VerificationCodeFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }
}
