import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/constants/secure_storage.dart';
import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/login/data/model/login_request_body.dart';
import 'package:car_rental_app/features/auth/login/data/model/login_response.dart';
import 'package:car_rental_app/features/auth/login/domain/use_cases/login_use_cases.dart';
import 'package:car_rental_app/features/auth/login/presentation/cubit/login_state.dart';
import 'package:flutter/cupertino.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCases loginUseCases;
  LoginCubit({required this.loginUseCases}) : super(LoginInitial());
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();
  final keyFrom = GlobalKey<FormState>();
  void login() async {
    emit(LoginLoading());

    final response = await loginUseCases.login(
      LoginRequestBody(
        email: controllerEmail.text,
        password: controllerPassword.text,
      ),
    );

    if (response is Success<LoginResponse>) {
      if (isRemember) {
        log("Success=================");
        SecureStorage.setData(
          token: Token.accessToken,
          value: response.data!.tokens!.access.toString(),
        );
      } else {
        log("failure=================");
      }
      emit(LoginSuccess());
    } else if (response is Failure<LoginResponse>) {
      emit(
        LoginFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }

  bool isRemember = false;
  void remember(bool value) {
    // if (value) {
    isRemember = value;

    debugPrint("TokenSuccess=>>>>>>>>>${isRemember}");
    emit(Remember(isRemembr: isRemember));
    //   // await SecureStorage.setData(token: Token.accessToken, value: success);
    // }
    // else {
    //   isRemember = !isRemember;
    // }
  }
}
