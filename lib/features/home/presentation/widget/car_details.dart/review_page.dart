import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/core/widgets/app_list_view.dart';
import 'package:car_rental_app/features/home/domain/entity/car_details.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/review_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewPage extends StatelessWidget {
  final CarDetatilsEntity carDetatilsEntityList;
  const ReviewPage({super.key, required this.carDetatilsEntityList});

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
              Text(
                "${AppStrings.review} (${carDetatilsEntityList.reviewsCount})",
                style: TextStyles.font13BlackSemiBold,
              ),
              Text(AppStrings.seeAll, style: TextStyles.font10GraySemiBold),
            ],
          ),
          verticalSpacing(28.h),

          SizedBox(
            height: 90.h,
            child: AppListView(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ReviewItem(
                  index: index,
                  reviews: carDetatilsEntityList.reviews![index],
                );
              },
              itemCount: carDetatilsEntityList.reviews?.length ?? 5,
            ),
          ),
          verticalSpacing(28.h),
          AppButton(
            onTap: () {},

            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Book Now",
                  style: TextStyles.font14WhiteBold,
                ),
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
