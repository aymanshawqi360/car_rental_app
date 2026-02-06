import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';

import 'package:car_rental_app/core/widgets/app_cahed_network_image.dart';
import 'package:car_rental_app/core/widgets/app_favorite_button.dart';
import 'package:car_rental_app/features/home/domain/entity/car_details.dart';
import 'package:car_rental_app/features/home/presentation/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental_app/features/home/presentation/car_details_cubit/car_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDisplayFrame extends StatelessWidget {
  final CarDetatilsEntity carDetatilsEntity;
  const CarDisplayFrame({super.key, required this.carDetatilsEntity});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CarDetailsCubit>();
    return Column(
      children: [
        SizedBox(
          height: 160.h,
          width: double.infinity,
          child: PageView.builder(
            itemCount: carDetatilsEntity.imageUrls?.length ?? 0,
            onPageChanged: (index) => cubit.dotsLoader(index),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  AppCahedNetworkImage(
                    height: 160.h,
                    width: context.screenWidth,
                    image: carDetatilsEntity.imageUrls?[index] ?? "",
                    placeholder: Container(
                      width: 50.w,
                      height: 50.h,
                      color: Colors.transparent,
                    ),
                  ),
                  const Positioned(right: 30, child: AppFavoriteButton()),
                ],
              );
            },
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            carDetatilsEntity.imageUrls?.length ?? 3,
            (int index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: BlocBuilder<CarDetailsCubit, CarDetailsState>(
                buildWhen: (previous, current) => current is DotsLoader,
                builder: (context, state) {
                  return Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: cubit.dotCount == index
                          ? ColorsManager.gray
                          : ColorsManager.lightGray,
                      shape: BoxShape.circle,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
