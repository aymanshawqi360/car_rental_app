import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum Token { accessToken, refreshToken, code, resetToken, phone, verifyToken }

class SecureStorage {
  static final _storage = FlutterSecureStorage();

  static Future<String?> getData({required Token token}) async {
    return await _storage.read(key: token.name) ?? "";
  }

  static Future<void> setData({
    required Token token,
    required String value,
  }) async {
    await _storage.write(key: token.name, value: value);
  }

  static Future<void> delete({required Token token}) async {
    await _storage.delete(key: token.name);
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
