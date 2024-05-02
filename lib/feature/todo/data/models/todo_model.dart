

import 'package:assessment/feature/todo/domain/entities/todo_entity.dart';

class TodoModel extends Todo{
  TodoModel({super.id,super.userId,super.title,super.completed});


  factory TodoModel.fromJson(Map<String, dynamic> json) {

    return TodoModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}