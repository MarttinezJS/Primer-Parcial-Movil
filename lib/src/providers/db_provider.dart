import 'dart:io';

import 'package:parcialmovil1/src/models/models.dart';
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
          ' corte1 INT,'
          ' corte2 INT,'
          ' corte3 INT,'
          ' nota FLOAT'
          ');'
        );
      }
    );
  }

  nuevaMateria( Materia materia ) async {

    final db = await database;
    return await db.insert('materias', materia.toJson());
  }

  Future<List<Materia>> getMaterias() async {

    final db = await database;
    final resp = await db.query('materias');

    return resp.isNotEmpty? resp.map((e) => Materia.fromJson(e)).toList() : [];

  }
}