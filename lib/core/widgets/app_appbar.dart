import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? title;
  final Widget? leading;
  final bool centerTitle;
  const AppAppbar({
    super.key,
    this.actions,
    this.title,
    this.leading,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0.0,
      scrolledUnderElevation: 0,

      shadowColor: ColorsManager.onyx,

      toolbarHeight: 60.h,

      leading: leading,
      centerTitle: centerTitle,
      title:
          title ??
          Row(
            children: [
              SvgPicture.asset(
                AssetsManager.qentCar,
                width: 33.w,
                height: 33.h,
              ),
              horizontalSpacing(context.screenWidth * 0.02),
              SvgPicture.asset(AssetsManager.qent, width: 18.w, height: 18.h),
            ],
          ),

      // title: Text("Car Details"),
      actionsPadding: EdgeInsets.symmetric(
        horizontal: context.screenWidth / 32,
      ),

      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20.h);
}
