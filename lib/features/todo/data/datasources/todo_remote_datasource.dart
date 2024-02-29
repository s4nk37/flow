import 'package:flow/core/errors/exceptions.dart';
import 'package:logger/logger.dart';

import '../../../../core/configs/app_config.dart';
import '../../domain/entities/todo.dart';
import 'package:dio/dio.dart';

import '../models/todo_model.dart';

abstract class TodoRemoteDataSource {
  ///Call the Firebase API and Returns ServerExceptions if the response code is not 200
  Future<List<dynamic>> getTodos();
  Future<void> saveTodos(List<Todo> todos);
  // Future<Todo> getTodoById(int id);
  // Future<void> addTodo(Todo todo);
  // Future<void> updateTodo(Todo todo);
  // Future<void> deleteTodoById(int id);
  // Future<void> deleteAllTodos();
  // Future<void> deleteCompletedTodos();
  // Future<void> markTodoAsCompleted(int id);
  // Future<void> markTodoAsIncompleted(int id);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final Dio dio;

  TodoRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<dynamic>> getTodos() async {
    try {
      final response = await dio.get(
          "https://flutter-chat-42d3a-default-rtdb.asia-southeast1.firebasedatabase.app/todos.json",
          options: Options(
            contentType: "application/json",
          ));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = response.data;
        final todoList = jsonMap['todos'] as List<dynamic> ?? [];
        final List<TodoModel> todosModel = todoList
            .map((todoJson) => TodoModel.fromJson(todoJson))
            .toList() as List<TodoModel>;
        return [todosModel, jsonMap['updatedAt']];
      } else {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<void> saveTodos(List<Todo> todos) async {
    final List<Map<String, dynamic>> todoList = todos.map((todo) {
      return TodoModel(
        newId: todo.id,
        title: todo.title,
        isCompleted: todo.isCompleted,
        createdAt: todo.createdAt,
        description: todo.description,
        completedAt: todo.completedAt,
        reminderAt: todo.reminderAt,
        updatedAt: todo.updatedAt,
      ).toJson();
    }).toList();

    final time = DateTime.now().millisecondsSinceEpoch;
    final Map<String, dynamic> data = {
      'todos': todoList,
      'updatedAt': time,
    };
    logger.i(data);
    try {
      final response = await dio.put(
        "https://flutter-chat-42d3a-default-rtdb.asia-southeast1.firebasedatabase.app/todos.json",
        options: Options(
          contentType: "application/json",
        ),
        data: data,
      );
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}
