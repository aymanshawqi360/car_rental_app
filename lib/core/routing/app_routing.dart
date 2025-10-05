import 'package:car_rental_app/core/di/dependency_injection.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/features/auth/email_verification/presentation/cubit/email_verification_cubit.dart';
import 'package:car_rental_app/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:car_rental_app/features/auth/login/presentation/screen/login_screen.dart';
import 'package:car_rental_app/features/auth/new_password/presentation/cubit/new_password_cubit.dart';
import 'package:car_rental_app/features/auth/new_password/presentation/screen/new_password.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:car_rental_app/features/auth/email_verification/presentation/screen/email_verification_code.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/screen/reset_password_screen.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/cubit/verification_code_cubit.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/page/verification_code_screen.dart';
import 'package:car_rental_app/features/auth/verify_your_phone_number/presentation/page/verify_your_phone_number_screen.dart';
import 'package:car_rental_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:car_rental_app/features/home/presentation/screen/home_screen.dart';
import 'package:car_rental_app/features/onboarding/page/onboarding_screen.dart';
import 'package:car_rental_app/features/splach/presentation/page/splach_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouting {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.login:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: const LoginScreen(),
          ),
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
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => sl<SignUpCubit>()
              ..getLocation(isRefrash: false)
              ..getCountries(isRefrash: false),
            child: const SignUpScreen(),
          ),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case Routes.resetPassword:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => sl<ResetPasswordCubit>(),
            child: const ResetPasswordScreen(),
          ),
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
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) =>
                sl<VerificationCodeCubit>()..checkIfPhoneNumber(),
            child: const VerificationCodeScreen(),
          ),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case Routes.emailVerificationCode:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => sl<EmailVerificationCubit>(),
            child: const EmailVerificationCode(),
          ),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case Routes.newPassword:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => sl<NewPasswordCubit>(),
            child: const NewPassword(),
          ),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplachScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<HomeCubit>()..brandState(),
            child: HomeScreen(),
          ),
        );

      default:
        return defaultPage();
    }
  }

  MaterialPageRoute<dynamic> defaultPage() =>
      MaterialPageRoute(builder: (_) => Scaffold(body: Text("data")));
}
