import 'package:dartz/dartz.dart';
import 'package:flow/core/errors/exceptions.dart';
import 'package:flow/core/errors/failures.dart';
import 'package:flow/features/todo/data/models/todo_model.dart';
import 'package:flow/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:flow/features/todo/domain/entities/todo.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late TodoRepositoryImpl repository;
  late MockTodoLocalDataSource mockLocalDataSource;
  late MockTodoRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockLocalDataSource = MockTodoLocalDataSource();
    mockRemoteDataSource = MockTodoRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TodoRepositoryImpl(
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const int tTodoId = 1;
  final tTodoModel = TodoModel(
    newId: 1,
    title: "Buy Veg",
    description: "a",
    isCompleted: false,
    createdAt: DateTime(2024, 2, 10, 17, 30),
    updatedAt: null,
    completedAt: null,
    reminderAt: null,
  );
  final Todo tTodo = tTodoModel;

  final List<TodoModel> tTodoModelList = [tTodoModel];
  final List<Todo> tTodoList = tTodoModelList;

  group('get todos', () {
    test('Should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getTodos();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('Device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
          'Should return remote data when call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getTodos())
            .thenAnswer((_) async => tTodoModelList);
        // act
        final result = await repository.getTodos();
        // assert
        verify(mockRemoteDataSource.getTodos());
        expect(result, equals(Right(tTodoList)));
      });

      test(
          'Should cache remote data locally when call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getTodos())
            .thenAnswer((_) async => tTodoModelList);
        // act
        await repository.getTodos();
        // assert
        verify(mockRemoteDataSource.getTodos());
        verify(mockLocalDataSource.cacheTodos(tTodoModelList));
        //  expect(result, equals(Right(tTodo)));
      });

      test(
          'Should return ServerFailure when call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getTodos()).thenThrow(ServerException());
        // act
        final result = await repository.getTodos();
        // assert
        verify(mockRemoteDataSource.getTodos());
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('Device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test(
          'Should return last locally cached data when the cached data is present',
          () async {
        // arrange
        when(mockLocalDataSource.getTodos()).thenAnswer((_) async => tTodoList);
        // act
        final result = await repository.getTodos();
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getTodos());
        expect(result, equals(Right(tTodoList)));
      });

      test(
          'Should return CacheFailure when there is no cache data present locally',
          () async {
        // arrange
        when(mockLocalDataSource.getTodos()).thenThrow(CacheException());
        // act
        final result = await repository.getTodos();
        // assert
        verify(mockLocalDataSource.getTodos());
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });

  group('get todo by ID', () {
    test('Should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getTodoById(tTodoId);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('Device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
          'Should return remote data when call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getTodoById(any))
            .thenAnswer((_) async => tTodo);
        // act
        final result = await repository.getTodoById(tTodoId);
        // assert
        verify(mockRemoteDataSource.getTodoById(tTodoId));
        expect(result, equals(Right(tTodo)));
      });

      test(
          'Should return ServerFailure when call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getTodoById(any))
            .thenThrow(ServerException());
        // act
        final result = await repository.getTodoById(tTodoId);
        // assert
        verify(mockRemoteDataSource.getTodoById(tTodoId));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('Device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test(
          'Should return last locally cached data when the cached data is present',
          () async {
        // arrange
        when(mockLocalDataSource.getTodoById(tTodoId))
            .thenAnswer((_) async => tTodo);
        // act
        final result = await repository.getTodoById(tTodoId);
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getTodoById(tTodoId));
        expect(result, equals(Right(tTodo)));
      });

      test(
          'Should return CacheFailure when there is no cache data present locally',
          () async {
        // arrange
        when(mockLocalDataSource.getTodoById(tTodoId))
            .thenThrow(CacheException());
        // act
        final result = await repository.getTodoById(tTodoId);
        // assert
        verify(mockLocalDataSource.getTodoById(tTodoId));
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
