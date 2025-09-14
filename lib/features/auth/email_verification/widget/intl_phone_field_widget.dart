import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/features/auth/email_verification/cubit/email_verification_cubit.dart';
import 'package:car_rental_app/features/auth/email_verification/cubit/email_verification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class IntlPhoneFieldWidget extends StatelessWidget {
  const IntlPhoneFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      buildWhen: (previous, current) =>
          current is EmailVerificationFailure ||
          current is EmailVerificationLoading ||
          current is EmailVerificationSuccess,
      builder: (contextt, state) {
        return PinCodeTextField(
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
            activeColor: (state is EmailVerificationSuccess)
                ? ColorsManager.lightGray
                : Colors.red,
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

          onChanged: (value) {
            print("value : ${value}");
            context.read<EmailVerificationCubit>().value = value;
          },

          appContext: context,
        );
      },
    );
  }
}
