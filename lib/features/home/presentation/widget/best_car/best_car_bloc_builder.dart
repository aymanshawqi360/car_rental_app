import 'package:car_rental_app/core/widgets/app_list_view_separated.dart';
import 'package:car_rental_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:car_rental_app/features/home/presentation/cubit/home_state.dart';
import 'package:car_rental_app/features/home/presentation/widget/best_car/best_car_item.dart';
import 'package:car_rental_app/features/home/presentation/widget/best_car/best_car_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestCarBlocBuilder extends StatefulWidget {
  const BestCarBlocBuilder({super.key});

  @override
  State<BestCarBlocBuilder> createState() => _BestCarBlocBuilderState();
}

class _BestCarBlocBuilderState extends State<BestCarBlocBuilder> {
  @override
  void initState() {
    context.read<HomeCubit>().bestCarState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeBestCarLoading ||
          current is HomeBestCarFailure ||
          current is HomeBestCarSuccess,
      builder: (context, state) {
        switch (state) {
          case HomeBestCarLoading():
            return _buildLoadingState();
          case HomeBestCarFailure():
            return _buildFailureState();
          case HomeBestCarSuccess():
            return _buildSuccessState(state: state);

          default:
            return Center(child: Text("BestCarError"));
        }
      },
    );
  }

  _buildLoadingState() {
    return AppListViewSeparated(
      itemBuilder: (context, index) {
        return BestCarShimmerItem(index: index);
      },
      itemCount: 4,
    );
  }

  _buildFailureState() {}

  _buildSuccessState({required HomeBestCarSuccess state}) {
    return AppListViewSeparated(
      itemBuilder: (ocntext, index) {
        return BestCarItem(index: index, bestCarEntity: state.bestCars[index]);
      },
      itemCount: state.bestCars.length,
    );
  }
}
