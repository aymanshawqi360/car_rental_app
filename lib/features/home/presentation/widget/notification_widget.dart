import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_icon_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppIconCircle(
          height: 38.h,
          width: 38.w,
          widget: Center(
            child: Offstage(
              offstage: false,
              child: SvgPicture.asset(
                AssetsManager.notificationsCarApp,
                height: 18.h,
                width: 18.w,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Offstage(
            offstage: false,
            child: Container(
              alignment: Alignment.center,
              width: 16.w,
              height: 16.h,
              decoration: BoxDecoration(
                color: ColorsManager.onyx,
                shape: BoxShape.circle,
              ),
              child: Text("2", style: TextStyles.font10WhiteBold),
            ),
          ),
        ),
      ],
    );
  }
}
