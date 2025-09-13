class ResetPasswordResponse {
  final String? message;
  final String? code;
  final String? resetToken;

  ResetPasswordResponse({
    required this.message,
    required this.code,
    required this.resetToken,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponse(
        message: json['message'] as String,
        code: json['code'] as String,
        resetToken: json['reset_token'] as String,
      );

  Map<String, dynamic> toJson(ResetPasswordResponse resetPasswordResponse) => {
    "message": resetPasswordResponse.message,
    "code": resetPasswordResponse.code,
    "reset_token": resetPasswordResponse.resetToken,
  };
}
