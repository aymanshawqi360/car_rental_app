import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFavoriteButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;
  const AppFavoriteButton({
    super.key,
    this.width,
    this.height,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 37.w,
      height: height ?? 37.h,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        shape: BoxShape.circle,
        border: Border.all(color: ColorsManager.lightGray, width: 1.2),
      ),
      child:
          child ??
          Icon(
            Icons.favorite_border_rounded,
            color: ColorsManager.black,
            size: 20.sp,
          ),
    );
  }
}
