

import 'package:assessment/core/core.dart';
import 'package:assessment/feature/todo/data/models/todo_model.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {

  Future<Either<Failure,TodoModel>> insertTodo({String? title});
  Future<Either<Failure,List<TodoModel>>> getTodo();
  Future<Either<Failure,TodoModel>> updateTodo( {int id,bool? isCompleted,String? title});
  Future<Either<Failure,bool>> deleteTodo({int id});

}