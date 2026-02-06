import 'package:car_rental_app/core/Shared/api_response.dart';

class CarsResponse {
  List<CarModel>? data;
  Links? links;
  Meta? meta;

  CarsResponse({required this.data, required this.links, required this.meta});

  factory CarsResponse.fromJson(Map<String, dynamic> json) {
    return CarsResponse(
      data: List<CarModel>.from(json['data'].map((x) => CarModel.fromJson(x))),
      links: Links.fromJson(json['links']),
      meta: Meta.fromJson(json['meta']),
    );
  }
  Map<String, dynamic> toJson(CarsResponse result) => {
    'data': result.data,
    'links': result.links,
    'meta': result.meta,
  };
}

class CarModel {
  int? id;
  String? name;
  String? description;
  String? firstImage;
  List<ImageModel>? images;
  String? carType;
  BrandModel? brand;
  ColorModel? color;
  List<FeatureModel>? carFeatures;
  String? seatingCapacity;
  LocationModel? location;
  int? averageRate;
  bool? isForRent;
  String? dailyRent;
  String? weeklyRent;
  String? monthlyRent;
  String? yearlyRent;
  bool? isForPay;
  String? price;
  bool? availableToBook;
  List<ReviewModel>? reviews;
  int? reviewsCount;
  double? reviewsAvg;

  CarModel({
    required this.id,
    required this.name,
    required this.description,
    required this.firstImage,
    required this.images,
    required this.carType,
    required this.brand,
    required this.color,
    required this.carFeatures,
    required this.seatingCapacity,
    required this.location,
    required this.averageRate,
    required this.isForRent,
    required this.dailyRent,
    required this.weeklyRent,
    required this.monthlyRent,
    required this.yearlyRent,
    required this.isForPay,
    required this.price,
    required this.availableToBook,
    required this.reviews,
    required this.reviewsCount,
    required this.reviewsAvg,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      firstImage: json['first_image'],
      images: List<ImageModel>.from(
        json['images'].map((x) => ImageModel.fromJson(x)),
      ),
      carType: json['car_type'],
      brand: BrandModel.fromJson(json['brand']),
      color: ColorModel.fromJson(json['color']),
      carFeatures: List<FeatureModel>.from(
        json['car_features'].map((x) => FeatureModel.fromJson(x)),
      ),
      seatingCapacity: json['seating_capacity'],
      location: LocationModel.fromJson(json['location']),
      averageRate: json['average_rate'],
      isForRent: json['is_for_rent'],
      dailyRent: json['daily_rent'],
      weeklyRent: json['weekly_rent'],
      monthlyRent: json['monthly_rent'],
      yearlyRent: json['yearly_rent'],
      isForPay: json['is_for_pay'],
      price: json['price'],
      availableToBook: json['available_to_book'],
      reviews: List<ReviewModel>.from(
        json['reviews'].map((x) => ReviewModel.fromJson(x)),
      ),
      reviewsCount: json['reviews_count'],
      reviewsAvg: json['reviews_avg'].toDouble(),
    );
  }
  Map<String, dynamic> toJson(CarModel result) => {
    'id': result.id,
    'name': result.name,
    'description': result.description,
    'first_image': result.firstImage,
    'images': result.images,
    'car_type': result.carType,
    'brand': result.brand,
    'color': result.color,
    'car_features': result.carFeatures,
    'seating_capacity': result.seatingCapacity,
    'location': result.location,
    'average_rate': result.averageRate,
    'is_for_rent': result.isForRent,
    'is_for_pay': result.isForPay,
    'available_to_book': result.availableToBook,
    'reviews': result.reviews,
    'reviews_count': result.reviewsCount,
    'reviews_avg': result.reviewsAvg,
  };
}

class ImageModel {
  final int id;
  final String image;

  ImageModel({required this.id, required this.image});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(id: json['id'], image: json['image']);
  }
  Map<String, dynamic> toJson(ImageModel result) => {
    'id': result.id,
    'image': result.image,
  };
}

class BrandModel {
  final int id;
  final String name;
  final String image;

  BrandModel({required this.id, required this.name, required this.image});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(id: json['id'], name: json['name'], image: json['image']);
  }
  Map<String, dynamic> toJson(BrandModel result) => {
    'id': result.id,
    'name': result.name,
    'image': result.image,
  };
}

class ColorModel {
  final int id;
  final String name;
  final String hexValue;

  ColorModel({required this.id, required this.name, required this.hexValue});

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      id: json['id'],
      name: json['name'],
      hexValue: json['hex_value'],
    );
  }
  Map<String, dynamic> toJson(ColorModel result) => {
    'id': result.id,
    'name': result.name,
    'hex_value': result.hexValue,
  };
}

class FeatureModel {
  final int id;
  final String name;
  final String value;
  final String image;

  FeatureModel({
    required this.id,
    required this.name,
    required this.value,
    required this.image,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      id: json['id'],
      name: json['name'],
      value: json['value'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson(FeatureModel result) => {
    'id': result.id,
    'name': result.name,
    'value': result.value,
    'image': result.image,
  };
}

class LocationModel {
  final int id;
  final String name;
  final double lat;
  final double lng;

  LocationModel({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      name: json['name'],
      lat: json['lat'].toDouble(),
      lng: json['lng'].toDouble(),
    );
  }
  Map<String, dynamic> toJson(LocationModel result) => {
    'id': result.id,
    'name': result.name,
    'lat': result.lat,
    'lng': result.lng,
  };
}

class ReviewModel {
  final int id;
  final String username;
  final String review;
  final String userImage;
  final int rate;

  ReviewModel({
    required this.id,
    required this.username,
    required this.review,
    required this.userImage,
    required this.rate,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      username: json['username'],
      review: json['review'],
      userImage: json['user_image'],
      rate: json['rate'],
    );
  }
  Map<String, dynamic> toJson(ReviewModel result) => {
    'id': result.id,
    'username': result.username,
    'review': result.review,
    'user_image': result.userImage,
    'rate': result.rate,
  };
}

class LinkItem {
  final String? url;
  final String label;
  final bool active;

  LinkItem({required this.url, required this.label, required this.active});

  factory LinkItem.fromJson(Map<String, dynamic> json) {
    return LinkItem(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
  Map<String, dynamic> toJson(LinkItem result) => {
    'url': result.url,
    'label': result.label,
    'active': result.active,
  };
}
