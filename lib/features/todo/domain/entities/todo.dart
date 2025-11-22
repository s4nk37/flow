import 'package:equatable/equatable.dart';

//ignore: must_be_immutable.
class Todo extends Equatable {
  const Todo({
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
  });

  final String id;
  final String title;
  final String description;
  final bool? isCompleted;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? completedAt;
  final DateTime? reminderAt;
  final bool? isDeleted;
  final bool? isSynced;

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? completedAt,
    DateTime? reminderAt,
    bool? isDeleted,
    bool? isSynced,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: isCompleted == true ? completedAt ?? this.completedAt : null,
      reminderAt: reminderAt ?? this.reminderAt,
      isDeleted: isDeleted ?? this.isDeleted,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  String toString() {
    return 'Todo(id: $id, title: "$title", description: "$description", isCompleted: $isCompleted, createdAt: $createdAt, updatedAt: $updatedAt, completedAt: $completedAt, reminderAt: $reminderAt, '
        'isDeleted: $isDeleted, isSynced: $isSynced)';
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
    reminderAt,
    isDeleted,
    isSynced,
  ];
}
