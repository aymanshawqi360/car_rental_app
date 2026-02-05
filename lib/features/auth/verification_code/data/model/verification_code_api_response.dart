class VerificationCodeApiResponse {
  String? message;
  String? code;
  String? verifyToken;
  VerificationCodeApiResponse({
    required this.message,
    required this.code,
    required this.verifyToken,
  });
  factory VerificationCodeApiResponse.fromJson(Map<String, dynamic> json) =>
      VerificationCodeApiResponse(
        message: json['message'],
        code: json['code'],
        verifyToken: json['verify_token'],
      );

  Map<String, dynamic> toJson(VerificationCodeApiResponse request) => {
    "message": request.message,
    "code": request.code,
    "verify_token": request.verifyToken,
  };
}
