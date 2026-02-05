import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';

class BestCarShimmerItem extends StatelessWidget {
  final int index;
  const BestCarShimmerItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 18.w),
      child: Card(
        elevation: 1.8,
        color: ColorsManager.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: 165.w,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: context.screenHeight * 0.13,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: 5.w,
                    right: 10.w,
                    top: 7.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 12.h,
                        width: 100.w,
                        color: Colors.white,
                      ),

                      verticalSpacing(8.h),
                      Container(height: 12.h, width: 60.w, color: Colors.white),
                      verticalSpacing(8.h),
                      Container(height: 12.h, width: 80.w, color: Colors.white),
                      verticalSpacing(8.h),
                      Container(height: 12.h, width: 80.w, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
