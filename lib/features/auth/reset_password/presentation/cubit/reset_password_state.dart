import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/features/auth/reset_password/data/model/reset_password_response.dart';
import 'package:equatable/equatable.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordResponse resetPasswordResponse;

  const ResetPasswordSuccess({required this.resetPasswordResponse});
  @override
  List<Object> get props => [resetPasswordResponse];
}

class ResetPasswordFailure extends ResetPasswordState {
  final ApiErrorModel errorMessage;

  const ResetPasswordFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
