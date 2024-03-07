part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetTodos extends TodoEvent {}

class GetTodoById extends TodoEvent {
  final int id;

  const GetTodoById({required this.id});

  @override
  List<Object> get props => [id];
}

class AddTodo extends TodoEvent {
  final Todo todo;

  const AddTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class UpdateTodo extends TodoEvent {
  final Todo todo;

  const UpdateTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class DeleteTodoById extends TodoEvent {
  final String id;

  const DeleteTodoById({required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteAllTodos extends TodoEvent {}

class DeleteCompletedTodos extends TodoEvent {}

class MarkTodoAsCompleted extends TodoEvent {
  final String id;

  const MarkTodoAsCompleted({required this.id});

  @override
  List<Object> get props => [id];
}

class MarkTodoAsIncompleted extends TodoEvent {
  final String id;

  const MarkTodoAsIncompleted({required this.id});

  @override
  List<Object> get props => [id];
}

class SetTodoReminder extends TodoEvent {
  final int id;
  final DateTime reminderAt;

  const SetTodoReminder({required this.id, required this.reminderAt});

  @override
  List<Object> get props => [id, reminderAt];
}

class RemoveTodoReminder extends TodoEvent {
  final int id;

  const RemoveTodoReminder({required this.id});

  @override
  List<Object> get props => [id];
}
