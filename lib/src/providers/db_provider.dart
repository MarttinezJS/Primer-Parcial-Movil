import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {

  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    return _database != null ? _database :
    _database = await initDB();
  }

  initDB() async {
    
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentDirectory.path, 'Calificaciones.db' );

    return await openDatabase(
      path,
      version: 1,
      onOpen: ( db ) {},
      onCreate: ( db, version ) async {

        await db.execute(
          'CREATE TABLE materias ('
          ' codigo TEXT PRYMARY KEY,'
          ' nombre TEXT,'
          ' nota FLOAT'
          ');'
          'CREATE TABLE cortes ('
          ' id TEXT PRYMARY KEY,'
          ' porcentaje FLOAT,'
          ' nota FLOAT,'
          ' total FLOAT,'
          ' fk_materia TEXT'
          ');'
          'CREATE TABLE actividades ('
          ' id INT PRYMARY KEY,'
          ' porcentaje FLOAT,'
          ' nota FLOAT,'
          ' total FLOAT,'
          ' nombre TEXT,'
          ' fk_materia TEXT'
          ');'
        );
      }
    );
  }
}