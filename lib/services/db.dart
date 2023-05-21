import 'dart:math';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class DatabaseManager {
  DatabaseManager() {
    WidgetsFlutterBinding.ensureInitialized();
    createDatabase();
  }

  Future<Database> createDatabase() async {
    final bancoDeDados = await openDatabase(
      'tasks_db.db',
      version: 1,
      onCreate: (db, version) async {
        try {
          await db.execute('''
          CREATE TABLE tasks (
            id INTEGER PRIMARY KEY,
            title TEXT,
            description TEXT
          )
        ''');
        } catch (e) {
          print(e);
        }
      },
    );

    return bancoDeDados;
  }

  void addRegister(String title, String description) async {
    final db = await createDatabase(); // retorna meu banco de dados
    try {
      var id = Random().nextInt(9000);
      await db.insert(
          'tasks', {'id': id, 'title': title, 'description': description});
    } catch (e) {
      print('Erro: $e');
    }
  }

  void deleteRegister(String id) async {
    final db = await createDatabase();
    try {
      await db.rawDelete('DELETE FROM tasks WHERE id = ?', [id]);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getRegisters() async {
    final db = await createDatabase();
    return await db.query('tasks');
  }
}
