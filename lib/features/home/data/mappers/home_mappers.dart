import 'package:car_rental_app/features/home/data/model/brand_response.dart';
import 'package:car_rental_app/features/home/data/model/car_collection_response.dart';
import 'package:car_rental_app/features/home/data/model/car_details_model.dart';
import 'package:car_rental_app/features/home/domain/entity/best_car_entity.dart';
import 'package:car_rental_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_rental_app/features/home/domain/entity/car_details.dart';

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
      price: carModel.price ?? "35064",
      firstImage: carModel.firstImage ?? "defaultFirstImage",
      id: carModel.id ?? 0,
      location: carModel.location?.name ?? "defaultLocation",
      seatingCapacity: carModel.seatingCapacity ?? "defaultSeatingCapacity",
      name: carModel.name ?? "defaultName",
    );
  }

  static CarDetatilsEntity getCarDetails(CarDetails carDetails) {
    return CarDetatilsEntity(
      availableToBook: carDetails.availableToBook ?? false,
      averageRate: carDetails.averageRate ?? 3.5,
      brandName: carDetails.brand?.name ?? "BMW",
      features: (carDetails.carFeatures ?? [])
          .map(
            (feature) => CarFeatures(
              id: feature.id ?? 0,
              name: feature.name ?? '',
              image: feature.image ?? '',
              value: feature.value ?? '',
            ),
          )
          .toList(),
      carType: carDetails.carType ?? "Luxury",
      colorName: carDetails.color?.name ?? "Black",
      dailyRent: carDetails.dailyRent ?? 200.0,
      description: carDetails.description ?? "No description available.",
      firstImage:
          carDetails.firstImage ?? "https://example.com/default_car_image.jpg",
      id: carDetails.id ?? 1,
      imageUrls: (carDetails.images ?? [])
          .map((image) => image.image ?? '')
          .toList(),

      isForPay: carDetails.isForPay ?? true,
      isForRent: carDetails.isForRent ?? true,
      locationName: carDetails.location?.name ?? "Cairo, Egypt",
      monthlyRent: carDetails.monthlyRent ?? 5000.0,
      name: carDetails.name ?? "BMW i8",
      price: carDetails.price ?? 150000.0,
      reviewsAvg: carDetails.reviewsAvg ?? 4.2,
      reviewsCount: carDetails.reviewsCount ?? 12,
      seatingCapacity: carDetails.seatingCapacity ?? "4 Seats",
      weeklyRent: carDetails.weeklyRent ?? 1200.0,
      yearlyRent: carDetails.yearlyRent ?? 60000.0,
      brandId: carDetails.brand?.id ?? 1,
      colorId: carDetails.color?.id ?? 1,
      brandImage:
          carDetails.brand?.image ??
          "https://example.com/default_brand_logo.png",
      colorHexValue: carDetails.color?.hexValue ?? "#000000",
      locationId: carDetails.location?.id ?? 1,
      locationLat: carDetails.location?.lat ?? 30.0444,
      locationLng: carDetails.location?.lng ?? 31.2357,
      ownerCountryAbbreviation: carDetails.owner?.country?.abbreviation ?? "EG",
      ownerCountryId: carDetails.owner?.country?.id ?? 20,
      ownerCountryName: carDetails.owner?.country?.name ?? "Egypt",
      ownerEmail: carDetails.owner?.email ?? "owner@example.com",
      ownerFullName: carDetails.owner?.fullName ?? "Ayman Saeed",
      ownerId: carDetails.owner?.id ?? 99,
      ownerLocationId: carDetails.owner?.location?.id ?? 2,
      ownerLocationLat: carDetails.owner?.location?.lat ?? 30.0617,
      ownerLocationLng: carDetails.owner?.location?.lng ?? 31.2161,
      ownerLocationName: carDetails.owner?.location?.name ?? "Giza",
      ownerPhone: carDetails.owner?.phone ?? "+201000000000",
      ownerPhoneIsVerified: carDetails.owner?.phoneIsVerified ?? false,
      reviews: (carDetails.reviews ?? [])
          .map(
            (value) => Reviews(
              id: value.id ?? 0,
              userName: value.username ?? "0xCode",
              review: value.review ?? 'Great experience!',
              userImage: value.userImage ?? '',
              rate: value.rate ?? 5.0,
            ),
          )
          .toList(),
    );
  }
}
