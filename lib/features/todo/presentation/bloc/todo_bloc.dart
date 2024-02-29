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

  void _deleteTodo() async {}
}
