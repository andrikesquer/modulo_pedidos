import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterSecureStorage _storage = FlutterSecureStorage();

class Configuration {
  static saveAppTheme(bool isDarkMode) async {
    await _storage.write(key: 'isDarkMode', value: '$isDarkMode');
  }

  static Future<String?> getData() async {
    return Future.value(_storage.read(key: 'isDarkMode'));
  }

  static Future<bool> getAppTheme() async {
    Future<String?> stringFuture = getData();
    String? message = await stringFuture;
    bool isDarkMode = await message?.toLowerCase() == 'true';
    return isDarkMode;
  }
}
