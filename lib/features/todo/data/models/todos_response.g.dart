// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodosResponseModel _$TodosResponseModelFromJson(Map<String, dynamic> json) =>
    TodosResponseModel(
      todos: (json['todos'] as List<dynamic>?)
          ?.map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: (json['updatedAt'] as num).toInt(),
    );

Map<String, dynamic> _$TodosResponseModelToJson(TodosResponseModel instance) =>
    <String, dynamic>{'todos': instance.todos, 'updatedAt': instance.updatedAt};
