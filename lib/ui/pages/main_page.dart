import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helpers/db_helper.dart';
import 'package:todo_app/helpers/theme_helper.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/them_provider.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/ui/pages/all_tasks.dart';
import 'package:todo_app/ui/pages/complete_task.dart';
import 'package:todo_app/ui/pages/new_task.dart';
import 'package:todo_app/ui/pages/uncomplete_task.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<ThemeProvider>(
      builder: (context, provider, x) => MaterialApp(
        theme: provider.themeData,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer2<TodoProvider, ThemeProvider>(
      builder: (context, provider, provider2, x) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return NewTask();
                    }));
                  },
                  icon: Icon(Icons.add)),
              Switch(
                  value: provider2.themeData == ThemeHelper.lightTheme,
                  onChanged: (value) {
                    if (value) {
                      provider2.setThemeData(MyThemeMode.light);
                    } else {
                      provider2.setThemeData(MyThemeMode.dark);
                    }
                  })
            ],
            title: Text(
              'Todo App',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            bottom: TabBar(isScrollable: true, tabs: [
              Tab(
                text: 'All Tasks',
              ),
              Tab(
                text: 'Complete Tasks',
              ),
              Tab(
                text: 'InComplete Tasks',
              ),
            ]),
          ),
          body: Column(
            children: [
              Expanded(
                child: provider.allTasks == null
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : TabBarView(children: [
                  AllTasks(),
                  CompleteTasks(),
                  InCompleteTasks(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}