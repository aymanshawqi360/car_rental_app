import 'package:car_rental_app/core/network/dio_factory.dart';
import 'package:car_rental_app/features/auth/reset_password/data/api/reset_password_constants.dart';
import 'package:car_rental_app/features/auth/reset_password/data/model/request_password_reset_code.dart';
import 'package:dio/dio.dart';

class ResetPasswordService {
  final DioFactory dioFactory;

  ResetPasswordService({required this.dioFactory});

  Future<Response> resetPassword({
    required RequestPasswordResetCode requestPasswordResetCode,
  }) async {
    try {
      final resulte = await dioFactory.post(
        ResetPasswordConstants.forgotPassword,
        body: requestPasswordResetCode.toJson(requestPasswordResetCode),
      );

      return resulte;
    } catch (e) {
      rethrow;
    }
  }
}
