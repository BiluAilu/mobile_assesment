part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}


class FetchTodosEvent extends TodoEvent{
  const FetchTodosEvent();
}

class UpdateTodosEvent extends TodoEvent{
int? userId;
  int? id;
  String? title;
  bool? completed;

  UpdateTodosEvent({this.userId=9, this.id,this.title= "", this.completed = false});
}
class InsertTodosEvent extends TodoEvent{
int? userId;
  String? title;

  InsertTodosEvent({this.userId=9,this.title= "", });
}


class DeleteTodoEvent extends TodoEvent{
  int id;

  DeleteTodoEvent({required this.id});
}


