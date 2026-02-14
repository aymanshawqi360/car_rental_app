import 'package:car_rental_app/core/constants/model_onboarding.dart';
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
      value++;
      controller.animateToPage(
        value,
        duration: Duration(seconds: 1),
        curve: Curves.linear,
      );
    } else {
      context.pushNamedAndRemoveUntil(Routes.login, predicate: (_) => false);
    }

    notifyListeners();
  }
}
