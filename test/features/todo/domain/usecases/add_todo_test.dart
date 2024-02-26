import 'package:dartz/dartz.dart';
import 'package:flow/features/todo/domain/entities/todo.dart';
import 'package:flow/features/todo/domain/usecases/add_todo.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flow/core/usecases/usecase.dart';

import '../../../../helpers/test_mock.mocks.dart';


void main() {
  late MockTodoRepository mockTodoRepository;
  late AddTodo usecase;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = AddTodo(mockTodoRepository);
  });

  final noParams = NoParams();
  final tTodo = Todo(
    id: 1,
    title: "Buy Veg",
    description: "a",
    isCompleted: false,
    createdAt: DateTime(2024, 2, 10, 17, 30),
    updatedAt: null,
    completedAt: null,
    reminderAt: null,
  );

  test('Should call add todo method successfully', () async {
    // arrange
    when(mockTodoRepository.addTodo(tTodo))
        .thenAnswer((_) async => Right(noParams));

    // act
    final result = await usecase(AddTodoParams(tTodo));

    // assert
    expect(result, Right(noParams));
    verify(mockTodoRepository.addTodo(tTodo));
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
