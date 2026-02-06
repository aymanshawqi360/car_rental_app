import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/features/home/domain/entity/best_car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SeatingCapacityAndPrice extends StatelessWidget {
  final BestCarEntity bestCarEntity;
  const SeatingCapacityAndPrice({super.key, required this.bestCarEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              SvgPicture.asset(AssetsManager.sofa, width: 13.w, height: 13.h),
              horizontalSpacing(2.w),
              Flexible(
                child: Text(
                  bestCarEntity.seatingCapacity?.toString() ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font12GraySemiBold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              SvgPicture.asset(AssetsManager.money, width: 13.w, height: 13.h),
              horizontalSpacing(2.w),
              Flexible(
                child: Text(
                  "\$${bestCarEntity.price}/Day",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font11BlackSemiBold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
