import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodos();
  Future<Either<Failure, Todo>> getTodoById(int id);
  Future<Either<Failure, void>> addTodo(Todo todo);
  Future<Either<Failure, void>> updateTodo(Todo todo);
  Future<Either<Failure, void>> deleteTodoById(int id);
  Future<Either<Failure, void>> deleteAllTodos();
  Future<Either<Failure, void>> deleteCompletedTodos();
  Future<Either<Failure, void>> markTodoAsCompleted(int id);
  Future<Either<Failure, void>> markTodoAsIncompleted(int id);
}
