import 'package:car_rental_app/config/constants/country_code_to_emoji.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_countries_entity.dart';
import 'package:flutter/material.dart';

class CountryItem extends StatelessWidget {
  final void Function()? onTap;
  final SignUpCountriesEntity? signUpCountriesEntity;
  // final String? areaCode;
  const CountryItem({
    super.key,
    required this.signUpCountriesEntity,
    required this.onTap,
    // this.areaCode,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Text(
        CountryCodeToEmoji.countryCodeToEmoji(
          countryCode: signUpCountriesEntity?.abbreviation.toString() ?? "",
        ),
        style: TextStyle(fontSize: 20),
      ),
      //  trailing: Text("+${areaCode}"),
      title: Text(signUpCountriesEntity?.countryName ?? ""),
    );
  }
}
