import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository{
  @override
  Future<Either<Failure, NoParams>> addTodo(Todo todo) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoParams>> deleteAllTodos() {
    // TODO: implement deleteAllTodos
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoParams>> deleteCompletedTodos() {
    // TODO: implement deleteCompletedTodos
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoParams>> deleteTodoById(int id) {
    // TODO: implement deleteTodoById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Todo>> getTodoById(int id) {
    // TODO: implement getTodoById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Todo>>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoParams>> markTodoAsCompleted(int id) {
    // TODO: implement markTodoAsCompleted
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoParams>> markTodoAsIncompleted(int id) {
    // TODO: implement markTodoAsIncompleted
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoParams>> updateTodo(Todo todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

}