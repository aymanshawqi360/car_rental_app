import 'package:car_rental_app/core/routing/app_routing.dart';
import 'package:car_rental_app/core/utils/hex_color.dart';
import 'package:flutter/material.dart';

class CarRentalApp extends StatelessWidget {
  final AppRouting appRouting;
  const CarRentalApp({super.key, required this.appRouting});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor(hexColor: 'f8f8f8'),
        appBarTheme: AppBarTheme(color: HexColor(hexColor: 'f8f8f8')),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouting.onGenerateRoute,
    );
  }
}
