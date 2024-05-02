



import 'package:assessment/core/core.dart';
import 'package:assessment/feature/todo/data/models/todo_model.dart';
import 'package:assessment/feature/todo/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

class GetTodosUsecase extends UseCase<List<TodoModel>,NoParams>{

  final TodoRepository todoRepository;

  GetTodosUsecase({required this.todoRepository});
  @override
  Future<Either<Failure, List<TodoModel>>> call(NoParams)async {
   return await  todoRepository.getTodo();
  }

}


