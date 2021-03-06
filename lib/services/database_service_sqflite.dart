import 'dart:async';

import 'package:flutter_std_utils/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServiceSqflite extends DatabaseService {
  Database? _db;
  final String _dbFile;
  late Future<void> _initialize;

  final FutureOr<void> Function({
    required Database db,
    int oldVersion,
    int newVersion,
  })? onUpgrade;

  final FutureOr<void> Function({
    required Database db,
    int version,
  })? onCreate;

  DatabaseServiceSqflite({
    required String dbFile,
    this.onCreate,
    this.onUpgrade,
  }) : _dbFile = dbFile {
    _initialize = _init();
  }

  Future<void> _init() async {
    _db = await _createDatabase();
  }

  @override
  Future<void> get initialize => _initialize;

  Future<Database> _createDatabase() async {
    final _onCreate = onCreate;
    final _onUpgrade = onUpgrade;
    final database = await openDatabase(
      _dbFile,
      version: 1,
      onCreate: (db, version) =>
          _onCreate != null ? _onCreate(db: db, version: version) : {},
      onUpgrade: (db, oldVersion, newVersion) => _onUpgrade != null
          ? _onUpgrade(db: db, oldVersion: oldVersion, newVersion: newVersion)
          : {},
    );

    return database;
  }

  @override
  Future<int> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    assert(_db != null, 'DataBase not initialized!');
    final db = _db;

    return db != null
        ? await db.delete(table, where: where, whereArgs: whereArgs)
        : 0;
  }

  @override
  Future<void> execute(String sql, [List<Object?>? arguments]) async {
    assert(_db != null, 'DataBase not initialized!');
    final db = _db;

    if (db != null) {
      await db.execute(sql, arguments);
    }
  }

  @override
  Future<int> insert(String table, Map<String, Object?> values) async {
    assert(_db != null, 'DataBase not initialized!');
    final db = _db;

    return db != null ? await db.insert(table, values) : 0;
  }

  @override
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
  }) async {
    assert(_db != null, 'DataBase not initialized!');
    final db = _db;

    return db != null
        ? await db.query(
            table,
            distinct: distinct,
            columns: columns,
            where: where,
            whereArgs: whereArgs,
            groupBy: groupBy,
            having: having,
            orderBy: orderBy,
            limit: limit,
            offset: offset,
          )
        : [];
  }

  @override
  Future<int> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    assert(_db != null, 'DataBase not initialized!');
    final db = _db;

    return db != null
        ? await db.update(
            table,
            values,
            where: where,
            whereArgs: whereArgs,
          )
        : 0;
  }

  @override
  Future<List<Map<String, Object?>>> rawQuery(
    String sql, [
    List<Object?>? arguments,
  ]) async {
    assert(_db != null, 'DataBase not initialized!');
    final db = _db;

    return db != null ? await db.rawQuery(sql, arguments) : [];
  }
}
