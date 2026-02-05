import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/car_details_shimmer/car_details_shimmer.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/car_details_shimmer/car_features_shimmer.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/car_details_shimmer/car_owner_shimmer.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/car_details_shimmer/review_page_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PageShimmerDefaulte extends StatelessWidget {
  const PageShimmerDefaulte({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 180.h,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: context.screenWidth,
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
        ),
        Container(
          height: context.screenHeight * 0.6,
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      CarDetailsShimmer(),
                      verticalSpacing(25.h),
                      CarOwnerShimmer(),
                      CarFeaturesShimmer(),
                      ReviewPageShimmer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
