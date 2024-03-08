import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/constants/layout_constants.dart';
import '../../../../core/utils/theme/app_theme.dart';
import '../../../../core/i18n/strings.g.dart';
import '../widgets/add_todo_bottomsheet.dart';
import '../bloc/todo_bloc.dart';
import '../widgets/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(context.t.tasks),
        surfaceTintColor: AppTheme.of(context).primary,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.go(AppRouter.settingsPath);
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is Empty) {
            return Center(child: Text(context.t.no_tasks));
          } else if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedTodos) {
            return ListView.builder(
              itemCount: state.todos.length,
              padding:
                  // const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                  const EdgeInsets.only(
                      left: 25.0, right: 25.0, top: 15.0, bottom: 100),
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
        onPressed: () async {
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
              return const AddTodoBottomSheet();
            },
          );
        },
        label: Text(context.t.add_task),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
