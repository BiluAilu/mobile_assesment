



import 'package:assessment/core/core.dart';
import 'package:assessment/feature/todo/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteTodoUsecase extends UseCase<bool,int>{

  final TodoRepository todoRepository;

  DeleteTodoUsecase({required this.todoRepository});
  @override
  Future<Either<Failure, bool>> call(int id)async {
   return await  todoRepository.deleteTodo(id:id);
  }

}


