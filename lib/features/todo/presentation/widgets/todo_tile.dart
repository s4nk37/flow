import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constants/layout_constants.dart';
import '../../../../core/utils/theme/app_theme.dart';
import '../../domain/entities/todo.dart';
import '../bloc/todo_bloc.dart';
import 'todo_bottomsheet.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final List<BoxShadow> outerShadows = [
      BoxShadow(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black54
            : Colors.grey.withOpacity(0.3),
        spreadRadius: 0.0,
        offset: const Offset(4, 4),
        blurRadius: 8.0,
      ),
      BoxShadow(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(255, 26, 26, 26)
            : Colors.white,
        offset: const Offset(-4, -4),
        spreadRadius: 0.0,
        blurRadius: 8.0,
      ),
    ];

    return Dismissible(
      key: UniqueKey(),
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
        child: const Icon(Icons.delete, color: Colors.white70),
      ),
      onDismissed: (direction) {
        context.read<TodoBloc>().add(DeleteTodoById(id: todo.id));
      },
      child: GestureDetector(
        onTap: () async {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppTheme.of(context).disabled,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(RadiusConstant.commonRadius),
                topRight: Radius.circular(RadiusConstant.commonRadius),
              ),
            ),
            builder: (context) {
              return TodoBottomSheet(todo: todo);
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: todo.isCompleted ? null : outerShadows,
            color: todo.isCompleted
                ? AppTheme.of(context).disabled
                : AppTheme.of(context).background,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Checkbox(
                value: todo.isCompleted,
                onChanged: (value) {
                  context.read<TodoBloc>().add(
                    value!
                        ? MarkTodoAsCompleted(id: todo.id)
                        : MarkTodoAsIncompleted(id: todo.id),
                  );
                },
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(color: AppTheme.of(context).primary),
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
              if (todo.reminderAt != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20,
                  ),
                  child: Icon(
                    Icons.notifications_active,
                    size: 20.0,
                    color: AppTheme.of(context).primary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
