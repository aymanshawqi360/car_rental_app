import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_appbar.dart';
import 'package:car_rental_app/core/widgets/app_description_title.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:car_rental_app/features/auth/verify_your_phone_number/presentation/widget/continue_button.dart';
import 'package:flutter/material.dart';

class VerifyYourPhoneNumberScreen extends StatelessWidget {
  const VerifyYourPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppAppbar(),
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: context.screenWidth * 0.03,
          right: context.screenWidth * 0.03,
        ),
        child: SingleChildScrollView(
          child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: context.screenWidth * 0.05),
                    //      height: context.bodyHeight * 0.03,
                    // color: Colors.red,
                    child: Text("Skip"),
                  ),
                ],
              ),
              Container(
                height: context.bodyHeight * 0.8,
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppDescriptionTitle(
                      fristText: AppStrings.verifyYourPhoneNumber,
                      fristTextStyle: TextStyles.font28BlackSemiBold,
                      lastText: AppStrings.weHaveSentYouAnSmsWithACodeToNumber,
                    ),
                    verticalSpacing(context.screenHeight * 0.03),
                    //  AppCountryDropdown(),
                    verticalSpacing(context.screenHeight * 0.02),
                    AppTextFormField(hintText: AppStrings.phoneNumber),
                    verticalSpacing(context.screenHeight * 0.03),
                    ContinueButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
