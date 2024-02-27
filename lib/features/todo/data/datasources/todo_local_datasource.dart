import 'dart:convert';

import 'package:flow/features/todo/data/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/todo.dart';

abstract class TodoLocalDataSource {
  /// Gets the cached [List<Todo>] which was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CacheException] if no cached data is present
  Future<List<Todo>> getTodos();
  Future<void> cacheTodos(List<Todo> todos);
  Future<Todo> getTodoById(int id);
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodoById(int id);
  Future<void> deleteAllTodos();
  Future<void> deleteCompletedTodos();
  Future<void> markTodoAsCompleted(int id);
  Future<void> markTodoAsIncompleted(int id);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final SharedPreferences sharedPreferences;

  TodoLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> addTodo(Todo todo) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<void> cacheTodos(List<Todo> todos) {
    // TODO: implement cacheTodos
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllTodos() {
    // TODO: implement deleteAllTodos
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCompletedTodos() {
    // TODO: implement deleteCompletedTodos
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodoById(int id) {
    // TODO: implement deleteTodoById
    throw UnimplementedError();
  }

  @override
  Future<Todo> getTodoById(int id) {
    // TODO: implement getTodoById
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodos() async {
    final jsonString = sharedPreferences.getString('CACHED_TODOS')??"";

   final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
  final todoList = jsonMap['todos'] as List<dynamic>;
  final todos = todoList.map((todoJson) => TodoModel.fromJson(todoJson)).toList();


    return Future.value(todos);
  }

  @override
  Future<void> markTodoAsCompleted(int id) {
    // TODO: implement markTodoAsCompleted
    throw UnimplementedError();
  }

  @override
  Future<void> markTodoAsIncompleted(int id) {
    // TODO: implement markTodoAsIncompleted
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo(Todo todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
