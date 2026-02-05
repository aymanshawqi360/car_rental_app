import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ReviewPageShimmer extends StatelessWidget {
  const ReviewPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, top: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  // alignment: Alignment.center,
                  width: 80.w,
                  height: 15.h,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  // alignment: Alignment.center,
                  width: 30.w,
                  height: 10.h,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
            ],
          ),
          verticalSpacing(28.h),

          SizedBox(
            height: 90.h,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, __) => Container(
                  width: 243.w,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
          ),

          verticalSpacing(28.h),

          AppButton(
            onTap: () {},
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Book Now", style: TextStyles.font14WhiteBold),
                horizontalSpacing(10.w),
                Icon(Icons.arrow_forward, color: ColorsManager.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
