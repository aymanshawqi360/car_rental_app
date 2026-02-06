import 'package:equatable/equatable.dart';

class SignUpCountriesEntity extends Equatable {
  final int? id;
  final String? countryName;
  final String? abbreviation;

  const SignUpCountriesEntity({
    required this.id,
    required this.countryName,
    required this.abbreviation,
  });
  @override
  List<Object?> get props => [id, countryName, abbreviation];
}
