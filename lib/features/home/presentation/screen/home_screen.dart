import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_appbar.dart';
import 'package:car_rental_app/core/widgets/app_icon_circle.dart';
import 'package:car_rental_app/features/home/presentation/widget/brands/brand_bloc_listener.dart';
import 'package:car_rental_app/features/home/presentation/widget/notification_widget.dart';
import 'package:car_rental_app/features/home/presentation/widget/search_and_filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: context.screenWidth / 25,
              right: context.screenWidth / 25,
            ),
            child: Column(
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
                  // color: Colors.red,
                  constraints: BoxConstraints(
                    maxHeight: 80.h,
                    //  context.screenHeight * 0.13,
                  ),

                  child: const BrandBlocListener(),
                ),
              ],
            ),
          ),
        ],
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
