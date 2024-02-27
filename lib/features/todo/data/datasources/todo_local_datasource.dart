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