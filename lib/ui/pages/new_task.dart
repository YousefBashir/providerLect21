import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/todo_provider.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  bool isComplete=false;
  String taskName;

  saveTask() {
    Provider.of<TodoProvider>(context, listen: false)
        .insertNewTask(TaskModel(taskName: taskName, isComplete: isComplete));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new task'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Insert new task'),
            TextField(
              onChanged: (v) {
                this.taskName = v;
              },
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'Task name',
              ),
            ),
            Checkbox(
                value: isComplete,
                onChanged: (v) {
                  this.isComplete = v;
                  setState(() {});
                }),
            ElevatedButton(
                onPressed: () {
                  saveTask();
                },
                child: Text('Insert new task')),
          ],
        ),
      ),
    );
  }
}
