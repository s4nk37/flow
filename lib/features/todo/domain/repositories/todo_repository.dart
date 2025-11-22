import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  /// Get all todos (first from local cache, then synced by background sync)
  Future<Either<Failure, List<Todo>>> getTodos();

  /// Save a single todo (add or update)
  Future<Either<Failure, NoParams>> saveTodo(Todo todo);

  /// Delete a todo by ID (soft delete if offline-first)
  Future<Either<Failure, NoParams>> deleteTodo(String id);

  /// Clear all todos locally (not normally used)
  Future<Either<Failure, NoParams>> clearTodos();

  /// Sync: push local changes & fetch latest from server
  Future<Either<Failure, List<Todo>>> syncTodos();
}
