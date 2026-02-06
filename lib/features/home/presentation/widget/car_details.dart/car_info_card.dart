import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/features/home/domain/entity/car_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarInfoCard extends StatelessWidget {
  final CarDetatilsEntity carDetatilsEntity;
  const CarInfoCard({super.key, required this.carDetatilsEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 230.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carDetatilsEntity.name ?? AppStrings.carDetailsTitle,
                      style: TextStyles.font16BlackSemiBold,
                    ),
                    Text(
                      maxLines: 2,

                      carDetatilsEntity.description ??
                          AppStrings.carDetailsDescription,
                      style: TextStyles.font10LightGrayRegular,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        carDetatilsEntity.reviewsAvg?.toString() ?? "5.0",
                        style: TextStyles.font13BlackSemiBold,
                      ),
                      Icon(Icons.star_rounded, color: Colors.amber[900]),
                    ],
                  ),

                  Text("(100+Reviews)", style: TextStyles.font10GrayRegular),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
