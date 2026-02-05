import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/hex_color.dart';
import 'package:flutter/material.dart';

class AppIconCircle extends StatelessWidget {
  final Widget? widget;
  final double? width;
  final double? height;
  final Color? color;
  const AppIconCircle({
    super.key,
    this.widget,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.screenWidth / 9.7,
      height: height ?? context.screenHeight / 9.7,
      decoration: BoxDecoration(
        border: Border.all(color: HexColor(hexColor: 'D7D7D7')),
        shape: BoxShape.circle,
        color: color ?? Colors.transparent,
      ),
      child: widget,
    );
  }
}
