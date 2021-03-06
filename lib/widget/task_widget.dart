import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/todo_provider.dart';

class Task extends StatelessWidget {
  TaskModel taskModel;


  Task(this.taskModel);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context,provider,x)
      => Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: taskModel.isComplete?Colors.green:Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Checkbox(value: taskModel.isComplete, onChanged: (v){
              taskModel.isComplete=v;
              provider.updateTask(taskModel);
            }),
            SizedBox(width: 10,),
            Text(taskModel.taskName),
            Spacer(),
            IconButton(onPressed: (){
              provider.deleteTask(taskModel);
            }, icon: Icon(Icons.delete)),

          ],
        ),
      ),
    );
  }
}
