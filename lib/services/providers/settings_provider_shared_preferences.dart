import 'package:flutter_std_utils/services/providers/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Implements Settings Data Provider with SharedPreferences
class SettingsProviderSharedPreferences implements SettingsProvider {
  SharedPreferences? _prefs;

  @override
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ignore: no-object-declaration
  @override
  Future<Object?> get(String key) async {
    return _prefs?.get(key);
  }

  @override
  Future<bool?> getBool(String key) async {
    return _prefs?.getBool(key);
  }

  @override
  Future<double?> getDouble(String key) async {
    return _prefs?.getDouble(key);
  }

  @override
  Future<int?> getInt(String key) async {
    return _prefs?.getInt(key);
  }

  @override
  Future<String?> getString(String key) async {
    return _prefs?.getString(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return (await _prefs?.setBool(key, value)) ?? false;
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    return (await _prefs?.setDouble(key, value)) ?? false;
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return (await _prefs?.setInt(key, value)) ?? false;
  }

  @override
  Future<bool> setString(String key, String value) async {
    return (await _prefs?.setString(key, value)) ?? false;
  }

  @override
  Future<bool> clear() async {
    return await _prefs?.clear() ?? false;
  }

  @override
  Future<bool> remove(String key) async {
    return await _prefs?.remove(key) ?? false;
  }
}
