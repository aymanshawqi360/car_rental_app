import 'package:car_rental_app/core/di/dependency_injection.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_cahed_network_image.dart';
import 'package:car_rental_app/features/home/domain/entity/best_car_entity.dart';
import 'package:car_rental_app/features/home/presentation/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental_app/features/home/presentation/screen/car_details_screen.dart';
import 'package:car_rental_app/features/home/presentation/widget/best_car/seating_capacity_and_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BestCarItem extends StatelessWidget {
  final int index;
  final BestCarEntity bestCarEntity;
  const BestCarItem({
    super.key,
    required this.index,
    required this.bestCarEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 18.w),
      child: Card(
        elevation: 1.8,
        color: ColorsManager.white,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: 165.w,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          BlocProvider(
                            create: (context) => sl<CarDetailsCubit>()
                              ..carDetails(carId: bestCarEntity.id.toString()),
                            child: CarDetailsScreen(),
                          ),

                      reverseTransitionDuration: Duration(milliseconds: 250),
                      transitionDuration: Duration(milliseconds: 250),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            Animation<Offset> offsetAnimation = Tween<Offset>(
                              begin: Offset(1, 0),
                              end: Offset(0, 0),
                            ).animate(animation);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                    ),
                    (_) => false,
                  );
                },
                child: Column(
                  children: [
                    buildCarImage(context),
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: 5.w, right: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          verticalSpacing(8.h),
                          Text(
                            bestCarEntity.name ?? "",
                            style: TextStyles.font11BlackSemiBold,
                          ),
                          verticalSpacing(2.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (bestCarEntity.averageRate ?? 6.5).toString(),
                              ),
                              Icon(
                                Icons.star_rounded,
                                color: Colors.orangeAccent,
                                size: 17.sp,
                              ),
                            ],
                          ),
                          verticalSpacing(2.h),
                          buildLocation(),
                          verticalSpacing(2.h),
                          SeatingCapacityAndPrice(bestCarEntity: bestCarEntity),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: ColorsManager.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorsManager.lightGray,
                          width: 1.2,
                        ),
                      ),
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: ColorsManager.black,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildCarImage(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: ColorsManager.lightGray,
      ),
      child: AppCahedNetworkImage(
        image: bestCarEntity.firstImage ?? "",
        placeholder: Container(
          height: context.screenHeight * 0.13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }

  Row buildLocation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(AssetsManager.location, width: 12.w, height: 12.h),
        horizontalSpacing(2.w),
        Text(bestCarEntity.location ?? "", style: TextStyles.font10GrayRegular),
      ],
    );
  }
}
