import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowErrorMessage {
  ShowErrorMessage._();

  static final ShowErrorMessage instance = ShowErrorMessage._();
  factory ShowErrorMessage() => instance;
  showErrorMessage({
    required BuildContext context,
    required String errorMessage,
  }) => showDialog(
    context: context,

    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // icon: const Icon(Icons.error, color: Colors.red, size: 32),
        title: Text(
          "Error",
          style: TextStyle(fontSize: 15.sp, color: Colors.red),
        ),

        content: Text(
          errorMessage,
          // style: TextStyles.font14DarkTaupeRegular,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Text(
              AppStrings.cancel,
              style: TextStyle(color: ColorsManager.onyx),
            ),
          ),
        ],
      );
    },
  );
}
