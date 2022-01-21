abstract class DatabaseService {
  Future<void> get initialize;
  Future<void> execute(String sql, [List<Object?>? arguments]);
  Future<List<Map<String, Object?>>> rawQuery(
    String sql, [
    List<Object?>? arguments,
  ]);
  Future<int> insert(String table, Map<String, Object?> values);
  Future<List<Map<String, Object?>>> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  });
  Future<int> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
  });
  Future<int> delete(String table, {String? where, List<Object?>? whereArgs});
}
