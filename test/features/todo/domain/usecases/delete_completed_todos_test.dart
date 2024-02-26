import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flow/core/usecases/usecase.dart';

import 'package:flow/features/todo/domain/usecases/delete_completed_todos.dart';

import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late DeleteCompletedTodos usecase;
  late MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = DeleteCompletedTodos(mockTodoRepository);
  });

  final noParams = NoParams();

  test('Should successfully deleted completed todos', () async {
    // arrange
    when(mockTodoRepository.deleteCompletedTodos())
        .thenAnswer((_) async => Right(noParams));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, Right(noParams));
    verify(mockTodoRepository.deleteCompletedTodos());
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
