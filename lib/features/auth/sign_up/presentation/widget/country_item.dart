import 'dart:developer';

import 'package:car_rental_app/config/constants/country_code_to_emoji.dart';
import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/countries.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierColor: Colors.transparent,

          builder: (contextt) => BlocProvider.value(
            value: SignUpCubit.get(context),
            child: Dialog(
              insetPadding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.04,
              ),
              child: Container(
                height: context.screenHeight * 0.5,
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(
                        top: 10,
                        left: 5,
                        right: 5,
                      ),
                      child: AppTextFormField(
                        prefixIcon: Icon(Icons.search),
                        hintText: AppStrings.search,
                        borderSide: BorderSide(color: ColorsManager.onyx),
                        vertical: context.screenHeight / 120,
                        onChanged: (value) {},
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: countries.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              log(countries[index].code);
                              log(countries[index].maxLength.toString());
                              context.read<SignUpCubit>().add(
                                countryCode: countries[index].code,
                                countryName: countries[index].name,
                                maxLength: countries[index].maxLength,
                                dialCode: countries[index].dialCode,
                                // regionCode: countries[index].regionCode,
                              );
                              context.pop();
                            },
                            trailing: Text("+${countries[index].dialCode}"),
                            leading: Image.asset(
                              "assets/flags/${countries[index].code.toLowerCase()}.png",
                              package: AppStrings.intlPhoneField,
                              scale: 4,
                            ),

                            title: Text(countries[index].name),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: context.screenHeight / 56),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(8),
          border: BoxBorder.all(color: ColorsManager.lightGray),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth / 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<SignUpCubit, SingUpState>(
                buildWhen: (previous, current) => current is SingUpString,
                builder: (context, state) {
                  if (state is SingUpString) {
                    return Row(
                      children: [
                        Text(
                          CountryCodeToEmoji.countryCodeToEmoji(
                            countryCode: state.countryCode,
                          ),
                          style: TextStyles.font14GrayRegular,
                        ),
                        horizontalSpacing(context.screenWidth * 0.02),
                        Text(
                          state.countryName,
                          style: TextStyles.font14GrayRegular,
                        ),
                      ],
                    );
                  }
                  return Text(
                    AppStrings.country,

                    style: TextStyles.font14GrayRegular,
                  );
                },
              ),
              SvgPicture.asset(AssetsManager.arrowDropDown),
            ],
          ),
        ),
      ),
    );
  }
}
