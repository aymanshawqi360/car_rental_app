import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  const AppAppbar({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0.3,
      bottomOpacity: 50,

      shadowColor: ColorsManager.onyx,
      title: Row(
        children: [
          SvgPicture.asset(AssetsManager.qentCar, width: 33.w, height: 33.h),
          horizontalSpacing(context.screenWidth * 0.02),
          SvgPicture.asset(AssetsManager.qent, width: 18.w, height: 18.h),
        ],
      ),
      actionsPadding: EdgeInsets.symmetric(
        horizontal: context.screenWidth / 20,
      ),

      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20.h);
}
