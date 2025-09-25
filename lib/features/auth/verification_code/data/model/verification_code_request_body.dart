class VerificationCodeRequestBody {
  String? phone;
  VerificationCodeRequestBody({required this.phone});

  factory VerificationCodeRequestBody.fromJson(Map<String, dynamic> json) =>
      VerificationCodeRequestBody(phone: json['phone'] as String);

  Map<String, dynamic> toJson(VerificationCodeRequestBody request) => {
    'phone': request.phone,
  };
}
