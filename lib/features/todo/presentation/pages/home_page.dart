import '../../../../core/widgets/theme_button.dart';
import '../widgets/add_todo_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../widgets/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<TodoBloc>(context).add(GetTodos());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: false,
        actions: const [ThemeButton(), SizedBox(width: 0)],
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
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
      floatingActionButton: FloatingActionButton.extended(
        elevation: 1.0,
        isExtended: true,

        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            builder: (context) {
              return const AddTodoBottomSheet();
            },
          );
        },
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
        // child: const Icon(Icons.add),
      ),
    );
  }
}
