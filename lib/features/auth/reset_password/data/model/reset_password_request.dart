class ResetPasswordRequest {
  final String? resetToken;
  final String? code;
  final String? password;
  final String? confirmPassword;

  ResetPasswordRequest({
    required this.resetToken,
    required this.code,
    required this.password,
    required this.confirmPassword,
  });
  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ResetPasswordRequest(
        resetToken: json['reset_token'] as String,
        code: json['code'] as String,
        password: json['password'] as String,
        confirmPassword: json['confirm_password'] as String,
      );

  Map<String, dynamic> toJson(ResetPasswordRequest resetPasswordRequest) => {
    "reset_token": resetPasswordRequest.resetToken,
    "code": resetPasswordRequest.code,
    "password": resetPasswordRequest.password,
    "confirm_password": resetPasswordRequest.confirmPassword,
  };
}
