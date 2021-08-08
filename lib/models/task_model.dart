import 'package:flutter/cupertino.dart';

class TaskModel {
  int id;
  String taskName;
  bool isComplete;

  TaskModel(
      { this.id, @required this.taskName, @required this.isComplete});

  Map<String, dynamic> toMap() {
    return {'taskName': taskName, 'isComplete': isComplete?1:0};
  }

  factory TaskModel.fromMap(Map<String, dynamic> incomingData) {
    return TaskModel(
        id: incomingData['id'],
        taskName: incomingData['taskName'],
        isComplete: incomingData['isComplete']==1? true:false);
  }
}
