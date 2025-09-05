import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/features/auth/login/presentation/page/login_screen.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/page/reset_password_screen.dart';
import 'package:car_rental_app/features/auth/sing_up/presentation/page/sing_up_screen.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/page/verification_code_screen.dart';
import 'package:car_rental_app/features/auth/verify_your_phone_number/presentation/page/verify_your_phone_number_screen.dart';
import 'package:car_rental_app/features/onboarding/page/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouting {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.login:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginScreen(),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Animation<Offset> offsetAnimation = Tween<Offset>(
            //   begin: Offset(1, 0),
            //   end: Offset(0, 0),
            // ).animate(animation);
            return FadeTransition(opacity: animation, child: child);
            // SlideTransition(position: offsetAnimation, child: child);
          },
        );

      case Routes.signUp:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SingUpScreen(),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case Routes.resetPassword:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ResetPasswordScreen(),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case Routes.verifyYourPhoneNumber:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const VerifyYourPhoneNumberScreen(),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case Routes.verificationCodeScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const VerificationCodeScreen(),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );

      default:
        return defaultPage();
    }
  }

  MaterialPageRoute<dynamic> defaultPage() =>
      MaterialPageRoute(builder: (_) => Scaffold(body: Text("data")));
}
