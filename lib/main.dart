import 'package:flutter/material.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/ui/pages/main_page.dart';
import 'package:provider/provider.dart';
import 'helpers/db_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.getDatabaseConnection();
  runApp(ChangeNotifierProvider(create:(_) => TodoProvider(),child: MaterialApp(home: MainPage  (),)));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Tasks'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(Provider.of<TodoProvider>(context).myName,style:TextStyle(fontSize: 25),textAlign: TextAlign.center,),
          ElevatedButton(onPressed:(){
            Provider.of<TodoProvider>(context,listen: false).changeTestName('Mohammed');
          } ,child: Text('change the value'),),
        ],
      ),
    );
  }
}

