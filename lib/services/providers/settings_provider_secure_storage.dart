import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_std_utils/flutter_std_utils.dart';

class SettingsProviderSecureStorage extends SettingsProvider {
  final Map<String, String> _prefs = {};
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> initialize() async {
    _prefs.clear();
    _prefs.addAll(await _storage.readAll());
  }

  @override
  Future<Object?> get(String key) async {
    return _prefs.containsKey(key) ? _prefs[key] : null;
  }

  @override
  Future<String?> getString(String key) async {
    return _prefs.containsKey(key) ? _prefs[key] : null;
  }

  @override
  Future<bool?> getBool(String key) async {
    return _prefs.containsKey(key) ? _prefs[key] == 'true' : null;
  }

  @override
  Future<double?> getDouble(String key) async {
    return _prefs.containsKey(key) ? double.tryParse(_prefs[key] ?? 'null') : null;
  }

  @override
  Future<int?> getInt(String key) async {
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
