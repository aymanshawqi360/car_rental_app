import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/constants/secure_storage.dart';
import 'package:car_rental_app/features/auth/email_verification/presentation/cubit/email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit() : super(EmailVerificationInitial());

  String value = "";
  void emailVerification() async {
    String? saveCode = await SecureStorage.getData(token: Token.code);
    if (value == saveCode) {
      emit(EmailVerificationSuccess());
    } else if (value != saveCode || value.isEmpty || saveCode!.isEmpty) {
      emit(EmailVerificationFailure());
    } else {
      emit(EmailVerificationLoading());
    }
  }
}
