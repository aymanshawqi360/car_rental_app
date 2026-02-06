class RequestPasswordResetCode {
  final String? email;

  RequestPasswordResetCode({required this.email});

  factory RequestPasswordResetCode.fromJson(Map<String, dynamic> json) =>
      RequestPasswordResetCode(email: json['email'] as String);

  Map<String, dynamic> toJson(
    RequestPasswordResetCode requestPasswordResetCode,
  ) => {"email": requestPasswordResetCode.email};
}
