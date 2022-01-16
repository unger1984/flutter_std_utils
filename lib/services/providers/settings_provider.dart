/// Settings Data Provider interface
abstract class SettingsProvider {
  /// Initialize async data provider
  Future<void> initialize();

  // read Object from data provider
  // ignore: no-object-declaration
  Future<Object?> get(String key);

  // read String from data provider
  Future<String?> getString(String key);

  // read int from data provider
  Future<int?> getInt(String key);

  // read double from data provider
  Future<double?> getDouble(String key);

  // read bool from data provider
  Future<bool?> getBool(String key);

  // save String to data provider
  Future<bool> setString(String key, String value);

  // save int to data provider
  Future<bool> setInt(String key, int value);

  // save double to data provider
  Future<bool> setDouble(String key, double value);

  // save bool to data provider
  Future<bool> setBool(String key, bool value);

  // remove from data provider by key
  Future<bool> remove(String key);

  // clear data provider
  Future<bool> clear();
}
