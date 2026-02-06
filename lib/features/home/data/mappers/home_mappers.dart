import 'package:car_rental_app/features/home/data/model/brand_response.dart';
import 'package:car_rental_app/features/home/data/model/car_collection_response.dart';
import 'package:car_rental_app/features/home/domain/entity/best_car_entity.dart';
import 'package:car_rental_app/features/home/domain/entity/brand_entity.dart';

class HomeMappers {
  HomeMappers._();

  static BrandEntity getBrandMapper(BrandResponse result) {
    return BrandEntity(
      id: result.id ?? 0,
      image: result.image ?? "defaultImage",
      name: result.name ?? "defaultImage",
    );
  }

  static BestCarEntity getBestCarsMapper(CarModel carModel) {
    return BestCarEntity(
      averageRate: carModel.averageRate ?? 0,
      dailyRent: carModel.dailyRent ?? "defaultDailyRent",
      firstImage: carModel.firstImage ?? "defaultFirstImage",
      id: carModel.id ?? 0,
      location: carModel.location?.name ?? "defaultLocation",
      seatingCapacity: carModel.seatingCapacity ?? "defaultSeatingCapacity",
      name: carModel.name ?? "defaultName",
    );
  }
}
