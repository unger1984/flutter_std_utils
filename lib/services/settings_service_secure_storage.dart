import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_std_utils/services/settings_service.dart';

class SettingsServiceSecureStorage extends SettingsService {
  final Map<String, String> _prefs = {};
  final _storage = const FlutterSecureStorage();
  late Future<void> _initialize;

  SettingsServiceSecureStorage() {
    _initialize = _init();
  }

  @override
  Future<void> get initialize => _initialize;

  Future<void> _init() async {
    _prefs.clear();
    _prefs.addAll(await _storage.readAll());
  }

  // ignore: no-object-declaration
  @override
  Object? get(String key) {
    return _prefs.containsKey(key) ? _prefs[key] : null;
  }

  @override
  String? getString(String key) {
    return _prefs.containsKey(key) ? _prefs[key] : null;
  }

  @override
  bool? getBool(String key) {
    return _prefs.containsKey(key) ? _prefs[key] == 'true' : null;
  }

  @override
  double? getDouble(String key) {
    return _prefs.containsKey(key)
        ? double.tryParse(_prefs[key] ?? 'null')
        : null;
  }

  @override
  int? getInt(String key) {
    return _prefs.containsKey(key) ? int.tryParse(_prefs[key] ?? 'null') : null;
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    _prefs[key] = value ? 'true' : 'false';
    await _storage.write(key: key, value: _prefs[key]);

    return true;
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    _prefs[key] = value.toString();
    await _storage.write(key: key, value: _prefs[key]);

    return true;
  }

  @override
  Future<bool> setInt(String key, int value) async {
    _prefs[key] = value.toString();
    await _storage.write(key: key, value: _prefs[key]);

    return true;
  }

  @override
  Future<bool> setString(String key, String value) async {
    _prefs[key] = value;
    await _storage.write(key: key, value: _prefs[key]);

    return true;
  }

  @override
  Future<bool> remove(String key) async {
    await _storage.delete(key: key);
    final res = _prefs.remove(key);

    return res != null;
  }

  @override
  Future<bool> clear() async {
    await _storage.deleteAll();
    _prefs.clear();

    return true;
  }
}
