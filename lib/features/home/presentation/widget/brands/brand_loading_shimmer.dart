import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandLoadingShimmer extends StatelessWidget {
  const BrandLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 53.w,
            height: 53.h,
            decoration: BoxDecoration(
              color: ColorsManager.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(height: 12.h, width: 50.w, color: Colors.white),
        ),
      ],
    );
  }
}
