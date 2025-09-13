import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/widgets/app_dont_have_an_account.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppDontHaveAnAccount(
        fristText: AppStrings.dontHaveAnAccountSignUp,

        lateText: AppStrings.signUp,
        onTap: () {
          context.pushNamedAndRemoveUntil(
            Routes.signUp,
            predicate: (_) => false,
          );
        },
      ),
    );
  }
}
