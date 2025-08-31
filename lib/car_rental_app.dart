import 'package:car_rental_app/core/routing/app_routing.dart';
import 'package:flutter/material.dart';

class CarRentalApp extends StatelessWidget {
  final AppRouting appRouting;
  const CarRentalApp({super.key, required this.appRouting});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouting.onGenerateRoute,
    );
  }
}
