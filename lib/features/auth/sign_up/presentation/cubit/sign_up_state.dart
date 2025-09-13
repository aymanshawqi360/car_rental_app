import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:equatable/equatable.dart';

sealed class SingUpState extends Equatable {}

class SingupInitial extends SingUpState {
  @override
  List<Object?> get props => [];
}

class SingupLoading extends SingupInitial {
  @override
  List<Object?> get props => [];
}

class SingupSuccess extends SingupInitial {
  @override
  List<Object?> get props => [];
}

class SingupFailure extends SingupInitial {
  final ApiErrorModel apiErrorModel;

  SingupFailure({required this.apiErrorModel});
  @override
  List<Object?> get props => [apiErrorModel];
}

class SingUpString extends SingupInitial {
  final String countryCode;
  final String countryName;
  final int maxLength;

  SingUpString({
    required this.countryCode,
    required this.countryName,
    required this.maxLength,
  });
  @override
  List<Object?> get props => [countryCode, countryName, maxLength];
}

class ValidateUser extends SingupInitial {
  @override
  List<Object?> get props => [];
}
