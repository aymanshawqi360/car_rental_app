import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/features/home/presentation/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental_app/features/home/presentation/car_details_cubit/car_details_state.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/car_details_shimmer/page_shimmer_defaulte.dart';
import 'package:car_rental_app/features/home/presentation/widget/car_details.dart/page_success_defaulte.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CarDetailsBlocBuilder extends StatelessWidget {
  const CarDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarDetailsCubit, CarDetailsState>(
      buildWhen: (previous, current) =>
          current is CarDetailsLoading ||
          current is CarDetailsFailure ||
          current is CarDetailsSuccess,
      builder: (context, state) {
        if (state is CarDetailsLoading) {
          return _buildLoadingState(context: context);
        } else if (state is CarDetailsSuccess) {
          return _buildSuccessState(state: state, context: context);
        } else if (state is CarDetailsFailure) {
          return _buildFailureState(context: context, state: state);
        } else {
          return Text("DefaultError");
        }
      },
    );
  }

  Widget _buildLoadingState({required BuildContext context}) {
    return PageShimmerDefaulte();
  }

  Widget _buildSuccessState({
    required CarDetailsSuccess state,
    required BuildContext context,
  }) {
    return PageSuccessDefaulte(state: state);
  }

  Widget _buildFailureState({
    required BuildContext context,
    required CarDetailsFailure state,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            "assets/lottie/animation_product.json",
            height: context.screenHeight / 2.8,
          ),
        ),
        // Text(
        //   "not product avaolable",
        //   style: TextStyle(
        //     color: Colors.red,
        //     fontSize: 20.sp,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ],
    );
  }
}
