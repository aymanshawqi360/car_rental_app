import 'package:car_rental_app/core/network/dio_factory.dart';
import 'package:car_rental_app/features/auth/new_password/data/api/new_password_constants.dart';
import 'package:car_rental_app/features/auth/new_password/data/model/new_password_request.dart';
import 'package:dio/dio.dart';

class NewPasswordService {
  final DioFactory dioFactory;
  NewPasswordService({required this.dioFactory});

  Future<Response> getNewPassword({
    required NewPasswordRequest newPasswordRequest,
  }) async {
    try {
      final resulte = await dioFactory.post(
        NewPasswordConstants.resetPassword,
        body: newPasswordRequest.toJson(newPasswordRequest),
      );
      return resulte;
    } catch (e) {
      rethrow;
    }
  }
}
