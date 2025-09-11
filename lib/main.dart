import 'package:car_rental_app/car_rental_app.dart';
import 'package:car_rental_app/core/di/dependency_injection.dart';
import 'package:car_rental_app/core/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await setupGetIt();

  runApp(CarRentalApp(appRouting: AppRouting()));
}
