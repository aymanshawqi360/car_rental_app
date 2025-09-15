import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:equatable/equatable.dart';

sealed class NewPasswordState extends Equatable {
  const NewPasswordState();

  @override
  List<Object> get props => [];
}

class NewPasswordInitial extends NewPasswordState {}

class NewPasswordLoading extends NewPasswordState {
  @override
  List<Object> get props => [];
}

class NewPasswordSuccess extends NewPasswordState {
  @override
  List<Object> get props => [];
}

class NewPasswordFailure extends NewPasswordState {
  final ApiErrorModel errorMessage;

  const NewPasswordFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
