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
    try {
      final localTodosResponse = await localDataSource.getTodos();
      if (await networkInfo.isConnected) {
        // Fetching remote and comapring latest verions
        try {
          final remoteTodosResponse = await remoteDataSource.getTodos();
          if (remoteTodosResponse.updatedAt > localTodosResponse.updatedAt) {
            await localDataSource.cacheTodos(remoteTodosResponse.todos);
            return Right(remoteTodosResponse.todos);
          } else {
            await remoteDataSource.saveTodos(localTodosResponse.todos);
            return Right(localTodosResponse.todos);
          }
        } on Exception {
          return Left(ServerFailure());
        }
      }
      if (localTodosResponse.todos.isEmpty) {
        return Left(CacheFailure());
      } else {
        return Right(localTodosResponse.todos);
      }
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> saveTodos(List<Todo> todos) async {
    try {
      localDataSource.cacheTodos(todos);
      if (await networkInfo.isConnected) {
        try {
          remoteDataSource.saveTodos(todos);
          return Right(NoParams());
        } on ServerException {
          return Left(ServerFailure());
        }
      }
      return Right(NoParams());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
