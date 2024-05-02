part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();  

  @override
  List<Object> get props => [];
}
class TodoInitial extends TodoState {}

class TodoLoading extends TodoState{

}

class TodoListLoaded extends TodoState{
  final List<TodoModel>todos;
  TodoListLoaded({required this.todos});
}

class TodoError extends TodoState{
  final String? message;
  TodoError({required this.message});
}
class TodoInserted extends TodoState{
  final String? message;
  TodoInserted({required this.message});
}
class TodoUpdated extends TodoState{
  final String? message;
  TodoUpdated({required this.message});
}
class TodoDeleted extends TodoState{
  final String? message;
  TodoDeleted({required this.message});
}



