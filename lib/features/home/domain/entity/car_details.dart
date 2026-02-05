import 'package:equatable/equatable.dart';

class CarDetatilsEntity extends Equatable {
  final int? id;
  final String? name;
  final String? description;

  //! Owner Info
  final int? ownerId;
  final String? ownerFullName;
  final String? ownerEmail;
  final String? ownerPhone;
  final bool? ownerPhoneIsVerified;
  final int? ownerCountryId;
  final String? ownerCountryName;
  final String? ownerCountryAbbreviation;
  final int? ownerLocationId;
  final String? ownerLocationName;
  final double? ownerLocationLat;
  final double? ownerLocationLng;

  //! Car Info
  final String? firstImage;
  final List<String>? imageUrls;
  final String? carType;
  final int? brandId;
  final String? brandName;
  final String? brandImage;
  final int? colorId;
  final String? colorName;
  final String? colorHexValue;
  final List<CarFeatures>? features;
  final String? seatingCapacity;
  final int? locationId;
  final String? locationName;
  final double? locationLat;
  final double? locationLng;

  //! Rental and Payment
  final double? averageRate;
  final bool? isForRent;
  final double? dailyRent;
  final double? weeklyRent;
  final double? monthlyRent;
  final double? yearlyRent;
  final bool? isForPay;
  final double? price;
  final bool? availableToBook;

  //! Reviews
  final int? reviewsCount;
  final double? reviewsAvg;
  final List<Reviews>? reviews;

  const CarDetatilsEntity({
    this.id,
    this.name,
    this.description,
    this.ownerId,
    this.ownerFullName,
    this.ownerEmail,
    this.ownerPhone,
    this.ownerPhoneIsVerified,
    this.ownerCountryId,
    this.ownerCountryName,
    this.ownerCountryAbbreviation,
    this.ownerLocationId,
    this.ownerLocationName,
    this.ownerLocationLat,
    this.ownerLocationLng,
    this.firstImage,
    this.imageUrls,
    this.carType,
    this.brandId,
    this.brandName,
    this.brandImage,
    this.colorId,
    this.colorName,
    this.colorHexValue,
    this.features,
    this.seatingCapacity,
    this.locationId,
    this.locationName,
    this.locationLat,
    this.locationLng,
    this.averageRate,
    this.isForRent,
    this.dailyRent,
    this.weeklyRent,
    this.monthlyRent,
    this.yearlyRent,
    this.isForPay,
    this.price,
    this.availableToBook,
    this.reviewsCount,
    this.reviewsAvg,
    this.reviews,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    ownerId,
    ownerFullName,
    ownerEmail,
    ownerPhone,
    ownerPhoneIsVerified,
    ownerCountryId,
    ownerCountryName,
    ownerCountryAbbreviation,
    ownerLocationId,
    ownerLocationName,
    ownerLocationLat,
    ownerLocationLng,
    firstImage,
    imageUrls,
    carType,
    brandId,
    brandName,
    brandImage,
    colorId,
    colorName,
    colorHexValue,
    features,
    seatingCapacity,
    locationId,
    locationName,
    locationLat,
    locationLng,
    averageRate,
    isForRent,
    dailyRent,
    weeklyRent,
    monthlyRent,
    yearlyRent,
    isForPay,
    price,
    availableToBook,
    reviewsCount,
    reviewsAvg,
    reviews,
  ];
}

class CarFeatures extends Equatable {
  final int? id;
  final String? name;
  final String? value;
  final String? image;

  const CarFeatures({
    required this.id,
    required this.image,
    required this.name,
    required this.value,
  });
  @override
  List<Object?> get props => [id, name, image, value];
}

class Reviews extends Equatable {
  final int? id;
  final String? userName;
  final String? review;
  final String? userImage;
  final num? rate;

  const Reviews({
    required this.id,
    required this.rate,
    required this.userImage,
    required this.userName,
    required this.review,
  });
  @override
  List<Object?> get props => [id, userName, userImage, review, rate];
}
