import 'package:equatable/equatable.dart';

//ignore: must_be_immutable.
class Todo extends Equatable {
  final int id;
  final String title;
  final String description;
  bool isCompleted;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? completedAt;
  final DateTime? reminderAt;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
    this.updatedAt,
    this.completedAt,
    this.reminderAt,
  });

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
