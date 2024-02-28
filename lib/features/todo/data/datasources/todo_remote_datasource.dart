import '../../domain/entities/todo.dart';

abstract class TodoRemoteDataSource{

  ///Call the Firebase API and Returns ServerExceptions if the response code is not 200
  Future<List<Todo>> getTodos();
  // Future<Todo> getTodoById(int id);
  // Future<void> addTodo(Todo todo);
  // Future<void> updateTodo(Todo todo);
  // Future<void> deleteTodoById(int id);
  // Future<void> deleteAllTodos();
  // Future<void> deleteCompletedTodos();
  // Future<void> markTodoAsCompleted(int id);
  // Future<void> markTodoAsIncompleted(int id);
}