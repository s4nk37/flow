import 'package:flow/features/todo/domain/entities/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/configs/app_config.dart';
import '../../../../core/utils/theme/app_theme.dart';
import '../bloc/todo_bloc.dart';

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({super.key});

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _taskController = TextEditingController();
  late final TextEditingController _titleController = TextEditingController();
  late final TextEditingController _descriptionController =
      TextEditingController();
  late final TextEditingController _reminderController =
      TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _reminderController.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      // Save the task logic here
      String task = _taskController.text;
      Todo newTodo = Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        title: task,
        description: _descriptionController.text,
        isCompleted: false,
        createdAt: DateTime.now(),
        reminderAt: _reminderController.text.isNotEmpty
            ? DateFormat('yyyy-MM-dd').parse(_reminderController.text)
            : null,
      );
      // context.read<TodoBloc>().add(AddTodo(todo:newTodo));
      BlocProvider.of<TodoBloc>(context).add(AddTodo(todo: newTodo));

      logger.d('Saving task: $task');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: _taskController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Task',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Enter description (optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _reminderController,
                decoration: const InputDecoration(
                  hintText: 'Enter reminder date (optional)',
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    _reminderController.text =
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                  }
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveTask,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.of(context).primary,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Add Task',
                  style: TextStyle(
                    color: AppTheme.of(context).background,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
