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
    createdAt: DateTime(2017, 9, 7, 0, 0, 0).toUtc(),
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

    test('Should return a valid TodoModel when JSON ID is double', () {
      // arrange
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('todo.json'));
      // act
      final result = TodoModel.fromJson(jsonMap);
      // assert
      expect(result, equals(tTodoModel));
    });
  });

  group('toJson', () {
    test('Should return a valid JSON containing the proper data', () {
      // arrange
      final result = tTodoModel.toJson();
      // act
      final expectedMap = {
        'id': 1,
        'title': 'Prepare for meeting',
        'description': 'Gather presentation slides and notes',
        'isCompleted': false,
        'createdAt': '2017-09-06T18:30:00.000Z',
        'updatedAt': null,
        'completedAt': null,
        'reminderAt': null,
      };
      // assert
      expect(expectedMap, equals(result));
    });
  });
}
