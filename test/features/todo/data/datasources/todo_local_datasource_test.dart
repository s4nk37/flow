import 'dart:convert';

import 'package:flow/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:flow/features/todo/data/models/todo_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late TodoLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        TodoLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('Get Last Cached Todos', () {
    final jsonMap = jsonDecode(fixture('todos.json')) as Map<String, dynamic>;
    final todoList = jsonMap['todos'] as List<dynamic>;
    final List<TodoModel> tTodosModel =
        todoList.map((todoJson) => TodoModel.fromJson(todoJson)).toList();

    test('Should return todos from sharedprefs when there are in cache',
        () async {
      // arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('todos.json'));
      // act
      final result = await dataSource.getTodos();
      // assert
      verify(mockSharedPreferences.getString('CACHED_TODOS'));
      expect(result, equals(tTodosModel));
    });
  });
}
