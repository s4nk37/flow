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
    return Dismissible(
      key: Key(todo.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: AppTheme.of(context).error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        context.read<TodoBloc>().add(DeleteTodoById(id: todo.id));
      },
      child: ListTile(
        tileColor: todo.isCompleted ? AppTheme.of(context).accent4 : null,
        title: Text(
          todo.title,
          style: TextStyle(
            color: AppTheme.of(context).primaryText,
          ),
        ),
        subtitle: Text(
          todo.description,
          style: TextStyle(
            color: AppTheme.of(context).secondaryText,
          ),
        ),
        trailing: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) {
            context.read<TodoBloc>().add(value!
                ? MarkTodoAsCompleted(id: todo.id)
                : MarkTodoAsIncompleted(id: todo.id));
          },
        ),
      ),
    );
  }
}
