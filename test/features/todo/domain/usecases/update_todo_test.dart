import 'package:dartz/dartz.dart';
import 'package:flow/core/usecases/usecase.dart';
import 'package:flow/features/todo/domain/entities/todo.dart';
import 'package:flow/features/todo/domain/usecases/update_todo.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockTodoRepository mockTodoRepository;
  late UpdateTodo usecase;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = UpdateTodo(mockTodoRepository);
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

  test('Should call update todo by id method successfully', () async {
    // arrange
    when(mockTodoRepository.updateTodo(any))
        .thenAnswer((_) async => Right(noParams));
    // act
    final result = await usecase(UpdateTodoParams(tTodo));
    // assert
    expect(result, Right(noParams));
    verify(mockTodoRepository.updateTodo(tTodo));
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
