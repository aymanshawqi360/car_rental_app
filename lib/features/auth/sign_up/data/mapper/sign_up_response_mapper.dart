import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_countries_response.dart';
import 'package:car_rental_app/features/auth/sign_up/data/models/sign_up_location_response.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_countries_entity.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_location_entity.dart';

class SignUpResponseMapper {
  SignUpResponseMapper._();
  static SignUpCountriesEntity signUppCountriesMapper(Data data) {
    return SignUpCountriesEntity(
      id: data.id ?? 0,
      countryName: data.country ?? "defaultCountry",
      abbreviation: data.abbreviation ?? "defaultAbbreviation",
    );
  }

  static SignUpLocationEntity signUpLocationMapper(DataLocation locationData) {
    return SignUpLocationEntity(
      id: locationData.id ?? 0,
      lat: locationData.lat ?? 5.0,
      lng: locationData.lng ?? 6.0,
      name: locationData.name ?? "defaultName",
    );
  }
}
