import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flow/core/usecases/usecase.dart';

import 'package:flow/features/todo/domain/usecases/delete_all_todos.dart';

import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late DeleteAllTodos usecase;
  late MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = DeleteAllTodos(mockTodoRepository);
  });

  final noParams = NoParams();

  test('Should successfully deleted all todos', () async {
    // arrange
    when(mockTodoRepository.deleteAllTodos())
        .thenAnswer((_) async => Right(noParams));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, Right(noParams));
    verify(mockTodoRepository.deleteAllTodos());
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
