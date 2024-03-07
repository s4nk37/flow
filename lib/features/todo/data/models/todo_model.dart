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
  }) ;

  // @JsonKey(
  //   fromJson: _fromJson,
  //   name: "id",
  // )
  // final String newId;

  // static  _fromJson(num value) => value.toInt();

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
