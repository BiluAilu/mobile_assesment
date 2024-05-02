import 'package:assessment/core/core.dart';
import 'package:assessment/core/utils/functions.dart';
import 'package:assessment/feature/todo/data/models/todo_model.dart';
import 'package:assessment/feature/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:assessment/feature/todo/domain/usecases/get_todos_usecase.dart';
import 'package:assessment/feature/todo/domain/usecases/insert_todo_usecase.dart';
import 'package:assessment/feature/todo/domain/usecases/update_todo_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final InsertTodoUsecase insertTodoUsecase;
  final UpdateTodoUsecase updateTodoUsecase;
  final GetTodosUsecase getTodosUsecase;
  final DeleteTodoUsecase deleteTodoUsecase;

  TodoBloc(
      {required this.getTodosUsecase,
      required this.insertTodoUsecase,
      required this.updateTodoUsecase,
      required this.deleteTodoUsecase})
      : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      if (event is TodoInitial) {
        emit(TodoLoading());
        final failureOrTodos = await getTodosUsecase.call(NoParams());
        failureOrTodos.fold((failure) {
          String message = mapFailureToMessage(failure);
          emit(TodoError(message: message));
        }, (todos) {
          emit(TodoListLoaded(todos: todos));
        });
      } else if (event is InsertTodosEvent) {
        emit(TodoLoading());
        final failureOrTodo =
            await insertTodoUsecase.call(InsertTodoParams(title: event.title));
        failureOrTodo.fold((failure) {
          String message = mapFailureToMessage(failure);
          emit(TodoError(message: message));
        }, (todo) async {
          final failureOrTodos = await getTodosUsecase.call(NoParams());
          failureOrTodos.fold((failure) {
            String message = mapFailureToMessage(failure);
            emit(TodoError(message: message));
          }, (todos) {
            emit(TodoListLoaded(todos: todos));
          });
        });
      } else if (event is UpdateTodosEvent) {
        emit(TodoLoading());
        final failureOrTodo = await updateTodoUsecase.call(UpdateTodoParams(
          id: event.id,
          title: event.title,
          completed: event.completed,
        ));
        failureOrTodo.fold((failure) {
          String message = mapFailureToMessage(failure);
          emit(TodoError(message: message));
        }, (todo) async {
          final failureOrTodos = await getTodosUsecase.call(NoParams());
          failureOrTodos.fold((failure) {
            String message = mapFailureToMessage(failure);
            emit(TodoError(message: message));
          }, (todos) {
            emit(TodoListLoaded(todos: todos));
          });
        });
      } else if (event is DeleteTodoEvent) {
          final failureOrTodos = await deleteTodoUsecase.call(event.id);
          failureOrTodos.fold((failure) {
            String message = mapFailureToMessage(failure);
            emit(TodoError(message: message));
          }, (todos) {
            emit(const TodoDeleted(message: "deleted successfully"));
          });
       


      }
    });
  }
}
