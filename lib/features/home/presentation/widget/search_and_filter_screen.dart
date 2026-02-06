import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/widgets/app_icon_circle.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAndFilterScreen extends StatelessWidget {
  const SearchAndFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: AppTextFormField(
              prefixIcon: Transform.scale(
                scale: 0.4.r,
                child: SvgPicture.asset(AssetsManager.searchCarApp),
              ),
              vertical: 12.h,

              borderRadius: BorderRadius.circular(15),
              hintText: 'Search your dream car.....',
            ),
          ),
          Expanded(
            child: AppIconCircle(
              width: 42.w,
              color: ColorsManager.white,
              widget: Center(
                child: SvgPicture.asset(
                  AssetsManager.filter,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              height: 42.h,
            ),
          ),
        ],
      ),
    );
  }
}
