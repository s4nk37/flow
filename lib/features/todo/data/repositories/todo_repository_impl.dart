import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_datasource.dart';
import '../datasources/todo_remote_datasource.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;
  final TodoRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TodoRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

   @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTodos = await remoteDataSource.getTodos();
        localDataSource.cacheTodos(remoteTodos);
        return Right(remoteTodos);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTodos = await localDataSource.getTodos();
        return Right(localTodos);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Todo>> getTodoById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTodo = await remoteDataSource.getTodoById(id);
        return Right(remoteTodo);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTodo = await localDataSource.getTodoById(id);
        return Right(localTodo);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }


  @override
  Future<Either<Failure, NoParams>> addTodo(Todo todo) async {
    return _executeTodoOperation(
      () => remoteDataSource.addTodo(todo),
      () => localDataSource.addTodo(todo),
    );
  }

  @override
  Future<Either<Failure, NoParams>> deleteAllTodos() async {
    return _executeTodoOperation(
      () => remoteDataSource.deleteAllTodos(),
      () => localDataSource.deleteAllTodos(),
    );
  }

  @override
  Future<Either<Failure, NoParams>> deleteCompletedTodos() async {
    return _executeTodoOperation(
      () => remoteDataSource.deleteCompletedTodos(),
      () => localDataSource.deleteCompletedTodos(),
    );
  }

  @override
  Future<Either<Failure, NoParams>> deleteTodoById(int id) async {
    return _executeTodoOperation(
      () => remoteDataSource.deleteTodoById(id),
      () => localDataSource.deleteTodoById(id),
    );
  }



  @override
  Future<Either<Failure, NoParams>> markTodoAsCompleted(int id) async {
    return _executeTodoOperation(
      () => remoteDataSource.markTodoAsCompleted(id),
      () => localDataSource.markTodoAsCompleted(id),
    );
  }

  @override
  Future<Either<Failure, NoParams>> markTodoAsIncompleted(int id) async {
    return _executeTodoOperation(
      () => remoteDataSource.markTodoAsIncompleted(id),
      () => localDataSource.markTodoAsIncompleted(id),
    );
  }

  @override
  Future<Either<Failure, NoParams>> updateTodo(Todo todo) async {
    return _executeTodoOperation(
      () => remoteDataSource.updateTodo(todo),
      () => localDataSource.updateTodo(todo),
    );
  }

   Future<Either<Failure, NoParams>> _executeTodoOperation(
    Future<void> Function() remoteOperation,
    Future<void> Function() localOperation,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteOperation();
        return Right(NoParams());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        await localOperation();
        return Right(NoParams());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

}