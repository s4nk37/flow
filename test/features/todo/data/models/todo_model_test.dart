import 'dart:convert';

import 'package:flow/features/todo/data/models/todo_model.dart';
import 'package:flow/features/todo/domain/entities/todo.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTodoModel = TodoModel(
    id: 2,
    title: 'Prepare for meeting',
    description: 'Gather presentation slides and notes',
    isCompleted: false,
    createdAt: DateTime(2017,9,7),
  );

  test('Should be a subclass of Todo entity', () async {
    // arrange

    // act

    // assert
    expect(tTodoModel, isA<Todo>());
  });

  group('fromJson', () {
    test('Should return a valid TodoModel when JSON ID is integer', () {
      // arrange
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('todo.json'));
      // act
      final result = TodoModel.fromJson(jsonMap);
      // assert
      expect(result, equals(tTodoModel));
    });
  });
}
