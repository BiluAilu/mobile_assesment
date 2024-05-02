


import 'package:assessment/core/core.dart';
import 'package:assessment/feature/todo/data/models/todo_model.dart';
import 'package:assessment/feature/todo/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

class InsertTodoUsecase extends UseCase<TodoModel,InsertTodoParams>{

  final TodoRepository todoRepository;

  InsertTodoUsecase({required this.todoRepository});
  @override
  Future<Either<Failure, TodoModel>> call(InsertTodoParams params)async {
   return await  todoRepository.insertTodo(title:params.title);
  }

}


class InsertTodoParams{
    int? userId;
  String? title;
  bool? completed;
  InsertTodoParams({this.userId=9, this.title= "", this.completed = false});
}