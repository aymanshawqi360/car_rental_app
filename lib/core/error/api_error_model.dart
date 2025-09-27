class ApiErrorModel {
  final Map<String, dynamic>? errors;
  final String? errorMessage;
  ApiErrorModel({this.errorMessage, this.errors});
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      errorMessage: json["message"] as String,
      errors: json["errors"] as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson(ApiErrorModel apiErrorModel) => {
    "error": apiErrorModel.errorMessage,
    "errorMessage": apiErrorModel.errors,
  };

  String allSignUpError() {
    if (errors == null || errors!.isEmpty)
      return errorMessage ?? "Unknown error occurred";
    final message = StringBuffer();
    for (var data in errors!.entries) {
      if (data.value is List) {
        for (var data in data.value) {
          message.writeln("— ${data}");
        }
      } else {
        message.writeln("— ${data.value}");
      }
    }
    return message.toString();
  }
}



//  final String fullName;
//   final String email;
//   final String password;
//   final String country;

//   ApiErrorModel({
//     required this.fullName,
//     required this.email,
//     required this.password,
//     required this.country,
//   });

//   factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
//     return ApiErrorModel(
//       fullName: json[],
//       email: email,
//       password: password,
//       country: country,
//     );
//   }