part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetTodos extends TodoEvent {}

class GetTodoById extends TodoEvent {
  const GetTodoById({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}

class AddTodo extends TodoEvent {
  const AddTodo({required this.todo});
  final Todo todo;

  @override
  List<Object> get props => [todo];
}

class UpdateTodo extends TodoEvent {
  const UpdateTodo({required this.todo});
  final Todo todo;

  @override
  List<Object> get props => [todo];
}

class DeleteTodoById extends TodoEvent {
  const DeleteTodoById({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}

class DeleteAllTodos extends TodoEvent {}

class DeleteCompletedTodos extends TodoEvent {}

class MarkTodoAsCompleted extends TodoEvent {
  const MarkTodoAsCompleted({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}

class MarkTodoAsIncompleted extends TodoEvent {
  const MarkTodoAsIncompleted({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}

class SetTodoReminder extends TodoEvent {
  const SetTodoReminder({required this.id, required this.reminderAt});
  final String id;
  final DateTime reminderAt;

  @override
  List<Object> get props => [id, reminderAt];
}

class RemoveTodoReminder extends TodoEvent {
  const RemoveTodoReminder({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}

class SyncTodos extends TodoEvent {}
