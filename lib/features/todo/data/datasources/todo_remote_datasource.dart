import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../../core/configs/app_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/todo_model.dart';
import '../models/todos_response.dart';

abstract class TodoRemoteDataSource {
  ///Call the Firebase API and Returns ServerExceptions if the response code is not 200
  Future<TodosResponseModel> getTodos();
  Future<void> saveTodos(List<TodoModel> todos);
  Future<void> saveTodo(TodoModel todo);
  Future<void> uploadPendingTodos(List<TodoModel> todos);
  Future<void> clearTodos();
  Future<void> deleteTodo(String id);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  TodoRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<TodosResponseModel> getTodos() async {
    try {
      final response = await dio.get(ApiEndpoints.todos);
      if (response.statusCode == 200) {
        logger.d(response.data);
        if (response.data == null) {
          return TodosResponseModel(todos: [], updatedAt: 1);
        }
        // Extract 'data' field from the standardized response
        final responseData = response.data['data'];
        if (responseData is List) {
          final todos = responseData
              .map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
              .toList();
          return TodosResponseModel(todos: todos, updatedAt: DateTime.now().millisecondsSinceEpoch);
        }
        return TodosResponseModel.fromJson(responseData);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      logger.e(e);
      if (e.response != null && e.response?.data != null) {
        final data = e.response?.data;
        if (data is Map<String, dynamic> && data.containsKey('message')) {
           throw ServerException(message: data['message']);
        }
      }
      throw ServerException();
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<void> saveTodos(List<TodoModel> todos) async {
    final time = DateTime.now().millisecondsSinceEpoch;
    final data = jsonEncode(
      TodosResponseModel(todos: todos, updatedAt: time).toJson(),
    );
    logger.d(data);
    try {
      final response = await dio.post(ApiEndpoints.todos, data: data);
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<void> uploadPendingTodos(List<TodoModel> todos) async {
    try {
      for (final todo in todos) {
        await dio.post(
          ApiEndpoints.todos,
          data: todo.toJson(),
        );
      }
    } on DioException catch (e) {
      logger.e('Failed to upload pending todos: $e');
      throw ServerException();
    } on Exception catch (e) {
      logger.e('Failed to upload pending todos: $e');
      throw ServerException();
    }
  }

  @override
  Future<void> clearTodos() async {
    try {
      final response = await dio.delete(ApiEndpoints.todos);
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<void> saveTodo(TodoModel todo) async {
    try {
      // Convert your TodoModel to JSON
      final data = todo.toJson();

      logger.d(data);

      final response = await dio.post(
        ApiEndpoints.todos,
        data: data, // Dio handles encoding
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }


  @override
  Future<void> deleteTodo(String id) async{
    try {
      final response = await dio.delete('${ApiEndpoints.todos}/$id');
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}
