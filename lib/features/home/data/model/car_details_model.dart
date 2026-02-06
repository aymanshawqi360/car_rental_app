class CarDetails {
  final int? id;
  final String? name;
  final String? description;
  final Owner? owner;
  final String? firstImage;
  final List<CarImage>? images;
  final String? carType;
  final Brand? brand;
  final CarColor? color;
  final List<CarFeature>? carFeatures;
  final String? seatingCapacity;
  final Location? location;
  final double? averageRate;
  final bool? isForRent;
  final double? dailyRent;
  final double? weeklyRent;
  final double? monthlyRent;
  final double? yearlyRent;
  final bool? isForPay;
  final double? price;
  final bool? availableToBook;
  final List<Review>? reviews;
  final int? reviewsCount;
  final double? reviewsAvg;

  CarDetails({
    this.id,
    this.name,
    this.description,
    this.owner,
    this.firstImage,
    this.images,
    this.carType,
    this.brand,
    this.color,
    this.carFeatures,
    this.seatingCapacity,
    this.location,
    this.averageRate,
    this.isForRent,
    this.dailyRent,
    this.weeklyRent,
    this.monthlyRent,
    this.yearlyRent,
    this.isForPay,
    this.price,
    this.availableToBook,
    this.reviews,
    this.reviewsCount,
    this.reviewsAvg,
  });

  factory CarDetails.fromJson(Map<String, dynamic> json) {
    return CarDetails(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
      firstImage: json['first_image'] as String?,
      images: json['images'] != null
          ? (json['images'] as List).map((e) => CarImage.fromJson(e)).toList()
          : null,
      carType: json['car_type'] as String?,
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      color: json['color'] != null ? CarColor.fromJson(json['color']) : null,
      carFeatures: json['car_features'] != null
          ? (json['car_features'] as List)
                .map((e) => CarFeature.fromJson(e))
                .toList()
          : null,
      seatingCapacity: json['seating_capacity'] as String?,
      location: json['location'] != null
          ? Location.fromJson(json['location'])
          : null,
      averageRate: json['average_rate'] != null
          ? (json['average_rate'] as num).toDouble()
          : null,
      isForRent: json['is_for_rent'] as bool?,
      dailyRent: json['daily_rent'] != null
          ? double.tryParse(json['daily_rent'].toString())
          : null,
      weeklyRent: json['weekly_rent'] != null
          ? double.tryParse(json['weekly_rent'].toString())
          : null,
      monthlyRent: json['monthly_rent'] != null
          ? double.tryParse(json['monthly_rent'].toString())
          : null,
      yearlyRent: json['yearly_rent'] != null
          ? double.tryParse(json['yearly_rent'].toString())
          : null,
      isForPay: json['is_for_pay'] as bool?,
      price: json['price'] != null
          ? double.tryParse(json['price'].toString())
          : null,
      availableToBook: json['available_to_book'] as bool?,
      reviews: json['reviews'] != null
          ? (json['reviews'] as List).map((e) => Review.fromJson(e)).toList()
          : null,
      reviewsCount: json['reviews_count'] as int?,
      reviewsAvg: json['reviews_avg'] != null
          ? (json['reviews_avg'] as num).toDouble()
          : null,
    );
  }
}

class Owner {
  final int? id;
  final String? fullName;
  final String? email;
  final String? phone;
  final bool? phoneIsVerified;
  final Country? country;
  final Location? location;

  Owner({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.phoneIsVerified,
    this.country,
    this.location,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['id'] as int?,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      phoneIsVerified: json['phone_is_verified'] as bool?,
      country: json['country'] != null
          ? Country.fromJson(json['country'])
          : null,
      location: json['location'] != null
          ? Location.fromJson(json['location'])
          : null,
    );
  }
}

class Country {
  final int? id;
  final String? name;
  final String? abbreviation;

  Country({this.id, this.name, this.abbreviation});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'] as int?,
      name: json['country'] as String?,
      abbreviation: json['abbreviation'] as String?,
    );
  }
}

class Location {
  final int? id;
  final String? name;
  final double? lat;
  final double? lng;

  Location({this.id, this.name, this.lat, this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] as int?,
      name: json['name'] as String?,
      lat: json['lat'] != null ? (json['lat'] as num).toDouble() : null,
      lng: json['lng'] != null ? (json['lng'] as num).toDouble() : null,
    );
  }
}

class CarImage {
  final int? id;
  final String? image;

  CarImage({this.id, this.image});

  factory CarImage.fromJson(Map<String, dynamic> json) {
    return CarImage(id: json['id'] as int?, image: json['image'] as String?);
  }
}

class CarFeature {
  final int? id;
  final String? name;
  final String? value;
  final String? image;

  CarFeature({this.id, this.name, this.value, this.image});

  factory CarFeature.fromJson(Map<String, dynamic> json) {
    return CarFeature(
      id: json['id'] as int?,
      name: json['name'] as String?,
      value: json['value'] as String?,
      image: json['image'] as String?,
    );
  }
}

class Brand {
  final int? id;
  final String? name;
  final String? image;

  Brand({this.id, this.name, this.image});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }
}

class CarColor {
  final int? id;
  final String? name;
  final String? hexValue;

  CarColor({this.id, this.name, this.hexValue});

  factory CarColor.fromJson(Map<String, dynamic> json) {
    return CarColor(
      id: json['id'] as int?,
      name: json['name'] as String?,
      hexValue: json['hex_value'] as String?,
    );
  }
}

class Review {
  final int? id;
  final String? username;
  final String? review;
  final String? userImage;
  final int? rate;

  Review({this.id, this.username, this.review, this.userImage, this.rate});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as int?,
      username: json['username'] as String?,
      review: json['review'] as String?,
      userImage: json['user_image'] as String?,
      rate: json['rate'] as int?,
    );
  }
}
