import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
// import '../../../../core/usecases/usecase.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodos();
  // Future<Either<Failure, Todo>> getTodoById(int id);
  // Future<Either<Failure, NoParams>> addTodo(Todo todo);
  // Future<Either<Failure, NoParams>> updateTodo(Todo todo);
  // Future<Either<Failure, NoParams>> deleteTodoById(int id);
  // Future<Either<Failure, NoParams>> deleteAllTodos();
  // Future<Either<Failure, NoParams>> deleteCompletedTodos();
  // Future<Either<Failure, NoParams>> markTodoAsCompleted(int id);
  // Future<Either<Failure, NoParams>> markTodoAsIncompleted(int id);
}
