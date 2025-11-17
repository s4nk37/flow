import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/todo.dart';

part 'todo_model.g.dart';

@JsonSerializable()
//ignore: must_be_immutable.
class TodoModel extends Todo {
  const TodoModel({
    required super.id,
    required super.title,
    required super.description,
    required super.isCompleted,
    required super.createdAt,
    super.updatedAt,
    super.completedAt,
    super.reminderAt,
    required super.isDeleted,
    required super.isSynced,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  factory TodoModel.fromEntity(Todo todo) {
    return TodoModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
      createdAt: todo.createdAt,
      updatedAt: todo.updatedAt,
      completedAt: todo.completedAt,
      reminderAt: todo.reminderAt,
      isDeleted: todo.isDeleted,
      isSynced: todo.isSynced,
    );
  }

  static Todo toEntity(TodoModel todoModel) {
    return Todo(
      id: todoModel.id,
      title: todoModel.title,
      description: todoModel.description,
      isCompleted: todoModel.isCompleted,
      createdAt: todoModel.createdAt,
      updatedAt: todoModel.updatedAt,
      completedAt: todoModel.completedAt,
      reminderAt: todoModel.reminderAt,
      isDeleted: todoModel.isDeleted,
      isSynced: todoModel.isSynced,
    );
  }

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
