import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum Token { accessToken, refreshToken, code, resetToken }

class SecureStorage {
  static final storage = FlutterSecureStorage();

  static Future<String?> getData({required Token token}) async {
    return await storage.read(key: token.name) ?? "";
  }

  static Future<void> setData({
    required Token token,
    required String value,
  }) async {
    await storage.write(key: token.name, value: value);
  }

  static Future<void> delete({required Token token}) async {
    await storage.delete(key: token.name);
  }

  static Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}
