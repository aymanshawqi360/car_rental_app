import 'package:car_rental_app/config/constants/country_code_to_emoji.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_dropdown.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_countries_entity.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/widget/country_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDropDown extends StatefulWidget {
  const CountryDropDown({super.key});

  @override
  State<CountryDropDown> createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<SignUpCubit>().getCountries(isRefrash: true);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppDropdown(
      countryList: BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) =>
            current is SingUpCountrySuccess ||
            current is SingUpCountryFailure ||
            current is SingUpCountryLoading,

        builder: (context, state) {
          final cubit = context.read<SignUpCubit>().countries;
          return ListView.builder(
            controller: scrollController,
            itemCount: cubit.length + 1,
            itemBuilder: (context, index) {
              if (index < cubit.length) {
                return successState(context, cubit, index);
              } else if (state is SingUpCountryFailure) {
                return failureState();
              } else {
                return loadingState();
              }
            },
          );
        },
      ),
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<SignUpCubit, SignUpState>(
            buildWhen: (previous, current) => current is AddValuesCountry,
            builder: (context, state) {
              if (state is AddValuesCountry) {
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
    );
  }

  CountryItem successState(
    BuildContext context,
    List<SignUpCountriesEntity> cubit,
    int index,
  ) {
    return CountryItem(
      onTap: () {
        context.read<SignUpCubit>().addValueToCountryState(
          countryCode: cubit[index].abbreviation.toString(),
          countryName: cubit[index].countryName.toString(),
          dialCode: cubit[index].id.toString(),
          // countryPhoneInfo.any((test) => test.name == cubit[index].country)
          // ? countryPhoneInfo[index].dialCode
          // : "",
          // cubit[index].id.toString(),
        );
        context.pop();
      },
      signUpCountriesEntity: cubit[index],
      //areaCode: countryPhoneInfo[index].dialCode,
    );
  }

  Center loadingState() {
    return Center(
      child: SizedBox(
        width: 10,
        height: 10,
        child: CircularProgressIndicator(strokeAlign: 5),
      ),
    );
  }

  Widget failureState() {
    return const Center(child: Text(AppStrings.noMoreData));
  }
}
