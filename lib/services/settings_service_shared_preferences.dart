import 'package:flutter_std_utils/services/settings_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Implements Settings Data Service with SharedPreferences
class SettingsServiceSharedPreferences implements SettingsService {
  SharedPreferences? _prefs;
  late Future<void> _initialize;

  SettingsServiceSharedPreferences() {
    _initialize = init();
  }
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> get initialize => _initialize;

  // ignore: no-object-declaration
  @override
  Object? get(String key) {
    return _prefs?.get(key);
  }

  @override
  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  @override
  double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  @override
  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  @override
  String? getString(String key) {
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
