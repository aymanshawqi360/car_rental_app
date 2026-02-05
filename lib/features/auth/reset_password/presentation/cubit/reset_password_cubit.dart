import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/constants/secure_storage.dart';
import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/reset_password/data/model/request_password_reset_code.dart';
import 'package:car_rental_app/features/auth/reset_password/data/model/reset_password_response.dart';
import 'package:car_rental_app/features/auth/reset_password/domain/use_acses/reset_password_use_cases.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/cubit/reset_password_state.dart';
import 'package:flutter/widgets.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCases resetPasswordUseCases;
  ResetPasswordCubit({required this.resetPasswordUseCases})
    : super(ResetPasswordInitial());

  final controllerEmail = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  void resetPassword() async {
    emit(ResetPasswordLoading());

    final response = await resetPasswordUseCases.resetPassword(
      requestPasswordResetCode: RequestPasswordResetCode(
        email: controllerEmail.text,
      ),
    );

    if (response is Success<ResetPasswordResponse>) {
      await SecureStorage.setData(
        value: response.data?.resetToken ?? "",
        token: Token.resetToken,
      );
      await SecureStorage.setData(
        value: response.data?.code ?? "",
        token: Token.code,
      );
      emit(
        ResetPasswordSuccess(
          resetPasswordResponse: ResetPasswordResponse(
            message: response.data?.message ?? "",
            code: response.data?.code ?? "",
            resetToken: response.data?.resetToken ?? "",
          ),
        ),
      );
    } else if (response is Failure<ResetPasswordResponse>) {
      emit(
        ResetPasswordFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }
}
