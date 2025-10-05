import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/widgets/app_list_view_separated.dart';
import 'package:car_rental_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:car_rental_app/features/home/presentation/cubit/home_state.dart';
import 'package:car_rental_app/features/home/presentation/widget/brands/brand_item.dart';
import 'package:car_rental_app/features/home/presentation/widget/brands/brand_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandBlocListener extends StatelessWidget {
  const BrandBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeBrandLoading ||
          current is HomeBrandSuccess ||
          current is HomeBrandFailure,
      builder: (context, state) {
        switch (state) {
          case HomeBrandLoading():
            return _buildLoadingState();
          case HomeBrandSuccess():
            return _buildSuccessState(state: state);
          case HomeBrandFailure():
            return _buildFailureState();
          default:
            return Text("default error");
        }
      },
    );
  }

  _buildSuccessState({required HomeBrandSuccess state}) {
    return AppListViewSeparated(
      itemCount: state.brands.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsetsDirectional.only(
          start: index == 0 ? 0 : context.screenWidth / 22.5,
        ),
        child: BrandItem(brandEntity: state.brands[index]),
      ),
    );
  }

  _buildFailureState() {
    return Text('Error');
  }

  _buildLoadingState() {
    return AppListViewSeparated(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsetsDirectional.only(
          start: index == 0
              ? context.screenWidth / 40
              : context.screenWidth / 10.8,
        ),
        child: BrandLoadingShimmer(),
      ),
      itemCount: 4,
      // separatorBuilder: (context, index) => horizontalSpacing(22.1.w),
    );
  }
}
