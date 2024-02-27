// Mocks generated by Mockito 5.4.4 from annotations
// in flow/test/helpers/test_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flow/core/errors/failures.dart' as _i6;
import 'package:flow/core/network/network_info.dart' as _i10;
import 'package:flow/core/usecases/usecase.dart' as _i7;
import 'package:flow/features/todo/data/datasources/todo_local_datasource.dart'
    as _i9;
import 'package:flow/features/todo/data/datasources/todo_remote_datasource.dart'
    as _i8;
import 'package:flow/features/todo/domain/entities/todo.dart' as _i3;
import 'package:flow/features/todo/domain/repositories/todo_repository.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTodo_1 extends _i1.SmartFake implements _i3.Todo {
  _FakeTodo_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TodoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRepository extends _i1.Mock implements _i4.TodoRepository {
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i3.Todo>>> getTodos() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTodos,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i3.Todo>>>.value(
            _FakeEither_0<_i6.Failure, List<_i3.Todo>>(
          this,
          Invocation.method(
            #getTodos,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i6.Failure, List<_i3.Todo>>>.value(
                _FakeEither_0<_i6.Failure, List<_i3.Todo>>(
          this,
          Invocation.method(
            #getTodos,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i3.Todo>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i3.Todo>> getTodoById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTodoById,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i3.Todo>>.value(
            _FakeEither_0<_i6.Failure, _i3.Todo>(
          this,
          Invocation.method(
            #getTodoById,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i6.Failure, _i3.Todo>>.value(
                _FakeEither_0<_i6.Failure, _i3.Todo>(
          this,
          Invocation.method(
            #getTodoById,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i3.Todo>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>> addTodo(_i3.Todo? todo) =>
      (super.noSuchMethod(
        Invocation.method(
          #addTodo,
          [todo],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
            _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #addTodo,
            [todo],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
                _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #addTodo,
            [todo],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>> updateTodo(
          _i3.Todo? todo) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateTodo,
          [todo],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
            _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #updateTodo,
            [todo],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
                _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #updateTodo,
            [todo],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>> deleteTodoById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteTodoById,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
            _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #deleteTodoById,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
                _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #deleteTodoById,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>> deleteAllTodos() =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteAllTodos,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
            _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #deleteAllTodos,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
                _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #deleteAllTodos,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>> deleteCompletedTodos() =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteCompletedTodos,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
            _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #deleteCompletedTodos,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
                _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #deleteCompletedTodos,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>> markTodoAsCompleted(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #markTodoAsCompleted,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
            _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #markTodoAsCompleted,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
                _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #markTodoAsCompleted,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>> markTodoAsIncompleted(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #markTodoAsIncompleted,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
            _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #markTodoAsIncompleted,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>.value(
                _FakeEither_0<_i6.Failure, _i7.NoParams>(
          this,
          Invocation.method(
            #markTodoAsIncompleted,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.NoParams>>);
}

/// A class which mocks [TodoRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRemoteDataSource extends _i1.Mock
    implements _i8.TodoRemoteDataSource {
  @override
  _i5.Future<List<_i3.Todo>> getTodos() => (super.noSuchMethod(
        Invocation.method(
          #getTodos,
          [],
        ),
        returnValue: _i5.Future<List<_i3.Todo>>.value(<_i3.Todo>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i3.Todo>>.value(<_i3.Todo>[]),
      ) as _i5.Future<List<_i3.Todo>>);

  @override
  _i5.Future<_i3.Todo> getTodoById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTodoById,
          [id],
        ),
        returnValue: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #getTodoById,
            [id],
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #getTodoById,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Todo>);

  @override
  _i5.Future<void> addTodo(_i3.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #addTodo,
          [todo],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> updateTodo(_i3.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #updateTodo,
          [todo],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteTodoById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteTodoById,
          [id],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteAllTodos() => (super.noSuchMethod(
        Invocation.method(
          #deleteAllTodos,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteCompletedTodos() => (super.noSuchMethod(
        Invocation.method(
          #deleteCompletedTodos,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> markTodoAsCompleted(int? id) => (super.noSuchMethod(
        Invocation.method(
          #markTodoAsCompleted,
          [id],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> markTodoAsIncompleted(int? id) => (super.noSuchMethod(
        Invocation.method(
          #markTodoAsIncompleted,
          [id],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [TodoLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoLocalDataSource extends _i1.Mock
    implements _i9.TodoLocalDataSource {
  @override
  _i5.Future<List<_i3.Todo>> getTodos() => (super.noSuchMethod(
        Invocation.method(
          #getTodos,
          [],
        ),
        returnValue: _i5.Future<List<_i3.Todo>>.value(<_i3.Todo>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i3.Todo>>.value(<_i3.Todo>[]),
      ) as _i5.Future<List<_i3.Todo>>);

  @override
  _i5.Future<void> cacheTodos(List<_i3.Todo>? todos) => (super.noSuchMethod(
        Invocation.method(
          #cacheTodos,
          [todos],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<_i3.Todo> getTodoById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTodoById,
          [id],
        ),
        returnValue: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #getTodoById,
            [id],
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #getTodoById,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Todo>);

  @override
  _i5.Future<void> addTodo(_i3.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #addTodo,
          [todo],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> updateTodo(_i3.Todo? todo) => (super.noSuchMethod(
        Invocation.method(
          #updateTodo,
          [todo],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteTodoById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteTodoById,
          [id],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteAllTodos() => (super.noSuchMethod(
        Invocation.method(
          #deleteAllTodos,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteCompletedTodos() => (super.noSuchMethod(
        Invocation.method(
          #deleteCompletedTodos,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> markTodoAsCompleted(int? id) => (super.noSuchMethod(
        Invocation.method(
          #markTodoAsCompleted,
          [id],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> markTodoAsIncompleted(int? id) => (super.noSuchMethod(
        Invocation.method(
          #markTodoAsIncompleted,
          [id],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i10.NetworkInfo {
  @override
  _i5.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}
