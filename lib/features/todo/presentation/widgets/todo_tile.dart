import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/theme/app_theme.dart';
import '../../domain/entities/todo.dart';
import '../bloc/todo_bloc.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final List<BoxShadow> outerShadows = [
      BoxShadow(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black12
            : Colors.grey.withOpacity(0.3),
        spreadRadius: -2.0,
        offset: const Offset(4, 4),
        blurRadius: 8.0,
      ),
      BoxShadow(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black12
            : Colors.white,
        offset: const Offset(-4, -4),
        spreadRadius: 2.0,
        blurRadius: 8.0,
      ),
    ];

    return Dismissible(
      key: Key(todo.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 15),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          color: AppTheme.of(context).error,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white70,
        ),
      ),
      onDismissed: (direction) {
        context.read<TodoBloc>().add(DeleteTodoById(id: todo.id));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: todo.isCompleted ? null : outerShadows,
          color: todo.isCompleted
              ? AppTheme.of(context).accent3
              : AppTheme.of(context).background,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Checkbox(
              value: todo.isCompleted,
              onChanged: (value) {
                context.read<TodoBloc>().add(value!
                    ? MarkTodoAsCompleted(id: todo.id)
                    : MarkTodoAsIncompleted(id: todo.id));
              },
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      color: AppTheme.of(context).primary,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  if (todo.description.isNotEmpty)
                    Text(
                      todo.description,
                      style: TextStyle(
                        color: AppTheme.of(context).secondaryText,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
}
