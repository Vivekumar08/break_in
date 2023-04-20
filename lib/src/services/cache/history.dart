import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:shared_preferences/shared_preferences.dart';

class History {
  static late SharedPreferences prefs;
  String key = 'history';

  static Future<History> init() async {
    prefs = await SharedPreferences.getInstance();
    return History();
  }

  Future<void> set(Map<String, String> map) async =>
      await prefs.setString(key, jsonEncode(map));

  Map<String, String>? get() {
    String? data = prefs.getString(key);
    if (data == null) return null;
    try {
      return (jsonDecode(data) as Map)
          .map((key, value) => MapEntry(key, value?.toString() ?? ''));
    } catch (_) {
      return null;
    }
  }

  Future<void> clear() async => await prefs.remove(key);
}
