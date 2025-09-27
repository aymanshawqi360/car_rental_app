class SignUpRequestBody {
  final String? fullName;
  final String? email;
  final String? password;
  final String? country;
  final String? phone;
  final String? location;
  final String? availableToCreateCar;

  SignUpRequestBody({
    required this.fullName,
    required this.email,
    required this.password,
    required this.country,
    required this.phone,
    required this.location,
    required this.availableToCreateCar,
  });

  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) {
    return SignUpRequestBody(
      fullName: json["full_name"] as String,
      email: json["email"] as String,
      password: json["password"] as String,
      country: json["country_id"] as String,
      phone: json["phone"] as String,
      location: json["location_id"] as String,
      availableToCreateCar: json["available_to_create_car"] as String,
    );
  }

  Map<String, dynamic> toJson(SignUpRequestBody requestApiModel) => {
    "full_name": requestApiModel.fullName,
    "email": requestApiModel.email,
    "password": requestApiModel.password,
    "country_id": requestApiModel.country,
    "phone": requestApiModel.phone,
    "location_id": requestApiModel.location,
    "available_to_create_car": requestApiModel.availableToCreateCar,
  };
}
