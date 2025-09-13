import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/singup_cubit.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/singup_state.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/widget/country_item.dart';
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
  // late TextEditingController controllerPhoneNumber;
  @override
  void initState() {
    controllerFullName = context.read<SignUpCubit>().controllerFullName;
    controllerEmail = context.read<SignUpCubit>().controllerEmail;
    controllerPassword = context.read<SignUpCubit>().controllerPassword;
    controllerCountry = context.read<SignUpCubit>().controllerCountry;
    // controllerPhoneNumber = context.read<SingUpCubit>().controllerPhoneNumber;
    super.initState();
  }

  @override
  void dispose() {
    controllerFullName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerCountry.dispose();
    // controllerPhoneNumber.dispose();
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
                return AppStrings.thisFullNameIsRequired;
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
          AppTextFormField(
            controller: controllerPassword,
            hintText: AppStrings.password,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return AppStrings.thisPasswordIsRequired;
              }
            },
          ),
          verticalSpacing(15.h),
          CountryItem(),
          verticalSpacing(15.h),
          BlocBuilder<SignUpCubit, SingUpState>(
            buildWhen: (previous, current) =>
                current is ValidateUser || current is SingUpString,
            builder: (context, state) {
              final cubit = context.read<SignUpCubit>();
              return Column(
                children: [
                  AppTextFormField(
                    //   controller: controllerPhoneNumber,
                    keyboardType: TextInputType.phone,
                    maxLength: cubit.maxLength,
                    prefixIcon: Container(
                      width: 70.w,
                      height: 41.5.h,
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
                          Text(cubit.countryCode ?? AppStrings.countryName),
                          Text("+${cubit.dialCode ?? AppStrings.areaCode}"),
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
