import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:equatable/equatable.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailure extends LoginState {
  final ApiErrorModel errorMessage;

  const LoginFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class Remember extends LoginState {
  final bool isRemembr;

  const Remember({required this.isRemembr});
  @override
  List<Object> get props => [isRemembr];
}
