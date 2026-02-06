class RequestVerifyCode {
  String? phone;
  RequestVerifyCode({required this.phone});

  factory RequestVerifyCode.fromJson(Map<String, dynamic> json) =>
      RequestVerifyCode(phone: json['phone'] as String);

  Map<String, dynamic> toJson(RequestVerifyCode request) => {
    'phone': request.phone,
  };
}
