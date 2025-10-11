import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_cahed_network_image.dart';
import 'package:car_rental_app/features/home/domain/entity/brand_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandItem extends StatelessWidget {
  final BrandEntity brandEntity;
  const BrandItem({super.key, required this.brandEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipOval(
          child: AppCahedNetworkImage(
            image: brandEntity.image ?? "",
            width: 53.w,
            height: 53.h,
            fit: BoxFit.contain,
            placeholder: CircleAvatar(
              radius: 25.r,
              backgroundColor: ColorsManager.gray,
            ),
          ),
        ),
        SizedBox(
          width: 70.w,
          child: Text(
            brandEntity.name.toString(),
            textAlign: TextAlign.center,
            style: TextStyles.font10GrayRegular.copyWith(
              fontWeight: FontWeight.w600,
            ),
            // softWrap: true,
            // overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
