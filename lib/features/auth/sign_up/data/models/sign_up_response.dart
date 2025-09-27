import 'package:car_rental_app/config/Shared/user_data_response.dart';

class SignUpResponse extends User {
  User? user;
  String? message;
  Tokens? tokens;

  SignUpResponse({
    required this.user,
    required this.message,
    required this.tokens,
    super.country,
    super.email,
    super.fullName,
    super.id,
    super.location,
    super.phone,
    super.phoneIsVerified,
  });
  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      message: json["message"] as String,
      tokens: json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null,
    );
  }

  @override
  Map<String, dynamic> toJson(User user) => {
    "id": user.id,
    "full_name": user.fullName,
    "email": user.email,
  };
}

class Tokens {
  final String? access;
  final String? refresh;

  Tokens({required this.access, required this.refresh});
  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      access: json["access"] as String,
      refresh: json["refresh"] as String,
    );
  }

  Map<String, dynamic> toJson(Tokens tokens) => {
    "access": tokens.access,
    "refresh": tokens.refresh,
  };
}
