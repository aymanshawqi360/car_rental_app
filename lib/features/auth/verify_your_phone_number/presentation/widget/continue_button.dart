import 'package:car_rental_app/config/responsive/size_config.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: () {
        context.pushNamedAndRemoveUntil(
          Routes.verificationCodeScreen,
          predicate: (_) => false,
        );
      },
      height: SizeConfig.heightButton,
      widget: Text(
        AppStrings.continueButton,
        style: TextStyles.font18WhiteBold,
      ),
    );
  }
}
