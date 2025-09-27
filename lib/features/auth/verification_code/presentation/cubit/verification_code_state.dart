import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:equatable/equatable.dart';

sealed class VerificationCodeState extends Equatable {
  const VerificationCodeState();

  @override
  List<Object> get props => [];
}

class VerificationCodeInitial extends VerificationCodeState {}

class CheckIfPhoneNumberLoading extends VerificationCodeState {}

class CheckIfPhoneNumberSuccess extends VerificationCodeState {
  final String message;
  final String code;
  final String verifyToken;
  final String phone;

  const CheckIfPhoneNumberSuccess({
    required this.message,
    required this.code,
    required this.verifyToken,
    required this.phone,
  });
  @override
  List<Object> get props => [message, code, verifyToken, phone];
}

class CheckIfPhoneNumberFailure extends VerificationCodeState {
  final ApiErrorModel errorMessage;

  const CheckIfPhoneNumberFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class ConfirmVerifyCodeFailure extends VerificationCodeState {
  final ApiErrorModel errorMessage;

  const ConfirmVerifyCodeFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class ConfirmVerifyCodeLoading extends VerificationCodeState {
  @override
  List<Object> get props => [];
}

class ConfirmVerifyCodeSuccess extends VerificationCodeState {
  @override
  List<Object> get props => [];
}

class ConfirmVerifyCodePhone extends VerificationCodeState {
  final String phone;

  const ConfirmVerifyCodePhone({required this.phone});
  @override
  List<Object> get props => [phone];
}
