import 'package:dartz/dartz.dart';
import 'package:flow/core/errors/exceptions.dart';
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

  TodoRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, NoParams>> addTodo(Todo todo) async{
   if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.addTodo(todo);
        return Right(NoParams());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        await localDataSource.addTodo(todo);
        return Right(NoParams())  ;
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, NoParams>> deleteAllTodos() async{
     if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteAllTodos();
        return Right(NoParams());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        await localDataSource.deleteAllTodos();
        return Right(NoParams())  ;
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, NoParams>> deleteCompletedTodos() async{
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteCompletedTodos();
        return Right(NoParams());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        await localDataSource.deleteCompletedTodos();
        return Right(NoParams())  ;
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, NoParams>> deleteTodoById(int id) async{
   if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteTodoById(id);
        return Right(NoParams());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        await localDataSource.deleteTodoById(id);
        return Right(NoParams())  ;
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
  Future<Either<Failure, NoParams>> markTodoAsCompleted(int id)async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.markTodoAsCompleted(id);
        return Right(NoParams());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        await localDataSource.markTodoAsCompleted(id);
        return Right(NoParams())  ;
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, NoParams>> markTodoAsIncompleted(int id) async{
   if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.markTodoAsIncompleted(id);
        return Right(NoParams());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        await localDataSource.markTodoAsIncompleted(id);
        return Right(NoParams())  ;
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, NoParams>> updateTodo(Todo todo) async{
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateTodo(todo);
        return Right(NoParams());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        await localDataSource.updateTodo(todo);
        return Right(NoParams())  ;
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }



}
