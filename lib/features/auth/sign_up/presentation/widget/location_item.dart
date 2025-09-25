import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_location_entity.dart';
import 'package:flutter/material.dart';

class LocationItem extends StatelessWidget {
  final void Function()? onTap;
  final SignUpLocationEntity? signUpLocationEntity;
  const LocationItem({
    super.key,
    required this.onTap,
    required this.signUpLocationEntity,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Text(
        signUpLocationEntity?.name ?? "",
        style: TextStyles.font15BlackMedium,
      ),
    );
  }
}
