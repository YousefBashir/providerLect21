import 'package:flutter/cupertino.dart';
import 'package:todo_app/helpers/db_helper.dart';
import 'package:todo_app/models/task_model.dart';

class TodoProvider extends ChangeNotifier{
  List <TaskModel> allTasks;
  List <TaskModel> completeTasks;
  List <TaskModel> incompleteTasks;

  TodoProvider(){
    getAllTasks();
  }
  // String myName='yousef Bashir';
  // changeTestName(String newName){
  //   this.myName=newName;
  //   notifyListeners();
  // }
  getAllTasks()async{
    this.allTasks=await DbHelper.dbHelper.getAllTasks();
    this.completeTasks=this.allTasks.where((element) => element.isComplete).toList();
    this.incompleteTasks=this.allTasks.where((element) => !element.isComplete).toList();
    notifyListeners();

  }
  insertNewTask(TaskModel taskModel)async{
    await DbHelper.dbHelper.insertTask(taskModel);
    getAllTasks();
  }
  deleteTask(TaskModel taskModel)async{
    await DbHelper.dbHelper.deleteTask(taskModel);
    getAllTasks();
  }
  updateTask(TaskModel taskModel)async{
    await DbHelper.dbHelper.updateTask(taskModel);
    getAllTasks();
  }

}
