import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/widgets/app_dont_have_an_account.dart';
import 'package:flutter/material.dart';

class NavigateButton extends StatelessWidget {
  const NavigateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: context.screenHeight * 0.04),
          child: AppDontHaveAnAccount(
            onTap: () {
              context.pushNamedAndRemoveUntil(
                Routes.login,
                predicate: (_) => false,
              );
            },
            fristText: AppStrings.createA,
            lateText: AppStrings.newAccount,
          ),
        ),
      ],
    );
  }
}
