import '../../../../core/i18n/strings.g.dart';
import '../widgets/add_todo_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../widgets/todo_tile.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<TodoBloc>(context).add(GetTodos());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(context.t.tasks),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        bloc: BlocProvider.of<TodoBloc>(context),
        builder: (context, state) {
          if (state is Empty) {
            return Center(child: Text(context.t.no_tasks));
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
            return Center(child: Text(context.t.unknown_error));
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
        label: Text(context.t.add_task),
        icon: const Icon(Icons.add),
        // child: const Icon(Icons.add),
      ),
    );
  }
}
