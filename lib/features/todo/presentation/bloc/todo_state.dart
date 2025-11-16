part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class Empty extends TodoState {}

final class Loading extends TodoState {}

class LoadedTodos extends TodoState {
  const LoadedTodos({required this.todos});
  final List<Todo> todos;

  @override
  List<Object> get props => [todos];
}

class Error extends TodoState {
  const Error({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
