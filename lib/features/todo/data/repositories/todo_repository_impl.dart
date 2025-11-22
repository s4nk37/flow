import 'package:dartz/dartz.dart';

import '../../../../core/configs/app_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_datasource.dart';
import '../datasources/todo_remote_datasource.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });
  final TodoLocalDataSource localDataSource;
  final TodoRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, NoParams>> clearTodos() {
    logger.e('Clearing todos');
    try {
      localDataSource.clearTodos();
      remoteDataSource.clearTodos();
      return Future.value(Right(NoParams()));
    } on CacheException {
      return Future.value(Left(CacheFailure()));
    }
  }

  Future<Either<Failure, NoParams>> deleteTodo(String id) async {
    logger.e('Deleting todo with id: $id');
    try {
      await localDataSource.deleteTodo(id);
      if (await networkInfo.isConnected) {
        try {
          await remoteDataSource.deleteTodo(id);
          return Future.value(Right(NoParams()));
        } on Exception {
          return Future.value(Left(ServerFailure()));
        }
      }
      return Future.value(Right(NoParams()));
    } on CacheException {
      return Future.value(Left(CacheFailure()));
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    logger.d('Getting todos from repository');
    try {/**/
      final res = await remoteDataSource.getTodos();
      if (res.todos == null || res.todos!.isEmpty) {
        return Future.value(const Right([]));
      } else {
        return Future.value(Right(res.todos!));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> saveTodo(Todo todo) async {
    logger.d('Saving todo:  $todo');
    try {
      final todoModel = TodoModel.fromEntity(todo);
      await localDataSource.saveTodo(todoModel);
      
      if (await networkInfo.isConnected) {
        try {
          await remoteDataSource.saveTodo(todoModel);
          return Future.value(Right(NoParams()));
        } on Exception {
          // Remote save failed, add to pending list
          final pendingResponse = await localDataSource.getPendingTodos();
          final pendingList = pendingResponse.todos?.toList() ?? [];
          // Avoid duplicates if possible, though simple add is safer for now
          pendingList.add(todoModel);
          await localDataSource.savePendingTodos(pendingList);
          return Future.value(Right(NoParams()));
        }
      } else {
        // Offline, add to pending list
        final pendingResponse = await localDataSource.getPendingTodos();
        final pendingList = pendingResponse.todos?.toList() ?? [];
        pendingList.add(todoModel);
        await localDataSource.savePendingTodos(pendingList);
        return Future.value(Right(NoParams()));
      }
    } on CacheException {
      return Future.value(Left(CacheFailure()));
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> syncTodos() async {
    try {
      final pendingTodos = await localDataSource.getPendingTodos();
      if (pendingTodos.todos != null && pendingTodos.todos!.isNotEmpty) {
        await remoteDataSource.uploadPendingTodos(pendingTodos.todos ?? []);
        await localDataSource.clearPendingTodos();
      }
      final remoteTodosResponse = await remoteDataSource.getTodos();
      await localDataSource.cacheTodos(remoteTodosResponse.todos ?? []);
      return Future.value(Right(remoteTodosResponse.todos ?? []));
    } on Exception {
      return Future.value(Left(ServerFailure()));
    }
  }
}

