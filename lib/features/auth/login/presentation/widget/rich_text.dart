import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Center(child:
      RichText(
        text:TextSpan(
            children: [
              TextSpan(
                  style: TextStyles.font16OnyxRegular,
                  text: AppStrings.signUp
              ) ,
            ],
            style: TextStyles.font16GrayRegular,
            text: AppStrings.dontHaveAnAccountSignUp

        ),
      ),
      );
  }
}
