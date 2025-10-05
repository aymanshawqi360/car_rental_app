import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/widget/country_drop_down.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/widget/location_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController controllerFullName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;
  late TextEditingController controllerCountry;
  late TextEditingController controllerPhoneNumber;
  @override
  void initState() {
    controllerFullName = context.read<SignUpCubit>().controllerFullName;
    controllerEmail = context.read<SignUpCubit>().controllerEmail;
    controllerPassword = context.read<SignUpCubit>().controllerPassword;
    controllerCountry = context.read<SignUpCubit>().controllerCountry;
    controllerPhoneNumber = context.read<SignUpCubit>().controllerPhoneNumber;

    super.initState();
  }

  @override
  void dispose() {
    controllerFullName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerCountry.dispose();
    controllerPhoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().keyFrom,
      child: Column(
        children: [
          AppTextFormField(
            controller: controllerFullName,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return AppStrings.pleaseEnterTheFullName;
              }
            },
            hintText: AppStrings.fullName,
          ),
          verticalSpacing(15.h),
          AppTextFormField(
            controller: controllerEmail,
            hintText: AppStrings.emailAddress,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return AppStrings.thisEmailIsRequired;
              }
            },
          ),
          verticalSpacing(15.h),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              final cubit = context.read<SignUpCubit>();
              return AppTextFormField(
                controller: controllerPassword,
                hintText: AppStrings.password,
                validator: (value) {
                  if (value?.isEmpty ?? value == null) {
                    return AppStrings.thisPasswordIsRequired;
                  }
                },
                obscureText: cubit.obscureText,
                suffixIcon: GestureDetector(
                  onTap: () {
                    cubit.passwordsecurity();
                  },
                  child: cubit.obscureText
                      ? Icon(Icons.visibility_off_outlined)
                      : Icon(Icons.remove_red_eye_outlined),
                ),
              );
            },
          ),
          verticalSpacing(15.h),
          LocationDropDown(),
          verticalSpacing(15.h),
          CountryDropDown(),
          verticalSpacing(15.h),
          BlocBuilder<SignUpCubit, SignUpState>(
            buildWhen: (previous, current) =>
                current is ValidateUser || current is AddValuesCountry,
            builder: (context, state) {
              final cubit = context.read<SignUpCubit>();

              return Column(
                children: [
                  AppTextFormField(
                    controller: controllerPhoneNumber,
                    keyboardType: TextInputType.phone,
                    vertical: context.screenHeight / 61,
                    //   maxLength: cubit.maxLength,
                    prefixIcon: Container(
                      width: 70.w,
                      height: 41.6.h,
                      margin: EdgeInsets.only(left: 1),
                      decoration: BoxDecoration(
                        color: ColorsManager.platinumGray,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topLeft: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            " ${cubit.countryCode ?? AppStrings.countryName}",
                          ),
                        ],
                      ),
                    ),
                    error: cubit.validateUser
                        ? OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),

                            borderRadius: BorderRadius.circular(8),
                          )
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorsManager.lightGray,
                            ),

                            borderRadius: BorderRadius.circular(8),
                          ),
                    validator: (p0) {},
                    onChanged: (value) {
                      cubit.validatePhone(value);
                    },
                    errorText: cubit.validateUser ? cubit.message : "",
                    hintText: AppStrings.defaultNumber,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
