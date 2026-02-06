// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/widgets/app_cahed_network_image.dart';
import 'package:car_rental_app/features/home/domain/entity/car_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/spacing.dart';

class ReviewItem extends StatelessWidget {
  final int index;
  final Reviews reviews;
  const ReviewItem({super.key, required this.index, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: index == 0 ? 0.w : 18.w),
      child: Container(
        width: 243.w,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: BoxBorder.all(color: ColorsManager.gray),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppCahedNetworkImage(
                  height: 28.h,
                  width: 28.w,
                  image: AppStrings.defaultImage,
                  placeholder: CircleAvatar(
                    radius: 18.sp,
                    backgroundColor: ColorsManager.gray,
                  ),
                ),

                horizontalSpacing(8.w),
                Expanded(
                  child: Text(
                    reviews.userName ?? 'name',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  reviews.rate?.toString() ?? "5.0",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                horizontalSpacing(2.w),
                const Icon(Icons.star_rounded, color: Color(0xffFF8F3A)),
              ],
            ),
            verticalSpacing(8.h),
            Text(
              reviews.review ?? 'rating',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
