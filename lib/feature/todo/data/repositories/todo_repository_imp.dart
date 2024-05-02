

import 'package:assessment/core/core.dart';
import 'package:assessment/core/error/failure.dart';
import 'package:assessment/feature/todo/data/datasources/remote_datasource.dart';
import 'package:assessment/feature/todo/data/models/todo_model.dart';
import 'package:assessment/feature/todo/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

class TodoRepositoryImp implements TodoRepository{


  final RemoteDataSource remoteDataSource;
  TodoRepositoryImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, bool>> deleteTodo({int? id}) async {
   try{
    final remoteData=await remoteDataSource.deleteTodo(id: id);
    return  Right(remoteData);

   }catch(e){
    return Left(mapExceptionToFailure(e));
   }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> getTodo()async {

    try{
final remoteData=await remoteDataSource.getTodo();
return Right(remoteData);
    }
    catch(e){
      return Left(mapExceptionToFailure(e));
    }
    
  }

  @override
  Future<Either<Failure, TodoModel>> insertTodo({String? title}) async{
   
     try{
final remoteData=await remoteDataSource.insertTodo(title: title,completed: false,userId: 9);
return Right(remoteData);
    }
    catch(e){
      return Left(mapExceptionToFailure(e));
    }
    
  }

  @override
  Future<Either<Failure, TodoModel>> updateTodo({int? id, bool? isCompleted, String? title})async {
       try{
final remoteData=await remoteDataSource.updateTodo(id: id,completed: isCompleted,title: title,userId: 9);
return Right(remoteData);
    }
    catch(e){
      return Left(mapExceptionToFailure(e));
    }
    
  }

}