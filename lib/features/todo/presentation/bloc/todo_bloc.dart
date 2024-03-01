import 'package:flow/core/configs/app_config.dart';
import 'package:flow/core/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

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
    on<DeleteTodoById>(_deleteTodoById);
    on<MarkTodoAsCompleted>(_markTodoAsCompleted);
    on<MarkTodoAsIncompleted>(_markTodoAsIncompleted);
  }

  final List<Todo> _todos = [];

  void _getTodos(event, emit) async {
    emit(Loading());
    final todos = await getTodos(NoParams());
    emit(todos.fold(
      (failure) => Error(message: failure.toString()),
      (todos) {
        _todos.clear();
        _todos.addAll(todos);
        if (todos.isEmpty) {
          return Empty();
        }
        return LoadedTodos(todos: _todos);
      },
    ));
  }

  void _addTodo(event, emit) async {
    emit(Loading());
    _todos.add(event.todo);
    await saveTodos(SaveTodosParams(_todos));
    emit(LoadedTodos(todos: _todos));
  }

  void _deleteTodoById(event, emit) async {
    logger.d("Before ${event.id} Todos: $_todos");
    _todos.removeWhere((todo) => todo.id == event.id);
    logger.d(_todos);
    await saveTodos(SaveTodosParams(_todos));
  }

  void _markTodoAsCompleted(event, emit) async {
    final index = _todos.indexWhere((todo) => todo.id == event.id);
    _todos[index].isCompleted = true;
    await saveTodos(SaveTodosParams(_todos));
    emit(Loading());
    emit(LoadedTodos(todos: _todos));
  }

  void _markTodoAsIncompleted(event, emit) async {
    final index = _todos.indexWhere((todo) => todo.id == event.id);
    _todos[index].isCompleted = false;
    await saveTodos(SaveTodosParams(_todos));
    emit(Loading());
    emit(LoadedTodos(todos: _todos));
  }

  void _deleteAllTodos(event, emit) async {
    _todos.clear();
    await saveTodos(SaveTodosParams(_todos));
    emit(Empty());
  }

  void _deleteCompletedTodos(event, emit) async {
    _todos.removeWhere((todo) => todo.isCompleted);
    await saveTodos(SaveTodosParams(_todos));
    emit(LoadedTodos(todos: _todos));
  }
}
