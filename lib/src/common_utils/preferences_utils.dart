import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtils {
  PreferencesUtils._();
  static SharedPreferences? _instance;

  static Future<SharedPreferences> _getInstance() async {
    _instance ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  static Future<int?> getInt(String key) async {
    return (await _getInstance()).getInt(key);
  }

  static Future<bool> saveInt(String key, int value) async {
    return (await _getInstance()).setInt(key, value);
  }

  static Future<bool> saveBool(String key, bool value) async {
    return (await _getInstance()).setBool(key, value);
  }

  static Future<bool> getBool(String key, {bool defaultValue = false}) async {
    return (await _getInstance()).getBool(key) ?? defaultValue;
  }

  static Future<String?> getString(String key, {String? defaultValue}) async {
    try {
      return (await SharedPreferences.getInstance()).getString(key) ?? defaultValue;
    } catch (err) {
      return defaultValue;
    }
  }

  static Future<bool> saveString(String key, String value) async {
    return (await _getInstance()).setString(key, value);
  }

  static Future<List<String>?> getStringList(String key) async {
    try {
      return (await SharedPreferences.getInstance()).getStringList(key);
    } catch (err) {
      return null;
    }
  }

  static Future<bool> saveStringList(String key, List<String> value) async {
    return (await _getInstance()).setStringList(key, value);
  }

  static Future<bool> addToStringList(String key, String value) async {
    List<String> list = (await SharedPreferences.getInstance()).getStringList(key) ?? [];
    if (!list.contains(value)) {
      list.add(value);
    }
    return (await _getInstance()).setStringList(key, list);
  }
}
