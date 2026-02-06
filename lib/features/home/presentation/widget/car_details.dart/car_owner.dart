import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/features/home/domain/entity/car_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarOwner extends StatelessWidget {
  final CarDetatilsEntity carDetatilsEntity;
  const CarOwner({super.key, required this.carDetatilsEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(),
              horizontalSpacing(15.w),
              Text(
                carDetatilsEntity.ownerFullName ?? "Hela Quintin",
                style: TextStyles.font14BlackSemiBold,
              ),
              horizontalSpacing(10.w),
              SvgPicture.asset(AssetsManager.verificationCheckmark),
            ],
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 30.w,
                height: 30.h,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorsManager.lightGray),
                ),
                child: SvgPicture.asset(AssetsManager.phone),
              ),
              horizontalSpacing(10.w),
              Container(
                alignment: Alignment.center,
                width: 30.w,
                height: 30.h,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorsManager.lightGray),
                ),
                child: SvgPicture.asset(AssetsManager.message),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
