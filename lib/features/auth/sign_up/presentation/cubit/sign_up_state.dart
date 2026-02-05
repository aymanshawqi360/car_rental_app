import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_countries_entity.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_location_entity.dart';
import 'package:equatable/equatable.dart';

sealed class SignUpState extends Equatable {}

class SignUpInitial extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SingUpLoading extends SignUpInitial {
  @override
  List<Object?> get props => [];
}

class SingUpSuccess extends SignUpInitial {
  final String accessToken;
  final String phone;

  SingUpSuccess({required this.accessToken, required this.phone});
  @override
  List<Object?> get props => [accessToken, phone];
}

class SingUpFailure extends SignUpInitial {
  final ApiErrorModel apiErrorModel;

  SingUpFailure({required this.apiErrorModel});
  @override
  List<Object?> get props => [apiErrorModel];
}

class AddValuesCountry extends SignUpInitial {
  final String countryCode;
  final String countryName;
  final int maxLength;

  AddValuesCountry({
    required this.countryCode,
    required this.countryName,
    required this.maxLength,
  });
  @override
  List<Object?> get props => [countryCode, countryName, maxLength];
}

class AddValuesLocation extends SignUpInitial {
  final String locationName;
  final double lat;
  final double lng;

  AddValuesLocation({
    required this.locationName,
    required this.lat,
    required this.lng,
  });
  @override
  List<Object?> get props => [locationName, lat, lng];
}

class ValidateUser extends SignUpInitial {
  @override
  List<Object?> get props => [];
}

class SingUpCountryLoading extends SignUpInitial {
  @override
  List<Object?> get props => [];
}

class SingUpCountrySuccess extends SignUpInitial {
  final List<SignUpCountriesEntity> countries;

  SingUpCountrySuccess({required this.countries});
  @override
  List<Object?> get props => [countries];
}

class SingUpCountryFailure extends SignUpInitial {
  final ApiErrorModel errorMessage;

  SingUpCountryFailure({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class SignUpLocationLoading extends SignUpInitial {}

class SignUpLocationSuccess extends SignUpInitial {
  final List<SignUpLocationEntity> countryList;

  SignUpLocationSuccess({required this.countryList});
  @override
  List<Object?> get props => [countryList];
}

class SignUpLocationFailure extends SignUpInitial {
  final ApiErrorModel errorMessage;

  SignUpLocationFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class SignUpAvailableToCreateCar extends SignUpInitial {
  final bool value;

  SignUpAvailableToCreateCar({required this.value});
  @override
  List<Object?> get props => [value];
}

class SignUpObscureText extends SignUpInitial {
  final bool value;

  SignUpObscureText({required this.value});
  @override
  List<Object?> get props => [value];
}
