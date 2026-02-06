import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/features/home/presentation/car_details_cubit/car_details_state.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/car_display_frame.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/car_features_page.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/car_info_card.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/car_owner.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/review_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageSuccessDefaulte extends StatelessWidget {
  final CarDetailsSuccess state;
  const PageSuccessDefaulte({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 180.h,
          child: CarDisplayFrame(carDetatilsEntity: state.carDetatilsEntity),
        ),
        Container(
          height: context.screenHeight * 0.6,
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      CarInfoCard(carDetatilsEntity: state.carDetatilsEntity),
                      Divider(),
                      CarOwner(carDetatilsEntity: state.carDetatilsEntity),
                      CarFeaturesPage(
                        carDetatilsEntity: state.carDetatilsEntity,
                      ),
                      ReviewPage(
                        carDetatilsEntityList: state.carDetatilsEntity,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
