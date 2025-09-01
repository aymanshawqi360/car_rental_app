import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DividerAndOr extends StatelessWidget {
  const DividerAndOr({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      // height: context.bodyHeight/0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          SizedBox(
            width: context.screenWidth*0.4,
            child: Divider(
              color: AppColors.lightGray,
            ),
          ),
          Text("Or",style: TextStyles.font14GrayRegular,),
          SizedBox(
            width: context.screenWidth*0.4,
            child: Divider(
              color: AppColors.lightGray,
            ),
          )

        ],
      ),
    );
  }
}
