import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';

class DashboardDBHelper {
  static DashboardDBHelper? _databaseHelper;
  DashboardDBHelper._instance() {
    _databaseHelper = this;
  }

  factory DashboardDBHelper() =>
      _databaseHelper ?? DashboardDBHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tbPopularMovie = 'tb_popular_movie';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/dashboard.db';

    var db = await openDatabase(databasePath,
        version: 21, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  void _onUpgrade(Database db, int before, int after) {
    if (before < after) {
      db.delete(_tbPopularMovie);
      _onCreate(db, after);
    }
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tbPopularMovie(
        id INTEGER PRIMARY KEY,
        poster_path TEXT,
        title TEXT,
        backdrop_path TEXT
      )
    ''');
  }

  Future<int> insertPopularMovie(PopularMovieData popularMovie) async {
    try {
      final db = await database;
      return await db!.rawInsert(
        'INSERT INTO $_tbPopularMovie(id, poster_path, title, backdrop_path) VALUES(?, ?, ?, ?)',
        [
          popularMovie.id,
          popularMovie.posterPath,
          popularMovie.title,
          popularMovie.backdropPath,
        ],
      );
    } catch (e) {
      log("insertPopularMovie :", error: e);
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> getPopularMovie() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> results = await db!.query(
        _tbPopularMovie,
      );
      return results;
    } catch (e) {
      log("getPopularMovie :", error: e);
      return [];
    }
  }
}
