import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/task_model.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();
  static final String dbName = 'tasks.db';
  static final String tableName = 'Tasks';
  static final String idColumnName = 'id';
  static final String taskColumnName = 'taskName';
  static final String taskColumnIsComplete = 'isComplete';
  Database database;

  initDatabase() async {
    database = await getDatabaseConnection();
  }

  Future<Database> getDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$dbName';
    Database database = await openDatabase(path, version: 1, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE $tableName ($idColumnName INTEGER PRIMARY KEY AUTOINCREMENT, $taskColumnName TEXT, $taskColumnIsComplete  INTEGER)');
    });
    return database;
  }

  Future<int>insertTask(TaskModel taskModel) async {
    try{
      int x = await database.insert(tableName, taskModel.toMap());
     return x;
    }
    on Exception catch (e){
      return null;
    }
  }

  Future<List<TaskModel>> getAllTasks() async{
    List<Map<String,dynamic>> results= await database.query(tableName);
    List<TaskModel> list = results.map((e) =>TaskModel.fromMap(e)).toList();
    return list;
  }
  updateTask(TaskModel taskModel) async {
    await database.update(tableName, taskModel.toMap(),
        where: '$idColumnName = ?', whereArgs: [taskModel.id]);
  }

  deleteTask(TaskModel taskModel) async{
    await database.delete(tableName,
        where: '$idColumnName = ?', whereArgs: [taskModel.id]);
  }
  
}
