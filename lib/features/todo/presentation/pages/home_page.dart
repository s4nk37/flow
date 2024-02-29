import 'package:flow/core/utils/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/theme/app_theme.dart';
import '../../domain/entities/todo.dart';
import '../bloc/todo_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodoBloc>(context).add(GetTodos());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tasks'),
          actions: [
            IconButton(
              icon:
                  BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, state) {
                if (state == ThemeMode.dark) {
                  return const Icon(Icons.nightlight_round);
                } else if (state == ThemeMode.light) {
                  return const Icon(Icons.wb_sunny);
                } else {
                  return const Icon(Icons.brightness_auto_sharp);
                }
              }),
              onPressed: () => context.read<ThemeCubit>().changeTheme(),
            ),
          ],
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          bloc: BlocProvider.of<TodoBloc>(context),
          builder: (context, state) {
            if (state is Empty) {
              return const Center(child: Text('No tasks yet'));
            } else if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedTodos) {
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, i) {
                  return TodoTile(todo: state.todos[i]);
                },
              );
            } else if (state is Error) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Unknown error'));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final todo = Todo(
              id: 1,
              title: 'New Task',
              description: 'Description',
              isCompleted: false,
              createdAt: DateTime.now(),
            );
            context.read<TodoBloc>().add(AddTodo(todo: todo));
          },
          child: const Icon(Icons.add),
        ));
  }
}

class TodoTile extends StatelessWidget {
  final Todo todo;
  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
          // context.read<TodoBloc>().add(MarkTodoAsCompleted(todo.id));
        },
      ),
    );
  }
}
