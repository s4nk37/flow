import 'dart:convert';

import '../../../../core/configs/app_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/todo.dart';

abstract class TodoLocalDataSource {
  /// Gets the cached [List<Todo>] which was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CacheException] if no cached data is present
  Future<List<Todo>> getTodos();
  Future<void> cacheTodos(List<Todo> todos);
  // Future<Todo> getTodoById(int id);
  // Future<void> addTodo(Todo todo);
  // Future<void> updateTodo(Todo todo);
  // Future<void> deleteTodoById(int id);
  // Future<void> deleteAllTodos();
  // Future<void> deleteCompletedTodos();
  // Future<void> markTodoAsCompleted(int id);
  // Future<void> markTodoAsIncompleted(int id);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final SharedPreferences sharedPreferences;

  TodoLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<Todo>> getTodos() async {
    final jsonString = sharedPreferences.getString(kCachedTodosKey);
    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      final todoList = jsonMap['todos'] as List<dynamic>;
      final todos =
          todoList.map((todoJson) => TodoModel.fromJson(todoJson)).toList();

      return Future.value(todos);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheTodos(List<Todo> todos) {
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

    sharedPreferences.setString(
      kCachedTodosKey,
      jsonEncode({'todos': todoList}),
    );

    return Future.value();
  }
}
