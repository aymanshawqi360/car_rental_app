import 'package:car_rental_app/core/constants/secure_storage.dart';
import 'package:car_rental_app/core/functions/user_check.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';

class UserService implements UserCheck {
  @override
  void checkIfUserExists() async {
    String? token = await SecureStorage.getData(token: Token.accessToken);
    if (token.isNullOrEmp()) {
      AppStrings.isLoggedInUser = true;
    } else {
      AppStrings.isLoggedInUser = false;
    }
  }
}
