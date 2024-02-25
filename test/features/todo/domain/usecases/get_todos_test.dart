import 'package:dartz/dartz.dart';
import 'package:flow/core/usecases/usecase.dart';
import 'package:flow/features/todo/domain/entities/todo.dart';
import 'package:flow/features/todo/domain/repositories/todo_repository.dart';
import 'package:flow/features/todo/domain/usecases/get_todos.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<TodoRepository>()])
import 'get_todos_test.mocks.dart';

void main() {
  late GetTodos usecase;
  late MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = GetTodos(mockTodoRepository);
  });

  final tTodos = <Todo>[
    Todo(
      id: 1,
      title: "Buy Veg",
      description: "a",
      isCompleted: false,
      createdAt: DateTime(2024, 2, 10, 17, 30),
      updatedAt: null,
      completedAt: null,
      reminderAt: null,
    ),
    Todo(
      id: 1,
      title: "Buy Veg",
      description: "a",
      isCompleted: false,
      createdAt: DateTime(2024, 2, 10, 17, 30),
      updatedAt: null,
      completedAt: null,
      reminderAt: null,
    ),
  ];

  test('Should get todos', () async {
    // arrange
    when(mockTodoRepository.getTodos()).thenAnswer((_) async => Right(tTodos));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, Right(tTodos));
    verify(mockTodoRepository.getTodos());
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
