import 'package:car_rental_app/config/change_notifier/onboarding_change.dart';
import 'package:car_rental_app/core/constants/model_onboarding.dart';
import 'package:car_rental_app/config/responsive/size_config.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/hex_color.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class DescriptionAndAnimatedcontainerAndButton extends StatelessWidget {
  final ModelOnboarding modelOnboarding;
  const DescriptionAndAnimatedcontainerAndButton({
    super.key,
    required this.modelOnboarding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              modelOnboarding.description.toString(),
              style: TextStyles.font14WhiteRegular,
            ),
            verticalSpacing(context.screenHeight / 50),
            onboardingAnimatedContainer(context: context),
          ],
        ),
        verticalSpacing(context.screenHeight / 20),

        AppButton(
          height: SizeConfig.heightButton,
          widget: Text(
            textAlign: TextAlign.center,
            "Get Started",
            style: TextStyles.font18WhiteBold,
          ),
          onTap: () {
            OnboardingChange.instance.onTapOnButton(context: context);
          },
        ),
      ],
    );
  }

  Widget onboardingAnimatedContainer({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < ModelOnboarding.onboardings.length; i++)
          AnimatedContainer(
            curve: Curves.linear,
            margin: EdgeInsets.symmetric(horizontal: context.screenWidth / 50),
            duration: Duration(seconds: 1),
            width: OnboardingChange().value != i
                ? context.screenWidth / 50
                : context.screenWidth / 15,
            height: 8,
            decoration: BoxDecoration(
              color: OnboardingChange().value != i
                  ? HexColor(hexColor: 'D7D7D7')
                  : HexColor(hexColor: '9CA3AF'),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
      ],
    );
  }
}
