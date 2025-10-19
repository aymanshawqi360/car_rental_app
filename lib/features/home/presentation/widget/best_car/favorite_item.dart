import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/widgets/app_cahed_network_image.dart';
import 'package:car_rental_app/features/home/domain/entity/best_car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteItem extends StatelessWidget {
  final BestCarEntity bestCarEntity;
  const FavoriteItem({super.key, required this.bestCarEntity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.screenHeight * 0.13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: ColorsManager.lightGray,
          ),
          child: AppCahedNetworkImage(
            image: bestCarEntity.firstImage ?? "",
            placeholder: Container(
              height: context.screenHeight * 0.13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsManager.lightGray,
                    width: 1.2,
                  ),
                ),
                child: Icon(
                  Icons.favorite_border_rounded,
                  color: ColorsManager.black,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
