import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/features/onboarding/page/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouting {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      default:
        return defaultPage();
    }
  }

  MaterialPageRoute<dynamic> defaultPage() =>
      MaterialPageRoute(builder: (_) => Scaffold(body: Text("data")));
}
