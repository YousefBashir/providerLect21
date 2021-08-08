import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helpers/db_helper.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/ui/pages/all_tasks.dart';
import 'package:todo_app/ui/pages/complete_task.dart';
import 'package:todo_app/ui/pages/new_task.dart';
import 'package:todo_app/ui/pages/uncomplete_task.dart';

class MainPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo Tasks'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return NewTask();
              }));
            }, icon: Icon(Icons.add))
          ],
          bottom: TabBar(tabs: [
            Tab(text: 'All Tasks',),
            Tab(text: 'Completed Tasks',),
            Tab(text: 'InCompleted Tasks',)

          ],),
        ),
        body:Provider.of<TodoProvider>(context).allTasks==null ?Center(child: CircularProgressIndicator(),):TabBarView(children:[
          AllTasks(),
          CompleteTasks(),
          InCompleteTasks(),
        ]) ,
      ),
    );
  }
}
