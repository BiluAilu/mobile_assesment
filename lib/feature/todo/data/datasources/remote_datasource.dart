

import 'package:assessment/feature/todo/data/models/todo_model.dart';

abstract class RemoteDataSource{


Future<List<TodoModel>>getTodo();
Future<TodoModel>insertTodo({
  required int? userId,
  
  required String? title,
  required bool? completed,
});
Future<TodoModel>updateTodo({
  required int? userId,
  required int?id,
  required String? title,
  required bool? completed,
});
Future<bool>deleteTodo({
  required int?id,
});



}

class RemoteDataSourceImp implements RemoteDataSource{
  @override
  Future<bool> deleteTodo({required int? id}) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getTodo() {


    
    // TODO: implement getTodo
    throw UnimplementedError();
  }

  @override
  Future<TodoModel> insertTodo({required int? userId, required String? title, required bool? completed}) {
    // TODO: implement insertTodo
    throw UnimplementedError();
  }

  @override
  Future<TodoModel> updateTodo({required int? userId, required int? id, required String? title, required bool? completed}) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

}