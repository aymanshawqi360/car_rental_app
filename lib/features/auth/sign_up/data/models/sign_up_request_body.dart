class SignUpRequestBody {
  final String? fullName;
  final String? email;
  final String? password;
  final String? country;
  // final String? phoneNumber;

  SignUpRequestBody({
    required this.fullName,
    required this.email,
    required this.password,
    required this.country,
    // required this.phoneNumber,
  });

  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) {
    return SignUpRequestBody(
      fullName: json["full_name"] as String,
      email: json["email"] as String,
      password: json["password"] as String,
      country: json["country"] as String,
      // phoneNumber: json["phone_number"] as String,
    );
  }

  Map<String, dynamic> toJson(SignUpRequestBody requestApiModel) => {
    "full_name": requestApiModel.fullName,
    "email": requestApiModel.email,
    "password": requestApiModel.password,
    "country": requestApiModel.country,
    // "phone_number": requestApiModel.phoneNumber,
  };
}
