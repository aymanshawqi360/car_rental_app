import 'package:car_rental_app/car_rental_app.dart';
import 'package:car_rental_app/core/constants/show_local_notifications_service.dart';
import 'package:car_rental_app/core/functions/user_check.dart';
import 'package:car_rental_app/core/functions/user_service.dart';
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
  await ShowLocalNotificationService.init();

  sl.get<UserCheck>().checkIfUserExists();

  runApp(CarRentalApp(appRouting: AppRouting()));
}
