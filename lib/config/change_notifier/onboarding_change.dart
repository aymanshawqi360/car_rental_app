import 'dart:developer';
import 'package:car_rental_app/core/constants/model_onboarding.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:flutter/material.dart';

class OnboardingChange extends ChangeNotifier {
  OnboardingChange._();

  static OnboardingChange instance = OnboardingChange._();

  factory OnboardingChange() => instance;

  // final controller = PageController();
  PageController controller = PageController();
  // late PageController controller;
  int value = 0;

  void onTapOnButton({required BuildContext context}) {
    if (value < ModelOnboarding.onboardings.length - 1) {
      controller.animateToPage(
        value++,
        duration: Duration(seconds: 1),
        curve: Curves.linear,
      );
      log(
        "v<loe =====================================${controller.page.toString()}",
      );
      log("valueloe<=============================${value}");
    } else {
      log("successfull");
      @override
      void dispose() {
        controller.dispose();
        log(" ===================================PageController");
        super.dispose();
      }

      context.pushNamedAndRemoveUntil(Routes.login, predicate: (_) => false);
      log(
        "success =====================================${controller.page.toString()}",
      );
    }

    log("value=============================${value}");

    notifyListeners();
  }

  // void userScroll(int value) {
  //   if (value < 2) {
  //     this.value = value;
  //     controller.animateToPage(
  //       value,
  //       duration: Duration(seconds: 1),
  //       curve: Curves.linear,
  //     );
  //   }
  //   notifyListeners();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  //   log("userScroll=============================${this.value}");
}
