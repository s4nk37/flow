import 'package:flow/core/configs/app_config.dart';
import 'package:flow/core/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/services/local_notification_service.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/get_todos.dart' as usecase;
import '../../domain/usecases/save_todos.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final usecase.GetTodos getTodos;
  final SaveTodos saveTodos;

  TodoBloc({
    required this.getTodos,
    required this.saveTodos,
  }) : super(Loading()) {
    on<GetTodos>(_getTodos);
    on<AddTodo>(_addTodo);
    on<UpdateTodo>(_updateTodo);
    on<DeleteTodoById>(_deleteTodoById);
    on<MarkTodoAsCompleted>(_markTodoAsCompleted);
    on<MarkTodoAsIncompleted>(_markTodoAsIncompleted);
  }

  final List<Todo> _todos = [];
  final Map<String, int> _scheduledNotifications = {};

  void _getTodos(event, emit) async {
    emit(Loading());
    final todos = await getTodos(NoParams());
    emit(todos.fold(
      (failure) => Error(message: failure.toString()),
      (todos) {
        _todos.clear();
        _todos.addAll(todos);
        if (_todos.isEmpty) {
          return Empty();
        }
        _todos.sort((a, b) => a.isCompleted ? 1 : -1);
        return LoadedTodos(todos: _todos);
      },
    ));
  }

  void _addTodo(event, emit) async {
    emit(Loading());
    _todos.add(event.todo as Todo);
    _scheduledNotifications[event.todo.id] = _todos.length - 1;
    if (event.todo.reminderAt != null) {
      LocalNotificationService.showScheduledNotification(
        id: _scheduledNotifications[event.todo.id] ?? 0,
        title: event.todo.title,
        body: event.todo.description,
        scheduledDate: event.todo.reminderAt!.toLocal(),
      );
      final x = await LocalNotificationService.getPendingNotifications();
      logger.d('Scheduled notifications List ${x.toString()}');
    }
    await saveTodos(SaveTodosParams(_todos));
    emit(LoadedTodos(todos: _todos));
  }

  void _updateTodo(event, emit) async {
    emit(Loading());
    _todos.where((element) => element.id == event.todo.id).first.copyWith(
        title: event.todo.title,
        description: event.todo.description,
        reminderAt: event.todo.reminderAt,
        isCompleted: event.todo.isCompleted,
        completedAt: event.todo.completedAt);

    _scheduledNotifications[event.todo.id] = _todos.length - 1;
    if (event.todo.reminderAt != null) {
      LocalNotificationService.showScheduledNotification(
        id: _scheduledNotifications[event.todo.id] ?? 0,
        title: event.todo.title,
        body: event.todo.description,
        scheduledDate: event.todo.reminderAt!.toLocal(),
      );
      final x = await LocalNotificationService.getPendingNotifications();
      logger.d('Scheduled notifications List ${x.toString()}');
    }
    await saveTodos(SaveTodosParams(_todos));
    emit(LoadedTodos(todos: _todos));
  }

  void _deleteTodoById(event, emit) async {
    _todos.removeWhere((todo) {
      if (todo.id == event.id) {
        if (todo.reminderAt != null) {
          LocalNotificationService.cancelNotification(
              _scheduledNotifications[event.todo.id]!);
        }
        return true;
      } else {
        return false;
      }
    });

    if (_todos.isEmpty) emit(Empty());
    await saveTodos(SaveTodosParams(_todos));
  }

  void _markTodoAsCompleted(event, emit) async {
    final index = _todos.indexWhere((todo) => todo.id == event.id);
    DateTime? completedAt = DateTime.now().toUtc();
    _todos[index] =
        _todos[index].copyWith(isCompleted: true, completedAt: completedAt);

    _todos.sort((a, b) => a.isCompleted ? 1 : -1);
    await saveTodos(SaveTodosParams(_todos));
    emit(Loading());
    emit(LoadedTodos(todos: _todos));
  }

  void _markTodoAsIncompleted(event, emit) async {
    final index = _todos.indexWhere((todo) => todo.id == event.id);
    _todos[index] =
        _todos[index].copyWith(isCompleted: false, completedAt: null);
    _todos.sort((a, b) => a.isCompleted ? 1 : -1);
    await saveTodos(SaveTodosParams(_todos));
    emit(Loading());
    emit(LoadedTodos(todos: _todos));
  }

  // void _deleteAllTodos(event, emit) async {
  //   _todos.clear();
  //   await saveTodos(SaveTodosParams(_todos));
  //   emit(Empty());
  // }

  // void _deleteCompletedTodos(event, emit) async {
  //   _todos.removeWhere((todo) => todo.isCompleted);
  //   await saveTodos(SaveTodosParams(_todos));
  //   emit(LoadedTodos(todos: _todos));
  // }
}
