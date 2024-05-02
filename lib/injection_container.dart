

import 'package:assessment/core/core.dart';
import 'package:assessment/feature/todo/data/datasources/remote_datasource.dart';
import 'package:assessment/feature/todo/data/repositories/todo_repository_imp.dart';
import 'package:assessment/feature/todo/domain/repositories/todo_repository.dart';
import 'package:assessment/feature/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:assessment/feature/todo/domain/usecases/get_todos_usecase.dart';
import 'package:assessment/feature/todo/domain/usecases/insert_todo_usecase.dart';
import 'package:assessment/feature/todo/domain/usecases/update_todo_usecase.dart';
import 'package:assessment/feature/todo/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

final sq=GetIt.instance;

Future <void> init()async{




// ! Features

// * First let's register the bloc


sq.registerFactory(() => TodoBloc(getTodosUsecase: sq(), insertTodoUsecase: sq(), updateTodoUsecase: sq(), deleteTodoUsecase: sq(), ));



// * Then let's register Usecases

// ? And remember to to use registerFactory() for bloc register only , but for the rest let's try to use just registerLazySingleton() or registerSingleton();
sq.registerLazySingleton(() => GetTodosUsecase(todoRepository: sq()));
sq.registerLazySingleton(() => InsertTodoUsecase(todoRepository: sq()));
sq.registerLazySingleton(() => UpdateTodoUsecase(todoRepository: sq()));
sq.registerLazySingleton(() => DeleteTodoUsecase(todoRepository: sq()));



// * Repository 


sq.registerLazySingleton<TodoRepository>(() =>TodoRepositoryImp(remoteDataSource: sq()) );


// * Data sources
sq.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(client: sq()));

// ! Core

// * Network
sq.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sq()));



// ! External (Packages)

  sq.registerLazySingleton(() => http.Client());
  sq.registerLazySingleton(() => InternetConnectionChecker());
}