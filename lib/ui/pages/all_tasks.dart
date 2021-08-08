import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/widget/task_widget.dart';

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider=Provider.of<TodoProvider>(context);
    return ListView.builder(
        itemCount: Provider.of<TodoProvider>(context).allTasks.length,
        itemBuilder: (context, index) {
          return Task( todoProvider.allTasks[index]);
        });
  }
}
