// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  isCompleted: json['is_completed'] as bool? ?? false,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  reminderAt: json['reminder_at'] == null
      ? null
      : DateTime.parse(json['reminder_at'] as String),
  isDeleted: json['is_deleted'] as bool? ?? false,
  isSynced: json['is_synced'] as bool? ?? false,
);

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'is_completed': instance.isCompleted,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'completed_at': instance.completedAt?.toIso8601String(),
  'reminder_at': instance.reminderAt?.toIso8601String(),
  'is_deleted': instance.isDeleted,
  'is_synced': instance.isSynced,
};
