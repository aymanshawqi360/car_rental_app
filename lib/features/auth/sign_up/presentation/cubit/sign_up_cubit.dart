import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/error/api_error_model.dart';
import 'package:car_rental_app/core/error/api_resulte.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_response.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/use_cases/sign_up_use_cases.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/singup_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SingUpState> {
  final SignUpUseCases singUpUseCases;
  SignUpCubit({required this.singUpUseCases}) : super(SingupInitial());
  final controllerFullName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerCountry = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  static SignUpCubit get(context) => BlocProvider.of(context);
  final keyFrom = GlobalKey<FormState>();
  void singUp() async {
    emit(SingupLoading());
    final response = await singUpUseCases.singUp(
      requestApiModel: SignUpRequestBody(
        fullName: controllerFullName.text,
        email: controllerEmail.text,
        password: controllerPassword.text,
        country: countryCode,
        // phoneNumber: controllerPhoneNumber.text,
      ),
    );
    if (response is Success<SignUpResponse>) {
      emit(SingupSuccess());
    } else if (response is Failure<SignUpResponse>) {
      emit(
        SingupFailure(
          apiErrorModel: ApiErrorModel(
            errorMessage: response.apiErrorModel.errorMessage,
            errors: response.apiErrorModel.errors,
          ),
        ),
      );
    }
  }

  String? countryCode;
  int maxLength = 9;
  String? dialCode;
  String? countryName;
  // String? regionCode;
  void add({
    required String countryCode,
    required String countryName,
    required int maxLength,
    required String dialCode,
  }) {
    debugPrint("CountryCode =======================> ${countryCode}");
    debugPrint("CountryName =======================> ${countryName}");
    debugPrint("MaxLength =======================> ${maxLength}");

    this.countryCode = countryCode;
    this.maxLength = maxLength;
    this.countryName = countryName;
    this.dialCode = dialCode;

    emit(
      SingUpString(
        countryCode: countryCode,
        countryName: countryName,
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
}
