import 'package:car_rental_app/core/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAnAccount extends StatelessWidget {
  final String fristText;
  final String lateText;
  final void Function()? onTap;
  const DontHaveAnAccount({
    super.key,
    required this.fristText,
    required this.lateText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onTap,
              style: TextStyles.font16OnyxRegular,
              text: lateText,
            ),
          ],
          style: TextStyles.font16GrayRegular,
          text: fristText,
        ),
      ),
    );
  }
}
