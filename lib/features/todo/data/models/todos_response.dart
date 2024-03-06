import 'package:json_annotation/json_annotation.dart';

import 'todo_model.dart';

part 'todos_response.g.dart';

@JsonSerializable()
class TodosResponseModel {
  final List<TodoModel>? todos;
  final int updatedAt;

  TodosResponseModel({required this.todos, required this.updatedAt});

  factory TodosResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TodosResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodosResponseModelToJson(this);
}
