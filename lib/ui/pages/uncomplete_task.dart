import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/widget/task_widget.dart';

class InCompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<TodoProvider>(context).incompleteTasks.length,
        itemBuilder: (context, index) {
          return Task(Provider.of<TodoProvider>(context).incompleteTasks[index]);
        });
  }
}