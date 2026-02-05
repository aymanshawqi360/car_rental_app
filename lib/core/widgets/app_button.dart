import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/hex_color.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final Widget? widget;
  final TextStyle? style;
  final AlignmentGeometry? alignment;
  final TextAlign? textAlign;
  final Function()? onTap;
  final BoxBorder? border;

  const AppButton({
    super.key,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.widget,
    this.style,
    this.alignment,
    this.textAlign,
    required this.onTap,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? context.screenHeight / 15.5,
        alignment: alignment ?? Alignment.center,
        decoration: BoxDecoration(
          color: color ?? HexColor(hexColor: '21292B'),
          borderRadius: borderRadius ?? BorderRadius.circular(62),
          border: border ?? BoxBorder.all(color: Colors.transparent),
        ),
        child:
            widget ??
            Text(
              textAlign: textAlign ?? TextAlign.center,
              "Get Started",
              style: style ?? TextStyles.font18WhiteBold,
            ),
      ),
    );
  }
}
