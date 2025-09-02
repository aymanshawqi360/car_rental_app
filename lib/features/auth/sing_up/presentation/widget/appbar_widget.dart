import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: context.bodyHeight * 0.15,
      child: Row(
        children: [
          SvgPicture.asset(
            AssetsManager.qentCar,
            width: context.screenWidth * 0.036,
            height: context.screenHeight * 0.036,
          ),
          horizontalSpacing(context.screenWidth / 60),
          SvgPicture.asset(
            AssetsManager.qent,
            width: context.screenWidth * 0.022,
            height: context.screenHeight * 0.022,
          ),
        ],
      ),
    );
  }
}
