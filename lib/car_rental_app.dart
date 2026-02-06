import 'package:car_rental_app/core/routing/app_routing.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarRentalApp extends StatelessWidget {
  final AppRouting appRouting;
  const CarRentalApp({super.key, required this.appRouting});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: HexColor(hexColor: 'f8f8f8'),
            appBarTheme: AppBarTheme(color: HexColor(hexColor: 'f8f8f8')),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splash,
          //  (AppStrings.isLoggedInUser)
          // ? Routes.homeScreen
          // : Routes.onboarding,
          onGenerateRoute: appRouting.onGenerateRoute,
        );
      },
    );
  }
}
