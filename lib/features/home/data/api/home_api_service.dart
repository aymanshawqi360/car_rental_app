import 'package:car_rental_app/core/network/dio_factory.dart';
import 'package:car_rental_app/features/home/data/api/home_api_constants.dart';
import 'package:dio/dio.dart';

class HomeApiService {
  final DioFactory dioFactory;
  HomeApiService({required this.dioFactory});

  Future<Response> getBrands() async {
    try {
      final response = await dioFactory.get(HomeApiConstants.brand);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getBestCars() async {
    try {
      final response = await dioFactory.get(HomeApiConstants.carsBest);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
