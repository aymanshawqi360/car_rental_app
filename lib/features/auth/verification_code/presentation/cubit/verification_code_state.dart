import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:equatable/equatable.dart';

sealed class VerificationCodeState extends Equatable {
  const VerificationCodeState();

  @override
  List<Object> get props => [];
}

class VerificationCodeInitial extends VerificationCodeState {}

class VerificationCodeLoading extends VerificationCodeState {}

class VerificationCodeSuccess extends VerificationCodeState {}

class VerificationCodeFailure extends VerificationCodeState {
  final ApiErrorModel errorMessage;

  const VerificationCodeFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
