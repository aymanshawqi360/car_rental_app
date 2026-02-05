import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/widgets/app_appbar.dart';
import 'package:car_rental_app/core/widgets/app_build_back_button.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/car_details_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      appBar: AppAppbar(
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: AppBuildBackButton(
            height: 35.h,
            width: 35.w,
            child: Icon(Icons.arrow_back_ios_new),
            onTap: () => context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              predicate: (_) => false,
            ),
          ),
        ),
        title: Text(
          AppStrings.carDetails,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),

        actions: [
          AppBuildBackButton(
            height: 35.h,
            width: 35.w,
            child: Icon(Icons.more_horiz, size: 24.r),
          ),
        ],
      ),

      body: CarDetailsBlocBuilder(),
    );
  }
}
