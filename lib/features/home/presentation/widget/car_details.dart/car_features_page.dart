import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/features/home/domain/entity/car_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarFeaturesPage extends StatelessWidget {
  final CarDetatilsEntity carDetatilsEntity;
  const CarFeaturesPage({super.key, required this.carDetatilsEntity});

  @override
  Widget build(BuildContext context) {
    final features = [
      {'icon': Icons.event_seat},
      {'icon': Icons.settings},
      {'icon': Icons.speed},
      {'icon': Icons.auto_mode},
      {'icon': Icons.battery_charging_full},
      {'icon': Icons.local_parking},
      {'icon': Icons.local_parking},
      {'icon': Icons.local_parking},
      {'icon': Icons.local_parking},
      {'icon': Icons.local_parking},
    ];

    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.carFeatures, style: TextStyles.font13BlackSemiBold),
          verticalSpacing(12.h),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: carDetatilsEntity.features?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 18,
              mainAxisSpacing: 8,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              final feature = features[index];
              return Card(
                color: ColorsManager.platinumGray,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0.1,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: ColorsManager.white,
                        child:
                            // Image.network(
                            //   carDetatilsEntity.features?[index].image ?? '',
                            // ),
                            Icon(
                              feature['icon'] as IconData,
                              size: 15.sp,
                              color: Colors.grey[700],
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        carDetatilsEntity.features?[index].name ?? "Advance",
                        style: TextStyles.font10GraySemiBold,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        carDetatilsEntity.features?[index].value ??
                            "Auto Parking",
                        style: TextStyles.font11BlackSemiBold,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
