import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ModelOnboarding {
  Widget? icon;
  String? title;
  String? description;
  String? image;
  ModelOnboarding._({this.description, this.icon, this.title, this.image});

  static List<ModelOnboarding> onboardings = [
    ModelOnboarding._(
      icon: SvgPicture.asset(AssetsManager.cartIcon, width: 53),
      title: AppStrings.onboardingTitle,
      description: AppStrings.description,
      image: AssetsManager.onboardingPageOne,
    ),
    ModelOnboarding._(
      icon: SvgPicture.asset(AssetsManager.cartIcon, width: 53),
      title: AppStrings.onboardingTitle,
      description: AppStrings.description,
      image: AssetsManager.onboardingPageTwo,
    ),
  ];
}
