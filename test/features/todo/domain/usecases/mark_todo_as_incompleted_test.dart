import 'package:dartz/dartz.dart';
import 'package:flow/core/usecases/usecase.dart';
import 'package:flow/features/todo/domain/usecases/mark_todo_as_incompleted.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MarkTodoAsIncompleted usecase;
  late MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = MarkTodoAsIncompleted(mockTodoRepository);
  });

  final noParams = NoParams();
  const tId = 1;

  test('Should call mark todo as incompleted successfully', () async {
    // arrange
    when(mockTodoRepository.markTodoAsIncompleted(any))
        .thenAnswer((_) async => Right(noParams));
    // act
    final result = await usecase(const MarkTodoAsIncompletedParams(tId));
    // assert
    expect(result, Right(noParams));
    verify(mockTodoRepository.markTodoAsIncompleted(tId));
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
