
import 'package:assessment/core/constants/app_constants.dart';
import 'package:equatable/equatable.dart';

class Todo extends Equatable {

  int? userId;
  int? id;
  String? title;
  bool? completed;
  Todo({this.userId=9, this.id,this.title= "", this.completed = false});
   @override
 List<Object?> get props => [id,title,completed];

}