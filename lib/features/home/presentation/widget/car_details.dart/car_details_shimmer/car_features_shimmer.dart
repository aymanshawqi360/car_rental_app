import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CarFeaturesShimmer extends StatelessWidget {
  const CarFeaturesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(width: 100.w, height: 14.h, color: Colors.white),
          ),
          verticalSpacing(12.h),

          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 18,
              mainAxisSpacing: 8,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Card(
                  color: ColorsManager.platinumGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0.1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(radius: 15, backgroundColor: Colors.white),
                        verticalSpacing(12.h),
                        Container(
                          width: 40.w,
                          height: 8.h,
                          color: Colors.white,
                        ),
                        verticalSpacing(4.h),
                        Container(
                          width: 60.w,
                          height: 10.h,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
