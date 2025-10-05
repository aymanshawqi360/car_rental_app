import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/constants/secure_storage.dart';
import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_response.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_countries_entity.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_location_entity.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/use_cases/sign_up_use_cases.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCases singUpUseCases;
  SignUpCubit({required this.singUpUseCases}) : super(SignUpInitial());
  final controllerFullName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerCountry = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  static SignUpCubit get(context) => BlocProvider.of(context);
  final keyFrom = GlobalKey<FormState>();
  void singUp() async {
    await SecureStorage.delete(token: Token.accessToken);
    emit(SingUpLoading());
    final response = await singUpUseCases.singUp(
      requestApiModel: SignUpRequestBody(
        fullName: controllerFullName.text.trim(),
        email: controllerEmail.text.trim(),
        password: controllerPassword.text.trim(),
        country: dialCode,
        phone: controllerPhoneNumber.text.trim(),
        location: locationId.toString(),
        availableToCreateCar: isAvailableToCreateCar,
      ),
    );
    if (response is Success<SignUpResponse>) {
      await SecureStorage.setData(
        token: Token.accessToken,
        value: response.data?.tokens?.access ?? '',
      );
      await SecureStorage.setData(
        token: Token.refreshToken,
        value: response.data?.tokens?.refresh ?? '',
      );
      await SecureStorage.setData(
        token: Token.phone,
        value: response.data?.user?.phone ?? '',
      );
      emit(
        SingUpSuccess(
          accessToken: response.data?.tokens?.access ?? '',
          phone: response.data?.user?.phone ?? '',
        ),
      );
    } else if (response is Failure<SignUpResponse>) {
      emit(
        SingUpFailure(
          apiErrorModel: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }

  List<SignUpLocationEntity> locationList = [];
  int locationPage = 1;
  void getLocation({bool isRefrash = false}) async {
    if (!isRefrash) {
      emit(SignUpLocationLoading());
    }

    final response = await singUpUseCases.getLocation(query: locationPage);

    if (response is Success<List<SignUpLocationEntity>>) {
      if (response.data!.isNotEmpty) {
        locationPage++;
        locationList.addAll(response.data ?? []);
      }

      emit(SignUpLocationSuccess(countryList: response.data ?? []));
    } else if (response is Failure<List<SignUpLocationEntity>>) {
      emit(
        SignUpLocationFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }

  List<SignUpCountriesEntity> countries = [];
  int countryPage = 1;
  void getCountries({bool isRefrash = false}) async {
    if (!isRefrash) {
      emit(SingUpCountryLoading());
    }

    final response = await singUpUseCases.getCountires(query: countryPage);

    if (response is Success<List<SignUpCountriesEntity>>) {
      if (response.data!.isNotEmpty) {
        countryPage++;

        countries.addAll(response.data ?? []);
      }

      emit(SingUpCountrySuccess(countries: response.data ?? []));
    } else if (response is Failure<List<SignUpCountriesEntity>>) {
      emit(
        SingUpCountryFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }

  int? locationId;
  void addValueToLocationState({
    String? locationName,
    double? lat,
    double? lng,
    int? id,
  }) {
    locationId = id;
    emit(
      AddValuesLocation(
        locationName: locationName ?? "",
        lat: lat ?? 0.0,
        lng: lng ?? 0.0,
      ),
    );
  }

  bool obscureText = false;
  void passwordsecurity() {
    obscureText = !obscureText;

    emit(SignUpObscureText(value: obscureText));
  }

  String? countryCode;
  int maxLength = 9;
  String? dialCode;
  String? countryName;
  // String? regionCode;
  String? locationName;
  void addValueToCountryState({
    String? countryCode,
    String? countryName,
    String? locationName,
    // required int maxLength,
    String? dialCode,
  }) {
    this.countryCode = countryCode;
    // this.maxLength = maxLength;
    this.countryName = countryName;
    this.dialCode = dialCode;
    this.locationName = locationName;

    emit(
      AddValuesCountry(
        countryCode: countryCode ?? '',
        countryName: countryName ?? "",
        maxLength: maxLength,
      ),
    );
  }

  String message = 'Invalid Mobile Number';
  bool validateUser = false;

  void validatePhone(String value) {
    if (value.length < maxLength) {
      validateUser = true;
    } else if (value.isEmpty) {
      validateUser = false;
    } else if (value.length <= maxLength) {
      validateUser = false;
    } else {
      validateUser = false;
    }
    emit(ValidateUser());
  }

  String isAvailableToCreateCar = "0";
  bool isTru = false;
  void verificationCodeRepo() {
    if (isTru != true) {
      isAvailableToCreateCar = "1";
    } else {
      isAvailableToCreateCar = "0";
    }
    isTru = !isTru;
    emit(SignUpAvailableToCreateCar(value: isTru));
  }
}
