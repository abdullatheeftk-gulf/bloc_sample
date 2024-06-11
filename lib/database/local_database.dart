import 'dart:io' as io;

import 'package:flutter/foundation.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class LocalDatabase {

  // init database
  static Future<sql.Database> initLocalDatabase() async {
    return await sql.openDatabase(
      await _path(),
      version: 1,
      onCreate: (sql.Database d, int version) async {
        // Todo
        // Initiating Student Table
        await createStudentTable(d);
      },
      onConfigure: _onConfigure,
    );
  }

  // configuaration
  static Future<void> _onConfigure(sql.Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  // Get path
  static Future<String> _path() async {
    if (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      final io.Directory directory = await getApplicationDocumentsDirectory();
      return path.join(directory.path, 'my_school', 'my_school.db');
    }

    return "my_school.db";
  }

  // Create Student Table
  static Future<void> createStudentTable(sql.Database d) async {
    const sqlStatement = '''
        CREATE TABLE IF NOT EXISTS student(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name TEXT NOT NULL,
            age INTEGER NOT NULL
            )
            ''';

    await d.execute(sqlStatement);
  }

  // Delete Database
  Future<void> deleteDatabase() async{
    try{
    final String path = await _path();
    sql.deleteDatabase(path);
    }catch(e){
      throw Exception(e.toString());
    }
  }
}
