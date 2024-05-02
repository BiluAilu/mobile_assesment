



import 'package:assessment/core/core.dart';
import 'package:assessment/feature/todo/data/models/todo_model.dart';
import 'package:assessment/feature/todo/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateTodoUsecase extends UseCase<TodoModel,UpdateTodoParams>{

  final TodoRepository todoRepository;

  UpdateTodoUsecase({required this.todoRepository});
  @override
  Future<Either<Failure, TodoModel>> call(UpdateTodoParams params)async {
   return await  todoRepository.updateTodo(title: params.title, id: params.id,isCompleted:  params.completed);
  }

}


class UpdateTodoParams{
  int  id;
    int? userId;
  String? title;
  bool? completed;
  UpdateTodoParams({ required this.id,this.userId=9, this.title= "", this.completed = false});
}