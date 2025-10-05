import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppLoadingButton extends StatelessWidget {
  final double? height;
  final double? width;
  const AppLoadingButton({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AssetsManager.loading,
      height: height ?? 36.5.h,
      width: width ?? 36.5.w,
      delegates: LottieDelegates(
        values: [
          ValueDelegate.color(const ['**'], value: ColorsManager.white),
        ],
      ),
    );
  }
}
