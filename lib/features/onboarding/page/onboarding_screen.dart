import 'package:car_rental_app/config/change_notifier/onboarding_change.dart';
import 'package:car_rental_app/config/constants/model_onboarding.dart';
import 'package:car_rental_app/features/onboarding/widget/image_and_text.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController controller;
  @override
  void initState() {
    controller = OnboardingChange().controller;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.hasClients) {
        controller.jumpToPage(0);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: OnboardingChange(),
        builder: (context, child) {
          return PageView(
            onPageChanged: (value) {
              OnboardingChange().userScroll(value);
            },
            controller: controller,
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
