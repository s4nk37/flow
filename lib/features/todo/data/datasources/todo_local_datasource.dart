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
  Future<void> cacheTodos(List<Todo> todos);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final SharedPreferences sharedPreferences;

  TodoLocalDataSourceImpl({required this.sharedPreferences});

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
  Future<void> cacheTodos(List<Todo> todos) {
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
    sharedPreferences.remove(kCachedTodosKey);
    sharedPreferences.setString(
      kCachedTodosKey,
      jsonEncode(data.toJson()),
    );
    return Future.value();
  }
}
