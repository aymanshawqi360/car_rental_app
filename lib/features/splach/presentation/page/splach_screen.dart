import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/hex_color.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      context.pushNamedAndRemoveUntil(
        Routes.onboarding,
        predicate: (_) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.screenWidth,
            height: context.screenHeight,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.4, 1.0],
                colors: [
                  HexColor(hexColor: '110C0B').withOpacity(0.9),
                  Colors.transparent,
                ],
              ),
            ),
            child: Image.asset(AssetsManager.splash, fit: BoxFit.cover),
          ),

          Positioned(
            left: 20,
            right: 20,

            bottom: 70,
            child: Center(
              child: CircularProgressIndicator(
                // color: Colors.amber,
                strokeWidth: 6,
                strokeCap: StrokeCap.butt,
                strokeAlign: 1,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
