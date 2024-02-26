import 'package:flow/features/todo/data/models/todo_model.dart';
import 'package:flow/features/todo/domain/entities/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTodoModel = TodoModel(
    id: 1,
    title: 'Test',
    description: 'Test',
    isCompleted: false,
    createdAt: DateTime.now(),
  );

  test('Should be a subclass of Todo entity', () async {
    // arrange

    // act

    // assert
    expect(tTodoModel, isA<Todo>());
  });
}
