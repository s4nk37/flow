import 'package:dartz/dartz.dart';
import 'package:flow/core/usecases/usecase.dart';
import 'package:flow/features/todo/domain/usecases/delete_todo_by_id.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late DeleteTodoById usecase;
  late MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = DeleteTodoById(mockTodoRepository);
  });

  final noParams = NoParams();
  const tId = 1;

  test('Should call delete todo by id method successfully', () async {
    // arrange
    when(mockTodoRepository.deleteTodoById(any))
        .thenAnswer((_) async => Right(noParams));
    // act
    final result = await usecase(const DeleteTodoByIdParams(tId));
    // assert
    expect(result, Right(noParams));
    verify(mockTodoRepository.deleteTodoById(tId));
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
