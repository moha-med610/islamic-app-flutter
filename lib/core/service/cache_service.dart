import 'package:shared_preferences/shared_preferences.dart';

class LocalDataService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(String key, dynamic value) async {
    if (value is String) {
      return await _prefs!.setString(key, value);
    } else if (value is int) {
      return await _prefs!.setInt(key, value);
    } else if (value is bool) {
      return await _prefs!.setBool(key, value);
    } else if (value is double) {
      return await _prefs!.setDouble(key, value);
    } else if (value is List<String>) {
      return await _prefs!.setStringList(key, value);
    } else {
      throw Exception("Invalid Data");
    }
  }

  // Strings
  static String? getString(String key) {
    return _prefs!.getString(key);
  }

  // Booleans
  static bool? getBool(String key) {
    return _prefs!.getBool(key);
  }

  // Integers
  static int? getInt(String key) {
    return _prefs!.getInt(key);
  }

  // Doubles
  static double? getDouble(String key) {
    return _prefs!.getDouble(key);
  }

  // REMOVE
  static Future<bool> remove(String key) async {
    return await _prefs!.remove(key);
  }

  // CLEAR
  static Future<bool> clear() async {
    return await _prefs!.clear();
  }
}
