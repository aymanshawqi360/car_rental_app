import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_dropdown.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/entity/sign_up_location_entity.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/widget/location_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LocationDropDown extends StatefulWidget {
  const LocationDropDown({super.key});

  @override
  State<LocationDropDown> createState() => _LocationDropDownState();
}

class _LocationDropDownState extends State<LocationDropDown> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<SignUpCubit>().getLocation(isRefrash: true);
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
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<SignUpCubit, SignUpState>(
            buildWhen: (previous, current) => current is AddValuesLocation,
            builder: (context, state) {
              if (state is AddValuesLocation) {
                return Text(
                  state.locationName,
                  style: TextStyles.font14GrayRegular,
                );
              }
              return Text(
                AppStrings.location,

                style: TextStyles.font14GrayRegular,
              );
            },
          ),
          SvgPicture.asset(AssetsManager.arrowDropDown),
        ],
      ),

      countryList: BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) =>
            current is SignUpLocationFailure ||
            current is SignUpLocationLoading ||
            current is SignUpLocationSuccess,

        builder: (context, state) {
          final cubit = context.read<SignUpCubit>().locationList;
          return ListView.builder(
            controller: scrollController,
            itemCount: cubit.length + 1,
            itemBuilder: (context, index) {
              if (index < cubit.length) {
                return successState(context, cubit, index);
              } else if (state is SignUpLocationFailure) {
                return failureState();
              } else {
                return loadingState();
              }
            },
          );
        },
      ),
    );
  }

  LocationItem successState(
    BuildContext context,
    List<SignUpLocationEntity> cubit,
    int index,
  ) {
    return LocationItem(
      onTap: () {
        context.read<SignUpCubit>().addValueToLocationState(
          id: cubit[index].id,
          lat: cubit[index].lat,
          lng: cubit[index].lng,
          locationName: cubit[index].name,
        );
        context.pop();
      },
      signUpLocationEntity: cubit[index],
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
