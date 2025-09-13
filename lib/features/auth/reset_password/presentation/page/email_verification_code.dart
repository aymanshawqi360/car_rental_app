import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/core/widgets/app_description_title.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/widget/creat_a_new_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerificationCode extends StatelessWidget {
  const EmailVerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(AssetsManager.qentCar, width: 33, height: 33),
            horizontalSpacing(context.screenWidth * 0.02),
            SvgPicture.asset(AssetsManager.qent, width: 20, height: 20),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: context.screenWidth * 0.03,
          right: context.screenWidth * 0.03,
        ),
        child: Column(
          children: [
            SizedBox(
              height: (context.bodyHeight) * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppDescriptionTitle(
                    fristText: AppStrings.emailVerification,
                    fristTextStyle: TextStyles.font30BlackSemiBold,
                    lastText: AppStrings.enterThefourCodeDigitVerificationCode,
                    lastTextStyle: TextStyles.font12GrayRegular,
                  ),
                  verticalSpacing(context.screenHeight * 0.04),
                  PinCodeTextField(
                    length: 4,
                    keyboardType: TextInputType.number,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    cursorColor: ColorsManager.black,
                    cursorHeight: context.screenHeight * 0.015,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(13),
                      fieldHeight: 56.h,
                      //  context.screenHeight / 11.7,
                      fieldWidth: context.screenWidth / 5.5,
                      activeFillColor: ColorsManager.white,
                      activeColor: ColorsManager.lightGray,
                      inactiveColor: ColorsManager.lightGray,
                      inactiveFillColor: ColorsManager.white,
                      selectedColor: ColorsManager.lightGray,
                      selectedFillColor: ColorsManager.white,
                      // errorBorderColor: Colors.red,
                      // disabledColor: Colors.amber,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      return false;
                    },
                    appContext: context,
                  ),
                  // AppTextFormField(),
                  // verticalSpacing(context.screenHeight * 0.02),
                  // AppTextFormField(),
                  verticalSpacing(context.screenHeight * 0.04),
                  //   ResetPasswordButton(),
                  AppButton(onTap: () {}),
                ],
              ),
            ),
            SizedBox(
              height: context.bodyHeight * 0.45,
              child: CreatANewAccount(),
            ),
          ],
        ),
      ),
    );
  }
}
