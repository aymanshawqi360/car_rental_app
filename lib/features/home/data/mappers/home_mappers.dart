import 'package:car_rental_app/features/home/data/model/brand_response.dart';
import 'package:car_rental_app/features/home/domain/entity/brand_entity.dart';

class HomeMappers {
  HomeMappers._();

  static BrandEntity getBrandEntity(BrandResponse result) {
    return BrandEntity(
      id: result.id ?? 0,
      image: result.image ?? "defaultImage",
      name: result.name ?? "defaultImage",
    );
  }
}
