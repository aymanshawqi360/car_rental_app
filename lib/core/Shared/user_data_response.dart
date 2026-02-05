class UserDataResponse {
  String? message;
  User? user;
  UserDataResponse({required this.message, required this.user});

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      UserDataResponse(
        message: json['message'],
        user: (json['user'] != null ? User.fromJson(json['user']) : null),
      );
}

class User {
  final int? id;
  final String? fullName;
  final String? email;
  final String? phone;
  Location? location;
  Country? country;

  final bool? phoneIsVerified;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.phoneIsVerified,
    required this.location,
    required this.country,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      phoneIsVerified: json['phone_is_verified'] as bool,
      country: json['country'] != null
          ? Country.fromJson(json['country'])
          : null,
      location: json['location'] != null
          ? Location.fromJson(json['location'])
          : null,
    );
  }

  Map<String, dynamic> toJson(User user) => {
    'id': user.id,
    'full_name': user.fullName,
    'email': user.email,
    'phone': user.phone,
    'phone_is_verified': user.phoneIsVerified,
  };
}

class Country {
  int? id;
  String? country;
  String? abbreviation;
  Country({
    required this.id,
    required this.country,
    required this.abbreviation,
  });
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      abbreviation: json['abbreviation'] as String,
      country: json['country'] as String,
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson(Country country) => {
    'abbreviation': country.abbreviation,
    'country': country.country,
    'id': country.id,
  };
}

class Location {
  int? id;
  String? name;
  double? lat;
  double? lng;
  Location({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
  });

  Map<String, dynamic> toJson(Location data) {
    return <String, dynamic>{'id': data.id, 'lat': data.lat, 'lng': data.lng};
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] as String,
      id: json['id'] as int,
      lat: json['lat'] as double,
      lng: json['lng'] as double,
    );
  }
}
