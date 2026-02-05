import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/constants/secure_storage.dart';
import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/new_password/data/model/new_password_request.dart';
import 'package:car_rental_app/features/auth/new_password/domain/use_cases/new_password_use_cases.dart';
import 'package:car_rental_app/features/auth/new_password/presentation/cubit/new_password_state.dart';
import 'package:flutter/cupertino.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  final NewPasswordUseCases newPasswordUseCases;
  NewPasswordCubit({required this.newPasswordUseCases})
    : super(NewPasswordInitial());

  final containerPassword = TextEditingController();
  final containerConfirmPassword = TextEditingController();
  final keyFrom = GlobalKey<FormState>();
  void getNewPassword() async {
    emit(NewPasswordLoading());
    String? code = await SecureStorage.getData(token: Token.code);
    String? resetToken = await SecureStorage.getData(token: Token.resetToken);
    final response = await newPasswordUseCases.getNewPassword(
      newPasswordRequest: NewPasswordRequest(
        resetToken: resetToken,
        code: code,
        password: containerPassword.text,
        confirmPassword: containerConfirmPassword.text,
      ),
    );

    if (response is Success<String>) {
      emit(NewPasswordSuccess());
    } else if (response is Failure<String>) {
      emit(
        NewPasswordFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }
}
