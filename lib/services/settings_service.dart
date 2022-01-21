/// Settings Data Service interface
abstract class SettingsService {
  /// Initialize async data Service
  Future<void> get initialize;

  // read Object from data Service
  // ignore: no-object-declaration
  Object? get(String key);

  // read String from data Service
  String? getString(String key);

  // read int from data Service
  int? getInt(String key);

  // read double from data Service
  double? getDouble(String key);

  // read bool from data Service
  bool? getBool(String key);

  // save String to data Service
  Future<bool> setString(String key, String value);

  // save int to data Service
  Future<bool> setInt(String key, int value);

  // save double to data Service
  Future<bool> setDouble(String key, double value);

  // save bool to data Service
  Future<bool> setBool(String key, bool value);

  // remove from data Service by key
  Future<bool> remove(String key);

  // clear data Service
  Future<bool> clear();
}
