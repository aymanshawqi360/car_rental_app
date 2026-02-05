class NewPasswordRequest {
  final String? resetToken;
  final String? code;
  final String? password;
  final String? confirmPassword;

  NewPasswordRequest({
    required this.resetToken,
    required this.code,
    required this.password,
    required this.confirmPassword,
  });
  factory NewPasswordRequest.fromJson(Map<String, dynamic> json) =>
      NewPasswordRequest(
        resetToken: json['reset_token'] as String,
        code: json['code'] as String,
        password: json['password'] as String,
        confirmPassword: json['confirm_password'] as String,
      );

  Map<String, dynamic> toJson(NewPasswordRequest newPasswordRequest) => {
    "reset_token": newPasswordRequest.resetToken,
    "code": newPasswordRequest.code,
    "password": newPasswordRequest.password,
    "confirm_password": newPasswordRequest.confirmPassword,
  };
}
