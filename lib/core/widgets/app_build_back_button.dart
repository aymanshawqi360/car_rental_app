import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBuildBackButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final void Function()? onTap;
  const AppBuildBackButton({
    super.key,
    this.width,
    this.height,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? 40.w,
        height: height ?? 40.h,

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorsManager.lightGray),
        ),
        child: child,
      ),
    );
  }
}
