class LoginResponse {
  String? message;
  User? user;
  Tokens? tokens;

  LoginResponse({
    required this.message,
    required this.user,
    required this.tokens,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: User.fromJson(json["user"] as Map<String, dynamic>),
      message: json["message"] as String,
      tokens: Tokens.fromJson(json["tokens"] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson(LoginResponse loginResponse) => <String, dynamic>{
    "message": loginResponse.message,
    "user": loginResponse.user,
    "tokens": loginResponse.tokens,
  };
}

class User {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  bool? phoneIsVerified;
  Country? country;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      fullName: json["full_name"] as String,
      email: json["email"] as String,
      phone: json["phone"] as String,
      phoneIsVerified: json["phone_is_verified"] as bool,
      country: Country.fromJson(json["country"] as Map<String, dynamic>),
    );
  }

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.phoneIsVerified,
    required this.country,
  });

  Map<String, dynamic> toJson(User user) => <String, dynamic>{
    "id": user.id,
    "full_name": user.fullName,
    "email": user.email,
    "phone": user.phone,
    "phone_is_verified": user.phoneIsVerified,
    "country": user.country,
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
      id: json["id"] as int,
      country: json["country"] as String,
      abbreviation: json["abbreviation"] as String,
    );
  }

  Map<String, dynamic> toJson(Country country) => <String, dynamic>{
    "id": country.id,
    "country": country.country,
    "abbreviation": country.abbreviation,
  };
}

class Tokens {
  String? access;
  String? refresh;

  Tokens({required this.access, required this.refresh});
  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      access: json["access"] as String,
      refresh: json["refresh"] as String,
    );
  }

  Map<String, dynamic> toJson(Tokens tokens) => <String, dynamic>{
    "access": tokens.access,
    "refresh": tokens.refresh,
  };
}
