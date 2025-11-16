import 'package:equatable/equatable.dart';

//ignore: must_be_immutable.
class Todo extends Equatable {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? completedAt;
  final DateTime? reminderAt;

  const Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
    this.updatedAt,
    this.completedAt,
    this.reminderAt,
  });

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? completedAt,
    DateTime? reminderAt,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      //completedAt: completedAt ?? this.completedAt,
      completedAt: isCompleted == true ? completedAt ?? this.completedAt : null,
      reminderAt: reminderAt ?? this.reminderAt,
    );
  }

  @override
  String toString() {
    return 'Todo(id: $id, title: "$title", description: "$description", isCompleted: $isCompleted, createdAt: $createdAt, updatedAt: $updatedAt, completedAt: $completedAt, reminderAt: $reminderAt)';
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
        createdAt,
        updatedAt,
        completedAt,
        reminderAt
      ];
}
