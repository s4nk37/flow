import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/configs/app_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/todo.dart';
import '../models/todo_model.dart';
import '../models/todos_response.dart';

abstract class TodoLocalDataSource {
  /// Gets the cached [List<Todo>] which was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CacheException] if no cached data is present
  Future<TodosResponseModel> getTodos();
  Future<void> savePendingTodos(List<TodoModel> todos);
  Future<TodosResponseModel> getPendingTodos();
  Future<void> cacheTodos(List<TodoModel> todos);
  Future<void> saveTodo(TodoModel todo);
  Future<void> clearPendingTodos();
  Future<void> clearTodos();
  Future<void> deleteTodo(int id);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  TodoLocalDataSourceImpl({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<TodosResponseModel> getTodos() async {
    final jsonString = sharedPreferences.getString(kCachedTodosKey);
    if (jsonString != null) {
      try {
        final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
        final todosResponse = TodosResponseModel.fromJson(jsonMap);
        return Future.value(todosResponse);
      } on Exception {
        throw CacheException();
      }
    } else {
      return TodosResponseModel(todos: [], updatedAt: 1);
    }
  }

  @override
  Future<void> cacheTodos(List<TodoModel> todos) {
    try {
      final time = DateTime.now().millisecondsSinceEpoch;
      final todosModel = todos
          .map(
            (todo) => TodoModel(
              id: todo.id,
              title: todo.title,
              description: todo.description,
              isCompleted: todo.isCompleted,
              createdAt: todo.createdAt,
              reminderAt: todo.reminderAt,
              updatedAt: todo.updatedAt,
              completedAt: todo.completedAt,
              isDeleted: todo.isDeleted,
              isSynced: todo.isSynced,
            ),
          )
          .toList();
      final data = TodosResponseModel(todos: todosModel, updatedAt: time);
      sharedPreferences.remove(kCachedTodosKey);
      sharedPreferences.setString(kCachedTodosKey, jsonEncode(data.toJson()));
      return Future.value();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> clearPendingTodos() {
    try {
      sharedPreferences.remove(kPendingTodosKey);
      return Future.value();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> clearTodos() {
    try {
      sharedPreferences.remove(kCachedTodosKey);
      sharedPreferences.remove(kPendingTodosKey);
      return Future.value();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<TodosResponseModel> getPendingTodos() async {
    final jsonString = sharedPreferences.getString(kPendingTodosKey);
    if (jsonString != null) {
      try {
        final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
        final todosResponse = TodosResponseModel.fromJson(jsonMap);
        return Future.value(todosResponse);
      } on Exception {
        throw CacheException();
      }
    } else {
      return TodosResponseModel(todos: [], updatedAt: 1);
    }
  }

  @override
  Future<void> savePendingTodos(List<Todo> todos) async {
    final time = DateTime.now().millisecondsSinceEpoch;
    final todosModel = todos
        .map(
          (todo) => TodoModel(
            id: todo.id,
            title: todo.title,
            description: todo.description,
            isCompleted: todo.isCompleted,
            createdAt: todo.createdAt,
            reminderAt: todo.reminderAt,
            updatedAt: todo.updatedAt,
            completedAt: todo.completedAt,
            isDeleted: todo.isDeleted,
            isSynced: todo.isSynced,
          ),
        )
        .toList();
    final data = TodosResponseModel(todos: todosModel, updatedAt: time);
    sharedPreferences.remove(kPendingTodosKey);
    sharedPreferences.setString(kPendingTodosKey, jsonEncode(data.toJson()));
    return Future.value();
  }

  @override
  Future<void> saveTodo(TodoModel todo) async{
    try {
      final todosResponse = await getTodos();
      final todos = todosResponse.todos ?? [];
      final index = todos.indexWhere((t) => t.id == todo.id);
      if (index != -1) {
        todos[index] = todo;
      } else {
        todos.add(todo);
      }
      await cacheTodos(todos);
      return Future.value();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteTodo(int id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }
}
