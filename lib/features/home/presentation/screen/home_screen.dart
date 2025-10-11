import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_appbar.dart';
import 'package:car_rental_app/core/widgets/app_icon_circle.dart';
import 'package:car_rental_app/features/home/presentation/widget/best_car/best_car_bloc_builder.dart';
import 'package:car_rental_app/features/home/presentation/widget/brands/brand_bloc_listener.dart';
import 'package:car_rental_app/features/home/presentation/widget/notification_widget.dart';
import 'package:car_rental_app/features/home/presentation/widget/search_and_filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: EdgeInsets.only(
          left: context.screenWidth / 35,
          right: context.screenWidth / 35,
        ),
        child: Column(
          children: [
            Column(
              children: [
                const SearchAndFilterScreen(),
                verticalSpacing(context.screenHeight / 40),
                Row(
                  children: [
                    Text(
                      AppStrings.brands,
                      style: TextStyles.font13BlackSemiBold,
                    ),
                  ],
                ),
                verticalSpacing(10.h),
                Container(
                  constraints: BoxConstraints(maxHeight: 80.h),

                  child: const BrandBlocListener(),
                ),
              ],
            ),
            verticalSpacing(50.h),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Best Cars", style: TextStyles.font13BlackSemiBold),
                    Text("View All", style: TextStyles.font10GrayRegular),
                  ],
                ),
                verticalSpacing(18.h),
                Row(
                  children: [
                    Text(
                      AppStrings.available,
                      style: TextStyles.font10GrayRegular.copyWith(
                        fontSize: 12.r,
                      ),
                    ),
                  ],
                ),
                verticalSpacing(10.h),
                Container(
                  constraints: BoxConstraints(maxHeight: 183.h),
                  child: const BestCarBlocBuilder(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppAppbar _appBar() {
    return AppAppbar(
      actions: [
        NotificationWidget(),
        horizontalSpacing(18.w),
        AppIconCircle(height: 38.h, width: 38.w),
      ],
    );
  }
}
