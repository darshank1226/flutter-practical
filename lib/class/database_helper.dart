// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_prectical/models/user_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Future<void> initializeDatabase() async {
    final String path = join(await getDatabasesPath(), 'user_database.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            avatarUrl TEXT,
            name TEXT,
            email TEXT,
            skills TEXT,
            workExperience TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertUser(User user) async {
    return await _database.insert('users', user.toMap());
  }

  Future<List<User>> getUsers() async {
    final List<Map<String, dynamic>> maps = await _database.query('users');
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        avatarUrl: maps[i]['avatarUrl'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        skills: maps[i]['skills'].split(','),
        workExperience: maps[i]['workExperience'].split(','),
      );
    });
  }
}
