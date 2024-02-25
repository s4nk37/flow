import 'package:dartz/dartz.dart';
import 'package:flow/features/todo/domain/entities/todo.dart';
import 'package:flow/features/todo/domain/repositories/todo_repository.dart';
import 'package:flow/features/todo/domain/usecases/get_todo_by_id.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<TodoRepository>()])
import 'get_to_do_by_id_test.mocks.dart';

void main() {
  late GetTodoById usecase;
  late MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = GetTodoById(mockTodoRepository);
  });

  const tId = 1;
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

  test('Should get todo for any Id', () async {
    // arrange
    when(mockTodoRepository.getTodoById(any))
        .thenAnswer((_) async => Right(tTodo));
    // act
    final result = await usecase(const Params(tId));
    // assert
    expect(result, Right(tTodo));
    verify(mockTodoRepository.getTodoById(tId));
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
