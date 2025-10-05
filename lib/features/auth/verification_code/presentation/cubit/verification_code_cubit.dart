import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/Shared/user_data_response.dart';
import 'package:car_rental_app/core/constants/secure_storage.dart';
import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/confirm_verify_code_request.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/verification_code_api_response.dart';
import 'package:car_rental_app/features/auth/verification_code/data/model/request_verify_code.dart';
import 'package:car_rental_app/features/auth/verification_code/domain/use_cases/verification_code_use_cases.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/cubit/verification_code_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  final VerificationCodeUseCases verificationCodeUseCases;
  VerificationCodeCubit({required this.verificationCodeUseCases})
    : super(VerificationCodeInitial());
  // static VerificationCodeCubit get(context) => BlocProvider.of(context);
  String phoneCode = '';
  void checkIfPhoneNumber() async {
    emit(CheckIfPhoneNumberLoading());
    String? phone = await SecureStorage.getData(token: Token.phone);
    await phonCodeState(phone: phone!);
    final response = await verificationCodeUseCases.checkIfPhoneNumber(
      request: RequestVerifyCode(phone: phone),
    );

    if (response is Success<VerificationCodeApiResponse>) {
      await SecureStorage.setData(
        token: Token.code,
        value: response.data?.code ?? '',
      );
      await SecureStorage.setData(
        token: Token.verifyToken,
        value: response.data?.verifyToken ?? '',
      );
      emit(
        CheckIfPhoneNumberSuccess(
          phone: phone,
          code: response.data?.code ?? '',
          message: response.data?.message ?? '',
          verifyToken: response.data?.verifyToken ?? '',
        ),
      );
    } else if (response is Failure<VerificationCodeApiResponse>) {
      emit(
        CheckIfPhoneNumberFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }

  phonCodeState({required String phone}) {
    emit(ConfirmVerifyCodePhone(phone: phone));
  }

  final controllerCode = TextEditingController();

  void confirmVerifyCode() async {
    emit(ConfirmVerifyCodeLoading());
    final response = await verificationCodeUseCases.confirmVerifyCode(
      request: ConfirmVerifyCodeRequest(
        code: controllerCode.text,
        verifyToken: await SecureStorage.getData(token: Token.verifyToken),
      ),
    );

    if (response is Success<UserDataResponse>) {
      emit(ConfirmVerifyCodeSuccess());
    } else if (response is Failure<UserDataResponse>) {
      emit(
        ConfirmVerifyCodeFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }

  // @override
  // Future<void> close() {
  //   controllerCode.dispose();
  //   return super.close();
  // }
}
