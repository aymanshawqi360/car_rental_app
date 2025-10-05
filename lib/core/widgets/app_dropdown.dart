import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDropdown extends StatelessWidget {
  final Widget widget;
  final Widget countryList;

  final void Function(String)? onChanged;
  const AppDropdown({
    super.key,
    required this.widget,
    required this.countryList,

    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierColor: Colors.transparent,

          builder: (contextt) => BlocProvider.value(
            value: SignUpCubit.get(context),

            // ..getCountries(isRefrash: false),
            child: Dialog(
              insetPadding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.04,
              ),
              child: Container(
                height: context.screenHeight * 0.3,
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
                        onChanged: onChanged,
                      ),
                    ),
                    Expanded(child: countryList),
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
          child: widget,
        ),
      ),
    );
  }
}
