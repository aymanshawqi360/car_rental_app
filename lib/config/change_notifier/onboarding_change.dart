import 'dart:developer';
import 'package:car_rental_app/config/constants/model_onboarding.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:flutter/material.dart';

class OnboardingChange extends ChangeNotifier {
  OnboardingChange._();

  static OnboardingChange instance = OnboardingChange._();

  factory OnboardingChange() => instance;

  PageController controller = PageController();
  int value = 0;

  void onTapOnButton({required BuildContext context}) {
    if (value < ModelOnboarding.onboardings.length - 1) {
      controller.animateToPage(
        value + 1,
        duration: Duration(seconds: 1),
        curve: Curves.linear,
      );
    } else {
      log("successfull");
      context.pushNamedAndRemoveUntil(Routes.login, predicate: (_) => false);
    }

    notifyListeners();
  }

  void userScroll(int value) {
    if (value < 2) {
      this.value = value;
      controller.animateToPage(
        value,
        duration: Duration(seconds: 1),
        curve: Curves.linear,
      );
    }

    notifyListeners();
  }
}
