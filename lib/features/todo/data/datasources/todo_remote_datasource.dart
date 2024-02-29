import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/todo.dart';
import '../models/todo_model.dart';
import '../models/todos_response.dart';

abstract class TodoRemoteDataSource {
  ///Call the Firebase API and Returns ServerExceptions if the response code is not 200
  Future<TodosResponseModel> getTodos();
  Future<void> saveTodos(List<Todo> todos);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final Dio dio;

  TodoRemoteDataSourceImpl({required this.dio});

  @override
  Future<TodosResponseModel> getTodos() async {
    try {
      final response = await dio.get(
          "https://flutter-chat-42d3a-default-rtdb.asia-southeast1.firebasedatabase.app/todos.json",
          options: Options(
            contentType: "application/json",
          ));
      if (response.statusCode == 200) {
        return TodosResponseModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<void> saveTodos(List<Todo> todos) async {
    final time = DateTime.now().millisecondsSinceEpoch;
    final todosModel = todos
        .map((todo) => TodoModel(
            newId: todo.id,
            title: todo.title,
            description: todo.description,
            isCompleted: todo.isCompleted,
            createdAt: todo.createdAt))
        .toList();
    final data = TodosResponseModel(todos: todosModel, updatedAt: time);
    try {
      final response = await dio.put(
        "https://flutter-chat-42d3a-default-rtdb.asia-southeast1.firebasedatabase.app/todos.json",
        options: Options(
          contentType: "application/json",
        ),
        data: jsonEncode(data.toJson()),
      );
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}
