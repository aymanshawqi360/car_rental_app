class SignUpResponse {
  final User? user;
  final String? message;
  final Tokens? tokens;

  SignUpResponse({
    required this.user,
    required this.message,
    required this.tokens,
  });
  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      user: json["user"] != null ? User.fromJson(json["user"]) : null,
      message: json["message"] as String,
      tokens: json["tokens"] != null ? Tokens.fromJson(json["tokens"]) : null,
    );
  }

  Map<String, dynamic> toJson(User user) => {
    "id": user.id,
    "full_name": user.fullName,
    "email": user.email,
  };
}

class User {
  final int? id;
  final String? fullName;
  final String? email;

  User({required this.id, required this.fullName, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      fullName: json["full_name"] as String,
      email: json["email"] as String,
    );
  }

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
