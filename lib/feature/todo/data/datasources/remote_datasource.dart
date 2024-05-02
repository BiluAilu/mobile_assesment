import 'dart:convert';

import 'package:assessment/core/constants/app_key.dart';
import 'package:assessment/core/core.dart';
import 'package:assessment/feature/todo/data/models/todo_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<TodoModel>> getTodo();
  Future<TodoModel> insertTodo({
    required int? userId,
    required String? title,
    required bool? completed,
  });
  Future<TodoModel> updateTodo({
    required int? userId,
    required int? id,
    required String? title,
    required bool? completed,
  });
  Future<bool> deleteTodo({
    required int? id,
  });
}

class RemoteDataSourceImp implements RemoteDataSource {
  late http.Client client;

  RemoteDataSourceImp({required this.client});
  @override
  Future<bool> deleteTodo({required int? id}) async {
    try {
      await client.delete(Uri.parse('$apiBaseUrl/$id'), headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${token.toString()}"
      });
      return true;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<TodoModel>> getTodo() async {
    try {
      final response = await client.get(Uri.parse('$apiBaseUrl/'), headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body)['data'];

        return TodoModel.todoList(jsonDecode(response.body));
      }
      else{
        throw ServerException();
      }
    } catch (e) {
      //  return Left(mapExceptionToFailure(e));
      throw ServerException();
    }
  }

  @override
  Future<TodoModel> insertTodo(
      {required int? userId,
      required String? title,
      required bool? completed}) async {
    try {
      Map<String, dynamic> data;
      data = {'userId': userId, 'title': title, 'completed': completed};

      var body = json.encode(data);
      final response =
          await client.post(Uri.parse('$apiBaseUrl/'), body: body, headers: {
        'Content-Type': 'application/json',
      });

      return TodoModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<TodoModel> updateTodo(
      {required int? userId,
      required int? id,
      required String? title,
      required bool? completed}) async {
    try {
      Map<String, dynamic> data;
      data = {
        'id': id,
        'userId': userId,
        'title': title,
        'completed': completed
      };

      var body = json.encode(data);
      final response =
          await client.put(Uri.parse('$apiBaseUrl/'), body: body, headers: {
        'Content-Type': 'application/json',
      });

      return TodoModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw ServerException();
    }
  }
}
