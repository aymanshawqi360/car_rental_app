class ConfirmVerifyCodeRequest {
  String? code;
  String? verifyToken;

  ConfirmVerifyCodeRequest({required this.code, required this.verifyToken});
  factory ConfirmVerifyCodeRequest.fromJson(Map<String, dynamic> json) =>
      ConfirmVerifyCodeRequest(
        code: json['code'] as String,
        verifyToken: json['verify_token'] as String,
      );
  Map<String, dynamic> toJson(ConfirmVerifyCodeRequest request) => {
    'code': request.code,
    'verify_token': request.verifyToken,
  };
}
