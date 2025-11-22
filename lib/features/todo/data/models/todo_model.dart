import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/todo.dart';

part 'todo_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
//ignore: must_be_immutable.
class TodoModel extends Todo {
  const TodoModel({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
    this.updatedAt,
    this.completedAt,
    this.reminderAt,
    this.isDeleted = false,
    this.isSynced = false,
  }) : super(
          id: id,
          title: title,
          description: description,
          isCompleted: isCompleted,
          createdAt: createdAt,
          updatedAt: updatedAt,
          completedAt: completedAt,
          reminderAt: reminderAt,
          isDeleted: isDeleted,
          isSynced: isSynced,
        );

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final bool? isCompleted;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? completedAt;
  @override
  final DateTime? reminderAt;
  @override
  final bool? isDeleted;
  @override
  final bool? isSynced;

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
