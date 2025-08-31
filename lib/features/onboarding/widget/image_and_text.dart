import 'package:car_rental_app/config/constants/model_onboarding.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/hex_color.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/features/onboarding/widget/description_and_animatedcontainer_and_button.dart';
import 'package:flutter/material.dart';

class ImageAndText extends StatelessWidget {
  final ModelOnboarding modelOnboarding;
  const ImageAndText({super.key, required this.modelOnboarding});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.screenWidth,
          height: context.screenHeight,
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 1.0],
              colors: [
                HexColor(hexColor: '110C0B'),
                Colors.transparent,
              ],
            ),
          ),
          child: Image.asset(
            modelOnboarding.image.toString(),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 50,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              CircleAvatar(
                backgroundColor: HexColor(hexColor: 'FFFFFF'),
                radius: 36,
                child: modelOnboarding.icon,
              ),
              verticalSpacing(context.screenHeight / 20),
              Container(
                constraints: BoxConstraints(
                  maxWidth: context.screenWidth / 1.2,
                ),
                child: Text(
                  textAlign: TextAlign.start,
                  modelOnboarding.title.toString(),
                  style: TextStyles.font30WhiteSemiBold.copyWith(fontSize: 38),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,

          bottom: 70,
          child: DescriptionAndAnimatedcontainerAndButton(
            modelOnboarding: modelOnboarding,
          ),
        ),
      ],
    );
  }
}
