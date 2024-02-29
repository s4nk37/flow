part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class Empty extends TodoState {}

final class Loading extends TodoState {}

class LoadedTodos extends TodoState {
  final List<Todo> todos;

  const LoadedTodos({required this.todos});

  @override
  List<Object> get props => [todos];
}

class Error extends TodoState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
