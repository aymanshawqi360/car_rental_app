import 'package:car_rental_app/config/change_notifier/onboarding_change.dart';
import 'package:car_rental_app/core/constants/model_onboarding.dart';
import 'package:car_rental_app/features/onboarding/widget/image_and_text.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // late PageController pageController;
  // @override
  // void initState() {
  //   pageController = OnboardingChange.instance.controller;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final onboarding = OnboardingChange.instance;

    return Scaffold(
      body: ListenableBuilder(
        listenable: onboarding,
        builder: (context, child) {
          return PageView(
            // onPageChanged: (value) {
            //          OnboardingChange().userScroll(value);
            // },
            controller: onboarding.controller,
            //  OnboardingChange.instance.controller,
            children: List.generate(ModelOnboarding.onboardings.length, (
              index,
            ) {
              return ImageAndText(
                modelOnboarding: ModelOnboarding.onboardings[index],
              );
            }),
          );
        },
      ),
    );
  }
}
