import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_notification_service.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/get_todos.dart' as usecase;
import '../../domain/usecases/save_todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required this.getTodos, required this.saveTodos})
    : super(Loading()) {
    on<GetTodos>(_getTodos);
    on<AddTodo>(_addTodo);
    on<UpdateTodo>(_updateTodo);
    on<DeleteTodoById>(_deleteTodoById);
    on<MarkTodoAsCompleted>(_markTodoAsCompleted);
    on<MarkTodoAsIncompleted>(_markTodoAsIncompleted);
  }

  final usecase.GetTodos getTodos;
  final SaveTodo saveTodos;

  final List<Todo> _todos = [];
  final Map<int, int> _scheduledNotifications = {}; // FIX: int keys

  // ------------------------------------------------------------------------
  // GET TODOS
  // ------------------------------------------------------------------------
  Future<void> _getTodos(GetTodos event, Emitter<TodoState> emit) async {
    emit(Loading());

    final result = await getTodos(NoParams());

    emit(
      result.fold((failure) => Error(message: failure.toString()), (todos) {
        _todos
          ..clear()
          ..addAll(todos);

        if (_todos.isEmpty) return Empty();

        _todos.sort((a, b) => a.isCompleted ? 1 : -1);
        return LoadedTodos(todos: List.from(_todos));
      }),
    );
  }

  // ------------------------------------------------------------------------
  // ADD TODO
  // ------------------------------------------------------------------------
  Future<void> _addTodo(AddTodo event, Emitter<TodoState> emit) async {
    final todo = event.todo;

    // schedule notification
    if (todo.reminderAt != null) {
      final notifId = Random().nextInt(999999);
      _scheduledNotifications[todo.id] = notifId;

      LocalNotificationService.showScheduledNotification(
        id: notifId,
        title: todo.title,
        body: todo.description,
        scheduledDate: todo.reminderAt!.toLocal(),
      );
    }

    await saveTodos(SaveTodoParams(todo));

    _todos.add(todo);
    _todos.sort((a, b) => a.isCompleted ? 1 : -1);

    emit(LoadedTodos(todos: List.from(_todos)));
  }

  // ------------------------------------------------------------------------
  // UPDATE TODO
  // ------------------------------------------------------------------------
  Future<void> _updateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    final index = _todos.indexWhere((t) => t.id == event.todo.id);
    if (index == -1) return;

    // replace the updated todo in list
    _todos[index] = event.todo;

    // schedule new notification
    if (event.todo.reminderAt != null) {
      final notifId = Random().nextInt(999999);
      _scheduledNotifications[event.todo.id] = notifId;

      LocalNotificationService.showScheduledNotification(
        id: notifId,
        title: event.todo.title,
        body: event.todo.description,
        scheduledDate: event.todo.reminderAt!.toLocal(),
      );
    }

    await saveTodos(SaveTodoParams(event.todo));

    _todos.sort((a, b) => a.isCompleted ? 1 : -1);
    emit(LoadedTodos(todos: List.from(_todos)));
  }

  // ------------------------------------------------------------------------
  // DELETE TODO
  // ------------------------------------------------------------------------
  Future<void> _deleteTodoById(
    DeleteTodoById event,
    Emitter<TodoState> emit,
  ) async {
    final index = _todos.indexWhere((todo) => todo.id == event.id);
    if (index == -1) return;

    final todo = _todos[index];

    // cancel notification
    final notifId = _scheduledNotifications[todo.id];
    if (notifId != null) {
      LocalNotificationService.cancelNotification(notifId);
      _scheduledNotifications.remove(todo.id);
    }

    // remove from list
    _todos.removeAt(index);

    if (_todos.isEmpty) {
      emit(Empty());
    } else {
      emit(LoadedTodos(todos: List.from(_todos)));
    }
  }

  // ------------------------------------------------------------------------
  // MARK AS COMPLETED
  // ------------------------------------------------------------------------
  Future<void> _markTodoAsCompleted(
    MarkTodoAsCompleted event,
    Emitter<TodoState> emit,
  ) async {
    final index = _todos.indexWhere((todo) => todo.id == event.id);
    if (index == -1) return;

    final completedAt = DateTime.now().toUtc();

    final updatedTodo = _todos[index].copyWith(
      isCompleted: true,
      completedAt: completedAt,
    );

    _todos[index] = updatedTodo;
    _todos.sort((a, b) => a.isCompleted ? 1 : -1);

    await saveTodos(SaveTodoParams(updatedTodo));

    emit(LoadedTodos(todos: List.from(_todos)));
  }

  // ------------------------------------------------------------------------
  // MARK AS INCOMPLETED
  // ------------------------------------------------------------------------
  Future<void> _markTodoAsIncompleted(
    MarkTodoAsIncompleted event,
    Emitter<TodoState> emit,
  ) async {
    final index = _todos.indexWhere((todo) => todo.id == event.id);
    if (index == -1) {
      return;
    }

    final updatedTodo = _todos[index].copyWith(
      isCompleted: false,
      completedAt: null,
    );

    _todos[index] = updatedTodo;
    _todos.sort((a, b) => a.isCompleted ? 1 : -1);

    await saveTodos(SaveTodoParams(updatedTodo));

    emit(LoadedTodos(todos: List.from(_todos)));
  }
}
