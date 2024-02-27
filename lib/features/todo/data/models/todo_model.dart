import '../../domain/entities/todo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';


@JsonSerializable()
class TodoModel extends Todo {
  const TodoModel({
    required this.newId,
    required super.title,
    required super.description,
    required super.isCompleted,
    required super.createdAt,
    super.updatedAt,
    super.completedAt,
    super.reminderAt,
  }) : super(id: newId);

  @JsonKey(
    fromJson: _fromJson,
    name: "id",
  )
  final int newId;

  static int _fromJson(num value) => value.toInt();

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
